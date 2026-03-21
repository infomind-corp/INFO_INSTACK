package infomind.instack.api.common.filter;

import egovframework.let.utl.fcc.service.EgovStringUtil;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
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
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Arrays;

/**
 * fileName       : JwtAuthenticationFilter
 * author         : crlee
 * date           : 2023/06/11
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/06/11        crlee       최초 생성
 */
@RequiredArgsConstructor
public class AuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private final JwtUtil jwtUtil;

    @Override //로그인 이후 HttpServletRequest 요청할 때마다 실행(스프링의 AOP기능)
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        // step 1. request header에서 토큰을 가져온다.
        String jwtToken = EgovStringUtil.isNullToString(req.getHeader(JwtUtil.AUTHORIZATION));


        // step 2. 토큰에 내용이 있는지 확인해서 id값을 가져옴
        // Exception 핸들링 추가처리 (토큰 유효성, 토큰 변조 여부, 토큰 만료여부)
        // 내부적으로 parse하는 과정에서 해당 여부들이 검증됨
        try {
            AuthUserVO authUserVO = jwtUtil.getAuthUserFromToken(jwtToken);
            logger.debug("===>>> id = " + authUserVO.getMemberId());
            logger.debug("jwtToken validated");
            logger.debug("===>>> loginVO.getUserSe() = "+ authUserVO.getAuthLevel());

            String role = isAdmin(authUserVO) ? "ROLE_ADMIN" : "ROLE_USER";

            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                    authUserVO, null, Arrays.asList(new SimpleGrantedAuthority(role))
            );

            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(req));
            SecurityContextHolder.getContext().setAuthentication(authentication);

            logger.debug("authentication ===>>> " + authentication);
        } catch (InvalidJwtException e) {
            logger.debug(e.getMessage());
        }

        chain.doFilter(req, res);
    }

    private boolean isAdmin(AuthUserVO authUserVO) {
        return "ROLE_ADMIN".equals(authUserVO.getAuthLevel());
    }
}
