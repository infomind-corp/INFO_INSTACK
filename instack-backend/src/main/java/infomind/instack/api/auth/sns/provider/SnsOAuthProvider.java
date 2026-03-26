package infomind.instack.api.auth.sns.provider;

import infomind.instack.api.auth.sns.model.SnsTokenResponse;
import infomind.instack.api.auth.sns.model.SnsUserInfo;

/**
 * SNS OAuth 공급자 인터페이스
 */
public interface SnsOAuthProvider {
    /**
     * Authorization Code로 토큰 교환
     */
    SnsTokenResponse getToken(String code);

    /**
     * Access Token으로 사용자 정보 조회
     */
    SnsUserInfo getUserInfo(SnsTokenResponse tokenResponse);

    /**
     * 공급자명 반환 (google/kakao/naver/apple)
     */
    String getProviderName();
}
