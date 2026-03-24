package infomind.instack.api.common.util.jwt;

/**
 * 유효하지 않은 JWT 토큰 예외.
 * <p>토큰 파싱 실패, 서명 불일치, 만료, id 누락 등 JWT 검증 오류 발생 시 던진다.
 * {@link infomind.instack.api.common.filter.AuthenticationFilter}에서 캐치하여 인증 없이 요청을 통과시킨다.</p>
 */
public class InvalidJwtException extends RuntimeException {
    public InvalidJwtException(String message, Throwable cause) {
        super(message, cause);
    }

    public InvalidJwtException(String message) {
        super(message);
    }
}

