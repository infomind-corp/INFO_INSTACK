package infomind.instack.api.common.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

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
