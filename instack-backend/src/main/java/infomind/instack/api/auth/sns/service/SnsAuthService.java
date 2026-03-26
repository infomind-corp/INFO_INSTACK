package infomind.instack.api.auth.sns.service;

import infomind.instack.api.auth.sns.model.SnsCallbackRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;

/**
 * SNS 인증 서비스 인터페이스
 */
public interface SnsAuthService {
    /**
     * SNS OAuth 콜백 처리 및 JWT 발급
     */
    LoginResponse handleCallback(String provider, SnsCallbackRequest request);
}
