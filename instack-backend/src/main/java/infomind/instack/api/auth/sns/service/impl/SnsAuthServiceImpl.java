package infomind.instack.api.auth.sns.service.impl;

import infomind.instack.api.auth.jwt.dao.JwtAuthDao;
import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import infomind.instack.api.auth.jwt.entity.RefreshTokenVO;
import infomind.instack.api.auth.jwt.model.LoginResponse;
import infomind.instack.api.auth.sns.dao.SnsAuthDao;
import infomind.instack.api.auth.sns.entity.SnsIfVO;
import infomind.instack.api.auth.sns.model.SnsCallbackRequest;
import infomind.instack.api.auth.sns.model.SnsTokenResponse;
import infomind.instack.api.auth.sns.model.SnsUserInfo;
import infomind.instack.api.auth.sns.provider.SnsOAuthProvider;
import infomind.instack.api.auth.sns.service.SnsAuthService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * SNS OAuth 인증 서비스 구현.
 * <p>SNS 제공자(Google, Naver, Kakao, Apple)의 OAuth 콜백을 처리하고
 * 기존 사용자와 연동된 SNS 정보를 검증하여 JWT 토큰을 발급한다.</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SnsAuthServiceImpl extends EgovAbstractServiceImpl implements SnsAuthService {
    private final SnsAuthDao snsAuthDao;
    private final JwtAuthDao jwtAuthDao;
    private final JwtUtil jwtUtil;
    private final List<SnsOAuthProvider> providers;

    @Value("${Globals.jwt.refreshExpiration:7200000}")
    private Long refreshTokenExpireTime;

    @Value("${Globals.jwt.expiration:3600000}")
    private Long accessTokenExpiration;

    /**
     * SNS OAuth 콜백을 처리하여 JWT 토큰을 발급한다.
     * 1. Authorization Code를 Access Token으로 교환
     * 2. SNS 사용자 정보 조회
     * 3. CMS_SNS_IF에서 연동 정보 검증
     * 4. 로그인 가능 여부 확인
     * 5. 기존 사용자로 JWT 토큰 발급
     *
     * @param provider SNS 제공자명 (google, naver, kakao, apple)
     * @param request  OAuth 콜백 요청 (authorization code)
     * @return 로그인 응답 (accessToken, refreshToken, 사용자 정보)
     * @throws BizException 제공자가 지원되지 않거나 연동 정보/사용자가 없는 경우
     */
    @Override
    @Transactional
    public LoginResponse handleCallback(String provider, SnsCallbackRequest request) {
        // 1. provider 검증
        SnsOAuthProvider oauthProvider = getProvider(provider);

        // 2. Authorization Code → Access Token 교환
        SnsTokenResponse tokenResponse = oauthProvider.getToken(request.getCode());
        if (tokenResponse == null || tokenResponse.getAccessToken() == null) {
            throw new BizException("토큰 교환 실패", HttpStatus.BAD_REQUEST);
        }

        // 3. SNS 사용자 정보 조회
        SnsUserInfo snsUserInfo = oauthProvider.getUserInfo(tokenResponse);
        if (snsUserInfo == null || snsUserInfo.getId() == null) {
            throw new BizException("사용자 정보 조회 실패", HttpStatus.BAD_REQUEST);
        }

        // 4. CMS_SNS_IF에서 연동 정보 조회
        SnsIfVO snsIf = snsAuthDao.selectSnsIfByProviderKey(
                oauthProvider.getProviderName(),
                snsUserInfo.getId()
            )
            .orElseThrow(() -> new BizException(
                "연동 정보가 없습니다. 관리자에게 문의하세요.",
                HttpStatus.FORBIDDEN
            ));

        // 5. 로그인 가능 여부 확인
        if (!"Y".equals(snsIf.getLgnAvlYn()) || !"Y".equals(snsIf.getUseYn())) {
            throw new BizException("로그인이 비허용된 계정입니다", HttpStatus.UNAUTHORIZED);
        }

        // 6. CMS_SNS_IF 업데이트 (토큰, 로그인 일시 등)
        snsIf.setAccTk(tokenResponse.getAccessToken());
        if (tokenResponse.getRefreshToken() != null) {
            snsIf.setRfTk(tokenResponse.getRefreshToken());
        }
        if (tokenResponse.getExpiresIn() != null) {
            snsIf.setTkExpDt(new Date(System.currentTimeMillis() + tokenResponse.getExpiresIn() * 1000));
        }
        snsIf.setLstLgnDt(new Date());
        snsAuthDao.updateSnsIfOnLogin(snsIf);

        // 7. USER_ID + USER_SE로 기존 사용자 조회
        String userId = snsIf.getUserId();
        String userSe = snsIf.getUserSe();

        AuthUserVO authUserVO = getAuthUserByUserSe(userId, userSe)
            .orElseThrow(() -> new BizException(
                "사용자 정보가 없습니다",
                HttpStatus.UNAUTHORIZED
            ));

        // 8. JWT 발급 및 Refresh Token 저장
        return makeLoginResponse(authUserVO);
    }

    /**
     * 제공자명으로 해당 SnsOAuthProvider 인스턴스를 조회한다.
     *
     * @param provider 제공자명 (google, naver, kakao, apple)
     * @return 해당 제공자의 OAuth Provider 인스턴스
     * @throws BizException 지원되지 않는 제공자인 경우
     */
    private SnsOAuthProvider getProvider(String provider) {
        return providers.stream()
            .filter(p -> p.getProviderName().equalsIgnoreCase(provider))
            .findFirst()
            .orElseThrow(() -> new BizException(
                "지원하지 않는 SNS 공급자: " + provider,
                HttpStatus.BAD_REQUEST
            ));
    }

    /**
     * 사용자 구분에 따라 해당 테이블에서 사용자를 조회한다.
     *
     * @param userId 사용자 ID
     * @param userSe 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @return 사용자 정보를 담은 Optional
     * @throws BizException 사용자 구분이 유효하지 않은 경우
     */
    private java.util.Optional<AuthUserVO> getAuthUserByUserSe(String userId, String userSe) {
        return switch (userSe) {
            case "A" -> jwtAuthDao.selectAdminUserByUserId(userId);
            case "E" -> jwtAuthDao.selectTaskUserByUserId(userId);
            case "G" -> jwtAuthDao.selectUserByUserId(userId);
            default -> throw new BizException("유효하지 않은 사용자 구분", HttpStatus.BAD_REQUEST);
        };
    }

    /**
     * JWT 액세스/리프레시 토큰을 생성하고 리프레시 토큰을 DB에 저장한다.
     * 기존 리프레시 토큰을 삭제하고 새로운 토큰을 저장한다.
     *
     * @param authUserVO 사용자 정보
     * @return 로그인 응답 (accessToken, refreshToken, 만료 시간)
     */
    @Transactional
    private LoginResponse makeLoginResponse(AuthUserVO authUserVO) {
        String accessToken = jwtUtil.generateAccessToken(authUserVO);
        String refreshToken = jwtUtil.generateRefreshToken(authUserVO);

        // 기존 Refresh Token 삭제
        jwtAuthDao.deleteRefreshTokenByUserId(authUserVO.getId());

        // 새 Refresh Token 저장
        RefreshTokenVO refreshTokenVO = new RefreshTokenVO();
        refreshTokenVO.setUserId(authUserVO.getId());
        refreshTokenVO.setTk(refreshToken);
        refreshTokenVO.setTkExpDt(new Date(System.currentTimeMillis() + refreshTokenExpireTime));
        refreshTokenVO.setRkvYn("N");
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
