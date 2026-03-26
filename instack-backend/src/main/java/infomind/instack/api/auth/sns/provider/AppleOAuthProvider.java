package infomind.instack.api.auth.sns.provider;

import infomind.instack.api.auth.sns.model.SnsTokenResponse;
import infomind.instack.api.auth.sns.model.SnsUserInfo;
import infomind.instack.api.common.exception.BizException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.Date;
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
public class AppleOAuthProvider implements SnsOAuthProvider {
    private final RestTemplate restTemplate;

    @Value("${Sns.apple.clientId}")
    private String clientId;

    @Value("${Sns.apple.teamId}")
    private String teamId;

    @Value("${Sns.apple.keyId}")
    private String keyId;

    @Value("${Sns.apple.privateKey}")
    private String privateKeyStr;

    @Value("${Sns.apple.callbackUrl}")
    private String callbackUrl;

    private static final String TOKEN_ENDPOINT = "https://appleid.apple.com/auth/token";

    private PrivateKey getPrivateKey() {
        try {
            String key = privateKeyStr
                .replace("-----BEGIN PRIVATE KEY-----", "")
                .replace("-----END PRIVATE KEY-----", "")
                .replaceAll("\\s+", "");

            byte[] decodedKey = Base64.getDecoder().decode(key);
            PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(decodedKey);
            KeyFactory kf = KeyFactory.getInstance("EC");
            return kf.generatePrivate(spec);
        } catch (Exception e) {
            log.error("Failed to load Apple private key", e);
            throw new BizException("Apple 개인키 로드 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    private String generateClientSecret() {
        try {
            long nowInSeconds = System.currentTimeMillis() / 1000;
            long expirationTime = nowInSeconds + (60 * 5);  // 5분 유효

            return Jwts.builder()
                .claim("sub", clientId)
                .claim("iss", teamId)
                .claim("aud", "https://appleid.apple.com")
                .claim("iat", nowInSeconds)
                .claim("exp", expirationTime)
                .setHeaderParam("alg", "ES256")
                .setHeaderParam("kid", keyId)
                .signWith(getPrivateKey(), SignatureAlgorithm.ES256)
                .compact();
        } catch (Exception e) {
            log.error("Failed to generate Apple client secret", e);
            throw new BizException("Apple 클라이언트 시크릿 생성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public SnsTokenResponse getToken(String code) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            String clientSecret = generateClientSecret();

            MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
            body.add("grant_type", "authorization_code");
            body.add("code", code);
            body.add("client_id", clientId);
            body.add("client_secret", clientSecret);
            body.add("redirect_uri", callbackUrl);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
            return restTemplate.postForObject(TOKEN_ENDPOINT, request, SnsTokenResponse.class);
        } catch (Exception e) {
            log.error("Apple token exchange failed", e);
            throw new BizException("Apple 토큰 교환 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public SnsUserInfo getUserInfo(SnsTokenResponse tokenResponse) {
        try {
            // Apple은 id_token (JWT) 형태로 사용자 정보 제공
            String idToken = tokenResponse.getIdToken();
            if (idToken == null || idToken.isEmpty()) {
                throw new BizException("Apple id_token이 없습니다", HttpStatus.BAD_REQUEST);
            }

            // id_token 파싱 (서명 검증 생략 - 실무에서는 Apple 공개키로 검증 필수)
            String[] parts = idToken.split("\\.");
            if (parts.length != 3) {
                throw new BizException("유효하지 않은 id_token 형식", HttpStatus.BAD_REQUEST);
            }

            String payload = parts[1];
            String decodedPayload = new String(
                Base64.getUrlDecoder().decode(payload),
                StandardCharsets.UTF_8
            );

            // JSON 파싱 (SimpleJSON 또는 Jackson 활용 가능)
            // 여기서는 간단하게 처리
            SnsUserInfo userInfo = new SnsUserInfo();

            // Jackson이 있으므로 ObjectMapper 사용 가능
            com.fasterxml.jackson.databind.ObjectMapper mapper =
                new com.fasterxml.jackson.databind.ObjectMapper();
            Map<String, Object> claims = mapper.readValue(decodedPayload, Map.class);

            userInfo.setId((String) claims.get("sub"));
            userInfo.setEmail((String) claims.get("email"));

            return userInfo;
        } catch (BizException e) {
            throw e;
        } catch (Exception e) {
            log.error("Apple user info retrieval failed", e);
            throw new BizException("Apple 사용자 정보 조회 실패", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public String getProviderName() {
        return "apple";
    }
}
