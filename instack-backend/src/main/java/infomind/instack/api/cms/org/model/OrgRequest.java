package infomind.instack.api.cms.org.model;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 조직 요청 VO.
 */
@Getter
@Setter
public class OrgRequest {
    @Schema(description = "조직 코드")
    @NotBlank(message = "조직 코드는 필수입니다")
    private String orgCd;

    @Schema(description = "조직 명")
    @NotBlank(message = "조직 명은 필수입니다")
    private String orgNm;

    @Schema(description = "조직 상태 구분")
    private String orgStsSe;

    @Schema(description = "순서")
    private Integer ord;

    @Schema(description = "사용 여부")
    private String useYn;

    @Schema(description = "검색 키워드")
    private String searchKeyword;
}
