package infomind.instack.api.cms.dept.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 부서 응답 VO.
 */
@Getter
@Setter
public class DeptResponse {
    @Schema(description = "부서 코드")
    private String deptCd;

    @Schema(description = "조직 코드")
    private String orgCd;

    @Schema(description = "부서 명")
    private String deptNm;

    @Schema(description = "순서")
    private Integer ord;

    @Schema(description = "사용 여부")
    private String useYn;

    @Schema(description = "등록자")
    private String crtBy;

    @Schema(description = "등록자IP")
    private String crtIp;

    @Schema(description = "등록프로그램")
    private String crtPgm;

    @Schema(description = "등록일시")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String crtAt;

    @Schema(description = "수정자")
    private String updBy;

    @Schema(description = "수정자IP")
    private String updIp;

    @Schema(description = "수정프로그램")
    private String updPgm;

    @Schema(description = "수정일시")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String updAt;
}
