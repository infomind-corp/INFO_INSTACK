package infomind.instack.api.cms.banner.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 배너 그룹 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "배너 그룹 조회 응답")
public class BannerGrpResponse {

    /** 배너 그룹 아이디 */
    @Schema(description = "배너 그룹 아이디", example = "GRP_MAIN")
    private String bnrGrpId;

    /** 사이트 코드 */
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    /** 언어 구분 */
    @Schema(description = "언어 구분", example = "ko")
    private String langSe;

    /** 배너 그룹 명 */
    @Schema(description = "배너 그룹 명", example = "메인 배너 그룹")
    private String bnrGrpNm;

    /** 배너 그룹 내용 */
    @Schema(description = "배너 그룹 내용", example = "메인 페이지 배너 그룹입니다")
    private String bnrGrpDesc;

    /** 사용 여부 (Y/N) */
    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    /** 정렬 순서 */
    @Schema(description = "정렬 순서", example = "1")
    private Integer sort;

    /** 생성 일시 */
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:00")
    private String crtAt;

    /** 수정 일시 */
    @Schema(description = "수정 일시", example = "2026-03-26 10:30:00")
    private String updAt;
}
