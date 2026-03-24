package infomind.instack.api.common.exception;

import org.springframework.http.HttpStatus;

/**
 * 비즈니스 로직 예외 클래스.
 * <p>서비스 레이어에서 발생하는 업무 오류를 표현하며, HTTP 상태 코드를 함께 담아 {@link GlobalExceptionHandler}에서 응답으로 변환된다.
 * 기본 상태 코드는 {@code 400 BAD_REQUEST}.</p>
 */
public class BizException extends RuntimeException {

    private final HttpStatus status;

    public BizException(String message) {
        super(message);
        this.status = HttpStatus.BAD_REQUEST;
    }

    public BizException(String message, HttpStatus status) {
        super(message);
        this.status = status;
    }

    public HttpStatus getStatus() {
        return status;
    }
}