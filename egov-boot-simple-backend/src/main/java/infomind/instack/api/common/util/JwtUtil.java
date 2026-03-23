package infomind.instack.api.common.util;

import infomind.instack.api.auth.basic.entity.AuthUserVO;
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
                .claims(authUserVO.toClaims())
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

            return new AuthUserVO(
                    id,
                    getStringClaim(claims, "userNm"),
                    getStringClaim(claims, "eml"),
                    getStringClaim(claims, "mtelno"),
                    getStringClaim(claims, "gndrSe"),
                    getStringClaim(claims, "telno"),
                    getStringClaim(claims, "addr"),
                    getStringClaim(claims, "daddr"),
                    getStringClaim(claims, "ci"),
                    getStringClaim(claims, "di"),
                    getStringClaim(claims, "userSe")
            );
        } catch (IllegalArgumentException e) {
            throw new InvalidJwtException("Unable to verify JWT Token: " + e.getMessage());
        } catch (JwtException e) {
            throw new InvalidJwtException("Unable to verify JWT Token: " + e.getMessage());
        }
    }

    private String getStringClaim(Claims claims, String key) {
        Object value = claims.get(key);
        return value != null ? value.toString() : null;
    }
}
