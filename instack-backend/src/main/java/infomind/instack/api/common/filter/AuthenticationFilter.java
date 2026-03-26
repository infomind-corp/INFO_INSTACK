package infomind.instack.api.common.filter;

import egovframework.let.utl.fcc.service.EgovStringUtil;
import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import infomind.instack.api.common.util.JwtUtil;
import infomind.instack.api.common.util.jwt.InvalidJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * JWT 인증 필터 (INSTACK).
 * <p>매 요청마다 {@code Authorization} 헤더의 Bearer 토큰을 파싱하여 {@link infomind.instack.api.auth.jwt.entity.AuthUserVO}를
 * 생성하고 {@code SecurityContextHolder}에 인증 정보를 설정한다.</p>
 */
@RequiredArgsConstructor
public class AuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private final JwtUtil jwtUtil;

    /**
     * 요청 헤더의 Bearer 토큰을 파싱하여 SecurityContextHolder에 인증 정보를 설정한다.
     * 토큰이 유효하면 AuthUserVO를 생성하고 권한 정보를 매핑한다.
     *
     * @param req   HTTP 요청
     * @param res   HTTP 응답
     * @param chain FilterChain
     * @throws IOException      I/O 오류 발생 시
     * @throws ServletException 서블릿 처리 중 오류 발생 시
     */
    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        // step 1. request header에서 토큰을 가져온다.
        String bearerToken = EgovStringUtil.isNullToString(req.getHeader(JwtUtil.AUTHORIZATION));

        if (StringUtils.hasText(bearerToken)) {
            String jwtToken = extractToken(bearerToken);

            // step 2. 토큰에 내용이 있는지 확인해서 id값을 가져옴
            // Exception 핸들링 추가처리 (토큰 유효성, 토큰 변조 여부, 토큰 만료여부)
            // 내부적으로 parse하는 과정에서 해당 여부들이 검증됨
            try {
                AuthUserVO authUserVO = jwtUtil.getAuthUserFromToken(jwtToken);
                logger.debug("===>>> id = " + authUserVO.getId());
                logger.debug("jwtToken validated");
                logger.debug("===>>> loginVO.getUserSe() = "+ authUserVO.getUserSe());

                // authorities에서 authCd 추출하여 role 매핑 (만료되지 않은 권한만)
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                if (authUserVO.getAuthorities() != null && !authUserVO.getAuthorities().isEmpty()) {
                    authUserVO.getAuthorities().forEach(auth -> {
                        if (auth.getAuthCd() != null && auth.isValid()) {
                            authorities.add(new SimpleGrantedAuthority(auth.getAuthCd()));
                            logger.debug("===>>> Added authority: " + auth.getAuthCd());
                        } else if (auth.getAuthCd() != null && auth.isExpired()) {
                            logger.debug("===>>> Expired authority: " + auth.getAuthCd() + " (expDate: " + auth.getAuthExpYmd() + ")");
                        }
                    });
                }

                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                        authUserVO, null, authorities
                );

                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(req));
                SecurityContextHolder.getContext().setAuthentication(authentication);

                logger.debug("authentication ===>>> " + authentication);
            } catch (InvalidJwtException e) {
                logger.debug(e.getMessage());
            }
        }

        chain.doFilter(req, res);
    }

    /**
     * Authorization 헤더에서 Bearer 토큰을 추출한다.
     * "Bearer " 프리픽스를 제거하고 실제 토큰 값을 반환한다.
     *
     * @param bearerToken Authorization 헤더 값
     * @return 추출된 JWT 토큰
     * @throws IllegalArgumentException Bearer 형식이 올바르지 않거나 토큰이 없는 경우
     */
    private String extractToken(String bearerToken) {
        // 공백 제거
        bearerToken = bearerToken.trim();

        // "Bearer " 확인 (대소문자 구분 없음)
        if (!bearerToken.toLowerCase().startsWith("bearer ")) {
            throw new IllegalArgumentException("Authorization 헤더는 'Bearer '로 시작해야 합니다.");
        }

        // "Bearer " 제거 (7글자)
        String token = bearerToken.substring(7).trim();

        if (token.isEmpty()) {
            throw new IllegalArgumentException("Bearer 뒤에 토큰이 없습니다.");
        }

        return token;
    }
}
