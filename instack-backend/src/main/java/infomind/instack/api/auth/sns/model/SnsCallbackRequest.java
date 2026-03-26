package infomind.instack.api.auth.sns.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * SNS OAuth 콜백 요청
 */
@Getter
@Setter
public class SnsCallbackRequest {
    @NotBlank
    private String code;          // Authorization Code

    private String state;         // CSRF 방지 state

    @NotBlank
    private String userSe;        // 사용자 구분 (A/E/G, 기본값 G)
}
