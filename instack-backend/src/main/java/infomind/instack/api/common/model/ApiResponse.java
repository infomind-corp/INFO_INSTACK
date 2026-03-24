package infomind.instack.api.common.model;

import lombok.Getter;

/**
 * API 응답 표준화 래퍼 클래스.
 * <p>모든 REST API 응답을 {@code success}, {@code code}, {@code message}, {@code data} 구조로 통일한다.</p>
 */
@Getter
public class ApiResponse<T> {

    private final boolean success;
    private final String code;
    private final String message;
    private final T data;

    private ApiResponse(boolean success, String code, String message, T data) {
        this.success = success;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> ApiResponse<T> ok(T data) {
        return new ApiResponse<>(true, "SUCCESS", null, data);
    }

    public static <T> ApiResponse<T> ok() {
        return new ApiResponse<>(true, "SUCCESS", null, null);
    }

    public static <T> ApiResponse<T> error(String code, String message) {
        return new ApiResponse<>(false, code, message, null);
    }
}