package infomind.instack.api.common.util;

import infomind.instack.api.auth.basic.entity.AuthUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import java.util.HashMap;
import java.util.Map;
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

    @Value("${Globals.jwt.refreshExpiration:86400000}")
    private long refreshExpiration;

    private final String AUTHORIZATION = "Authorization";

    public String generateAccessToken(AuthUser authUser) {
        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.builder()
                .subject(AUTHORIZATION)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(key)
                .compact();
    }

    public String generateRefreshToken(AuthUser authUser) {
//        private String memberId;
//        private String siteId;
//        private String loginId;
//        private String password;
//        private String memberName;
//        private String authLevel;
//        private String email;
//        private String useYn;
//        private Date regDt;
//        private Date modDt;
//        private String regUser;
//        private String deptId;
        Map<String, Object> claims = new HashMap<>();
        claims.put("memberId", authUser.getMemberId());
        claims.put("name", authUser.getSiteId());
        claims.put("loginId", authUser.getLoginId());

        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.builder()
                .subject(AUTHORIZATION)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + refreshExpiration))
                .signWith(key)
                .compact();
    }

    public Claims parseToken(String token) {
        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        return Jwts.parser()
                .verifyWith(key)
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public String getSubject(String token) {
        return parseToken(token).getSubject();
    }

    public boolean isValid(String token) {
        try {
            parseToken(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}