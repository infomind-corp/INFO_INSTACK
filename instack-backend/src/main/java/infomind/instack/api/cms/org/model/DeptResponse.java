package infomind.instack.api.cms.org.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 부서 응답 모델.
 */
@Getter
@Setter
public class DeptResponse {
    /**
     * 부서 코드
     */
    @Schema(description = "부서 코드")
    private String deptCd;

    /**
     * 조직 코드
     */
    @Schema(description = "조직 코드")
    private String orgCd;

    /**
     * 부서 명
     */
    @Schema(description = "부서 명")
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
     * 등록자
     */
    @Schema(description = "등록자")
    private String crtBy;

    /**
     * 등록자IP
     */
    @Schema(description = "등록자IP")
    private String crtIp;

    /**
     * 등록프로그램
     */
    @Schema(description = "등록프로그램")
    private String crtPgm;

    /**
     * 등록일시
     */
    @Schema(description = "등록일시")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String crtAt;

    /**
     * 수정자
     */
    @Schema(description = "수정자")
    private String updBy;

    /**
     * 수정자IP
     */
    @Schema(description = "수정자IP")
    private String updIp;

    /**
     * 수정프로그램
     */
    @Schema(description = "수정프로그램")
    private String updPgm;

    /**
     * 수정일시
     */
    @Schema(description = "수정일시")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String updAt;
}
