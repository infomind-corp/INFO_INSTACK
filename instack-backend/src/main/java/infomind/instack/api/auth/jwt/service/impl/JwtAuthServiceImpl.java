package infomind.instack.api.auth.jwt.service.impl;

import infomind.instack.api.auth.jwt.dao.JwtAuthDao;
import infomind.instack.api.auth.jwt.service.JwtAuthService;
import infomind.instack.api.auth.admin.entity.CmsRefreshTokenVO;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.model.RefreshRequest;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.crypto.EgovPasswordEncoder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 통합 JWT 인증 서비스 구현
 * <p>사용자 구분(userSe: A=관리자, E=업무사용자, G=일반사용자)에 따라
 * 각 테이블(CMS_USER_ADMIN, CMS_USER_TASK, CMS_USER)에서 사용자를 조회하여 JWT 토큰 발급</p>
 */
@Service
@RequiredArgsConstructor
public class JwtAuthServiceImpl extends EgovAbstractServiceImpl implements JwtAuthService {

    private final JwtAuthDao jwtAuthDao;
    private final EgovPasswordEncoder egovPasswordEncoder;
    private final JwtUtil jwtUtil;

    @Value("${Globals.jwt.expiration}")
    private long accessTokenExpiration;

    @Value("${Globals.jwt.refreshExpiration}")
    private long refreshTokenExpireTime;

    @Override
    public LoginResponse login(String userSe, LoginRequest request) {
        // userSe 검증 및 사용자 조회
        AuthUserVO authUserVO = switch (userSe) {
            case "A" -> jwtAuthDao.selectAdminUserByUserId(request.getLoginId())
                    .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));
            case "E" -> jwtAuthDao.selectTaskUserByUserId(request.getLoginId())
                    .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));
            case "G" -> jwtAuthDao.selectUserByUserId(request.getLoginId())
                    .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));
            default -> throw new BizException("유효하지 않은 사용자 구분입니다.", HttpStatus.BAD_REQUEST);
        };

        // 비밀번호 조회
        String pwd = jwtAuthDao.selectPasswordByUserId(request.getLoginId(), userSe)
                .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));

        // 비밀번호 검증
        if (!egovPasswordEncoder.checkPassword(request.getPassword(), pwd)) {
            throw new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED);
        }

        // userSe 설정 (JWT 클레임에 포함될 값)
        authUserVO.setUserSe(userSe);

        return makeLoginResponse(authUserVO);
    }

    @Override
    public LoginResponse refresh(RefreshRequest request) {
        // Refresh Token 유효성 검증
        if (!jwtUtil.isValid(request.getRefreshToken())) {
            throw new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }

        // 토큰에서 userId 추출
        String userId = jwtUtil.getIdFromToken(request.getRefreshToken());

        // DB에 저장된 Refresh Token 확인
        CmsRefreshTokenVO storedToken = jwtAuthDao.selectRefreshTokenByUserId(userId)
                .orElseThrow(() -> new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED));

        // Refresh Token 만료 여부 확인
        if (storedToken.getTkExpDt().before(new Date())) {
            jwtAuthDao.deleteRefreshTokenByUserId(userId);
            throw new BizException("만료된 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }

        // 사용자 재조회 (JWT 클레임 업데이트를 위해)
        AuthUserVO authUserVO = jwtAuthDao.selectAdminUserByUserId(userId)
                .or(() -> jwtAuthDao.selectTaskUserByUserId(userId))
                .or(() -> jwtAuthDao.selectUserByUserId(userId))
                .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.UNAUTHORIZED));

        return makeLoginResponse(authUserVO);
    }

    @Override
    public void logout(String userId) {
        jwtAuthDao.deleteRefreshTokenByUserId(userId);
    }

    /**
     * JWT 토큰 발급 및 Refresh Token 저장
     */
    @Transactional
    private LoginResponse makeLoginResponse(AuthUserVO authUserVO) {
        String accessToken = jwtUtil.generateAccessToken(authUserVO);
        String refreshToken = jwtUtil.generateRefreshToken(authUserVO);

        // 기존 Refresh Token 삭제
        jwtAuthDao.deleteRefreshTokenByUserId(authUserVO.getId());

        // 새 Refresh Token 저장
        CmsRefreshTokenVO refreshTokenVO = new CmsRefreshTokenVO();
        refreshTokenVO.setUserId(authUserVO.getId());
        refreshTokenVO.setTk(refreshToken);
        refreshTokenVO.setTkExpDt(new Date(System.currentTimeMillis() + refreshTokenExpireTime));
        refreshTokenVO.setRkvYn("N");
        refreshTokenVO.setCrtBy(authUserVO.getId());
        refreshTokenVO.setUpdBy(authUserVO.getId());
        jwtAuthDao.insertRefreshToken(refreshTokenVO);

        // 응답 생성
        LoginResponse loginResponse = new LoginResponse();
        loginResponse.setGrantType("Bearer");
        loginResponse.setAccessToken(accessToken);
        loginResponse.setRefreshToken(refreshToken);
        loginResponse.setAccessTokenExpiration(accessTokenExpiration);
        loginResponse.setRefreshTokenExpiration(refreshTokenExpireTime);

        return loginResponse;
    }
}
