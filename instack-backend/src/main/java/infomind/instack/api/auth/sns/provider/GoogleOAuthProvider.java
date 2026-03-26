package infomind.instack.api.auth.sns.provider;

import infomind.instack.api.auth.sns.model.SnsTokenResponse;
import infomind.instack.api.auth.sns.model.SnsUserInfo;
import infomind.instack.api.common.exception.BizException;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Component
@RequiredArgsConstructor
public class GoogleOAuthProvider implements SnsOAuthProvider {
    private final RestTemplate restTemplate;

    @Value("${Sns.google.clientId}")
    private String clientId;

    @Value("${Sns.google.clientSecret}")
    private String clientSecret;

    @Value("${Sns.google.callbackUrl}")
    private String callbackUrl;

    private static final String TOKEN_ENDPOINT = "https://oauth2.googleapis.com/token";
    private static final String USERINFO_ENDPOINT = "https://www.googleapis.com/oauth2/v3/userinfo";

    @Override
    public SnsTokenResponse getToken(String code) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("grant_type", "authorization_code");
            body.add("code", code);
            body.add("client_id", clientId);
            body.add("client_secret", clientSecret);
            body.add("redirect_uri", callbackUrl);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
            return restTemplate.postForObject(TOKEN_ENDPOINT, request, SnsTokenResponse.class);
        } catch (Exception e) {
            log.error("Google token exchange failed", e);
            throw new BizException("Google 토큰 교환 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public SnsUserInfo getUserInfo(SnsTokenResponse tokenResponse) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(tokenResponse.getAccessToken());

            HttpEntity<Void> request = new HttpEntity<>(headers);
            SnsUserInfo userInfo = restTemplate.getForObject(
                USERINFO_ENDPOINT,
                SnsUserInfo.class,
                request
            );

            if (userInfo != null) {
                userInfo.setId(userInfo.getId());
            }
            return userInfo;
        } catch (Exception e) {
            log.error("Google user info retrieval failed", e);
            throw new BizException("Google 사용자 정보 조회 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public String getProviderName() {
        return "google";
    }
}
