package infomind.instack.api.cms.org.model;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 부서 요청 모델.
 */
@Getter
@Setter
public class DeptRequest {
    /**
     * 부서 코드 (필수)
     */
    @Schema(description = "부서 코드")
    @NotBlank(message = "부서 코드는 필수입니다")
    private String deptCd;

    /**
     * 조직 코드 (필수)
     */
    @Schema(description = "조직 코드")
    @NotBlank(message = "조직 코드는 필수입니다")
    private String orgCd;

    /**
     * 부서 명 (필수)
     */
    @Schema(description = "부서 명")
    @NotBlank(message = "부서 명은 필수입니다")
    private String deptNm;

    /**
     * 순서
     */
    @Schema(description = "순서")
    private Integer ord;

    /**
     * 사용 여부 (Y/N)
     */
    @Schema(description = "사용 여부")
    private String useYn;

    /**
     * 검색 키워드
     */
    @Schema(description = "검색 키워드")
    private String searchKeyword;
}
