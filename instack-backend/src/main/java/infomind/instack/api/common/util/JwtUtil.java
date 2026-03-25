package infomind.instack.api.common.util;

import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import infomind.instack.api.auth.jwt.entity.UserAuthority;
import infomind.instack.api.common.util.jwt.InvalidJwtException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * JWT 토큰 유틸리티 (INSTACK).
 * <p>Access Token / Refresh Token 발급, 파싱, 유효성 검사, {@link AuthUserVO} 추출을 담당한다.
 * eGov 레거시용 {@link infomind.instack.api.common.util.jwt.EgovJwtTokenUtil}과 구분되며, INSTACK API 전용으로 사용된다.</p>
 */
@Component
public class JwtUtil {

    @Value("${Globals.jwt.secret}")
    private String secret;

    @Value("${Globals.jwt.expiration:3600000}")
    private long expiration;

    @Value("${Globals.jwt.refreshExpiration:7200000}")
    private long refreshExpiration;

    public static final String AUTHORIZATION = "Authorization";

    public String generateAccessToken(AuthUserVO authUserVO) {
        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.builder()
                .claims(authUserVO.toClaims())
                .subject(AUTHORIZATION)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(key)
                .compact();
    }

    public String generateRefreshToken(AuthUserVO authUserVO) {
        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.builder()
                .claims(authUserVO.toMinimalClaims())
                .subject(AUTHORIZATION)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + refreshExpiration))
                .signWith(key)
                .compact();
    }

    public String getIdFromToken(String token) {
        return getInfoFromToken("id", token);
    }

    public String getInfoFromToken(String type, String token) {
        Claims claims = parseToken(token);
        Object info = claims.get(type);
        return info != null ? info.toString() : null;
    }

    public Claims parseToken(String token) {
        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.parser()
                .verifyWith(key)
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public boolean isValid(String token) {
        try {
            parseToken(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public AuthUserVO getAuthUserFromToken(String token) throws InvalidJwtException {
        try {
            Claims claims = parseToken(token);

            String id = claims.get("id") != null ? claims.get("id").toString() : null;
            if (id == null) throw new InvalidJwtException("Missing id in token");

            List<UserAuthority> authorities = convertAuthorities(claims.get("authorities"));

            return new AuthUserVO(
                    id,
                    getStringClaim(claims, "siteCd"),
                    getStringClaim(claims, "userNm"),
                    getStringClaim(claims, "eml"),
                    getStringClaim(claims, "mtelno"),
                    getStringClaim(claims, "gndrSe"),
                    getStringClaim(claims, "telno"),
                    getStringClaim(claims, "addr"),
                    getStringClaim(claims, "daddr"),
                    getStringClaim(claims, "ci"),
                    getStringClaim(claims, "di"),
                    getStringClaim(claims, "userSe"),
                    authorities
            );
        } catch (IllegalArgumentException e) {
            throw new InvalidJwtException("Unable to verify JWT Token: " + e.getMessage());
        } catch (JwtException e) {
            throw new InvalidJwtException("Unable to verify JWT Token: " + e.getMessage());
        }
    }

    private List<UserAuthority> convertAuthorities(Object authoritiesObj) {
        if (authoritiesObj == null) {
            return List.of();
        }

        if (authoritiesObj instanceof List) {
            List<?> list = (List<?>) authoritiesObj;
            return list.stream()
                    .map(item -> {
                        if (item instanceof Map) {
                            Map<String, Object> map = (Map<String, Object>) item;
                            return new UserAuthority(
                                    getStringFromMap(map, "authCd"),
                                    getStringFromMap(map, "authExpYmd"),
                                    getStringFromMap(map, "authSe")
                            );
                        }
                        return null;
                    })
                    .filter(auth -> auth != null)
                    .toList();
        }

        return List.of();
    }

    private String getStringFromMap(Map<String, Object> map, String key) {
        Object value = map.get(key);
        return value != null ? value.toString() : null;
    }

    private String getStringClaim(Claims claims, String key) {
        Object value = claims.get(key);
        return value != null ? value.toString() : null;
    }
}
