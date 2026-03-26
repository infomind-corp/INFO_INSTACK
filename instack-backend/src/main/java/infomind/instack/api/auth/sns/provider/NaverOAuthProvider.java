package infomind.instack.api.auth.sns.provider;

import infomind.instack.api.auth.sns.model.SnsTokenResponse;
import infomind.instack.api.auth.sns.model.SnsUserInfo;
import infomind.instack.api.common.exception.BizException;
import java.util.Base64;
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
public class NaverOAuthProvider implements SnsOAuthProvider {
    private final RestTemplate restTemplate;

    @Value("${Sns.naver.clientId}")
    private String clientId;

    @Value("${Sns.naver.clientSecret}")
    private String clientSecret;

    @Value("${Sns.naver.callbackUrl}")
    private String callbackUrl;

    private static final String TOKEN_ENDPOINT = "https://nid.naver.com/oauth2.0/token";
    private static final String USERINFO_ENDPOINT = "https://openapi.naver.com/v1/nid/me";

    @Override
    public SnsTokenResponse getToken(String code) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            // Basic Auth 추가 (선택사항, Naver는 파라미터로도 지원)
            String auth = clientId + ":" + clientSecret;
            String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes());
            headers.set("Authorization", "Basic " + encodedAuth);

            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("grant_type", "authorization_code");
            body.add("code", code);
            body.add("state", "");  // state는 생략 가능

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
            return restTemplate.postForObject(TOKEN_ENDPOINT, request, SnsTokenResponse.class);
        } catch (Exception e) {
            log.error("Naver token exchange failed", e);
            throw new BizException("네이버 토큰 교환 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public SnsUserInfo getUserInfo(SnsTokenResponse tokenResponse) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(tokenResponse.getAccessToken());

            HttpEntity<Void> request = new HttpEntity<>(headers);
            Map<String, Object> response = restTemplate.getForObject(
                USERINFO_ENDPOINT,
                Map.class,
                request
            );

            SnsUserInfo userInfo = new SnsUserInfo();
            if (response.get("response") != null) {
                Map<String, Object> naverResponse = (Map<String, Object>) response.get("response");
                userInfo.setId((String) naverResponse.get("id"));
                userInfo.setEmail((String) naverResponse.get("email"));
                userInfo.setName((String) naverResponse.get("name"));
                userInfo.setPicture((String) naverResponse.get("profile_image"));
            }

            return userInfo;
        } catch (Exception e) {
            log.error("Naver user info retrieval failed", e);
            throw new BizException("네이버 사용자 정보 조회 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public String getProviderName() {
        return "naver";
    }
}
