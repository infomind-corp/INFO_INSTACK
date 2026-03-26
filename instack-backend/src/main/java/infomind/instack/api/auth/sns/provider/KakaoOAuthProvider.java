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
public class KakaoOAuthProvider implements SnsOAuthProvider {
    private final RestTemplate restTemplate;

    @Value("${Sns.kakao.clientId}")
    private String clientId;

    @Value("${Sns.kakao.callbackUrl}")
    private String callbackUrl;

    private static final String TOKEN_ENDPOINT = "https://kauth.kakao.com/oauth/token";
    private static final String USERINFO_ENDPOINT = "https://kapi.kakao.com/v2/user/me";

    @Override
    public SnsTokenResponse getToken(String code) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("grant_type", "authorization_code");
            body.add("client_id", clientId);
            body.add("code", code);
            body.add("redirect_uri", callbackUrl);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
            return restTemplate.postForObject(TOKEN_ENDPOINT, request, SnsTokenResponse.class);
        } catch (Exception e) {
            log.error("Kakao token exchange failed", e);
            throw new BizException("카카오 토큰 교환 실패", HttpStatus.BAD_REQUEST);
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
            userInfo.setId(String.valueOf(response.get("id")));

            if (response.get("kakao_account") != null) {
                Map<String, Object> kakaoAccount = (Map<String, Object>) response.get("kakao_account");
                if (kakaoAccount.get("email") != null) {
                    userInfo.setEmail((String) kakaoAccount.get("email"));
                }
                if (kakaoAccount.get("profile") != null) {
                    Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
                    if (profile.get("nickname") != null) {
                        userInfo.setName((String) profile.get("nickname"));
                    }
                    if (profile.get("profile_image_url") != null) {
                        userInfo.setPicture((String) profile.get("profile_image_url"));
                    }
                }
            }

            return userInfo;
        } catch (Exception e) {
            log.error("Kakao user info retrieval failed", e);
            throw new BizException("카카오 사용자 정보 조회 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public String getProviderName() {
        return "kakao";
    }
}
