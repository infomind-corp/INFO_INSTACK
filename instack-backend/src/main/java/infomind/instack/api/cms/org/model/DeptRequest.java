package infomind.instack.api.cms.org.model;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 부서 요청 VO.
 */
@Getter
@Setter
public class DeptRequest {
    @Schema(description = "부서 코드")
    @NotBlank(message = "부서 코드는 필수입니다")
    private String deptCd;

    @Schema(description = "조직 코드")
    @NotBlank(message = "조직 코드는 필수입니다")
    private String orgCd;

    @Schema(description = "부서 명")
    @NotBlank(message = "부서 명은 필수입니다")
    private String deptNm;

    @Schema(description = "순서")
    private Integer ord;

    @Schema(description = "사용 여부")
    private String useYn;

    @Schema(description = "검색 키워드")
    private String searchKeyword;
}
