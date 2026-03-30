package infomind.instack.api.cms.popup.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 팝업 그룹 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "팝업 그룹 조회 응답")
public class PopGrpResponse {

    /** 사이트 코드 */
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    /** 팝업 그룹 아이디 */
    @Schema(description = "팝업 그룹 아이디", example = "POP_MAIN")
    private String popGrpId;

    /** 언어 구분 */
    @Schema(description = "언어 구분", example = "ko")
    private String langSe;

    /** 팝업 그룹 명 */
    @Schema(description = "팝업 그룹 명", example = "메인 팝업 그룹")
    private String popGrpNm;

    /** 사용 여부 (Y/N) */
    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    /** 팝업 그룹 순서 */
    @Schema(description = "팝업 그룹 순서", example = "1")
    private Integer popGrpOrd;

    /** 생성 일시 */
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:00")
    private String crtAt;

    /** 수정 일시 */
    @Schema(description = "수정 일시", example = "2026-03-26 10:30:00")
    private String updAt;
}
