package infomind.instack.api.common.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

/**
 * 페이징 요청 파라미터 모델.
 * <p>목록 조회 API에서 {@code page}(페이지 번호)와 {@code size}(페이지 크기)를 받아 MyBatis OFFSET 값을 계산한다.</p>
 */
@Getter
@Setter
public class PageRequest {

    @NotNull(message = "페이지 번호는 필수입니다.")
    @Min(value = 1, message = "페이지는 1 이상이어야 합니다.")
    private Integer page = 1;

    @NotNull(message = "페이지 크기는 필수입니다.")
    @Min(value = 1, message = "페이지 크기는 1 이상이어야 합니다.")
    private Integer size = 10;

    public Integer getOffset() {
        return (page - 1) * size;
    }
}
