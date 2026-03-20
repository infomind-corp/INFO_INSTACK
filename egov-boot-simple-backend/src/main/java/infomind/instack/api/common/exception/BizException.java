package infomind.instack.api.common.exception;

import org.springframework.http.HttpStatus;

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