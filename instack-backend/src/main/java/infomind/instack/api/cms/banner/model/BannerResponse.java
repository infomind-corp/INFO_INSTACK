package infomind.instack.api.cms.banner.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 배너 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "배너 조회 응답")
public class BannerResponse {

    /** 배너 아이디 */
    @Schema(description = "배너 아이디", example = "BNR_001")
    private String bnrId;

    /** 배너 그룹 아이디 */
    @Schema(description = "배너 그룹 아이디", example = "GRP_MAIN")
    private String bnrGrpId;

    /** 사이트 코드 */
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    /** 언어 구분 */
    @Schema(description = "언어 구분", example = "ko")
    private String langSe;

    /** 배너 명 */
    @Schema(description = "배너 명", example = "메인 배너 1")
    private String bnrNm;

    /** 배너 내용 */
    @Schema(description = "배너 내용")
    private String bnrDesc;

    /** 첨부파일 아이디 */
    @Schema(description = "첨부파일 아이디")
    private String afileId;

    /** 순서 */
    @Schema(description = "순서", example = "1")
    private Integer ord;

    /** 게시 시작 일자 (YYYYMMDD) */
    @Schema(description = "게시 시작 일자", example = "20260101")
    private String pubStYmd;

    /** 게시 시작 시간 (HH24mm) */
    @Schema(description = "게시 시작 시간", example = "0900")
    private String pubStHr;

    /** 게시 종료 일자 (YYYYMMDD) */
    @Schema(description = "게시 종료 일자", example = "20261231")
    private String pubEndYmd;

    /** 게시 종료 시간 (HH24mm) */
    @Schema(description = "게시 종료 시간", example = "1800")
    private String pubEndHr;

    /** 사용 여부 (Y/N) */
    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    /** 배너 구분 (_self 등) */
    @Schema(description = "배너 구분", example = "_self")
    private String bnrSe;

    /** 배너 크기 구분 */
    @Schema(description = "배너 크기 구분", example = "FULL")
    private String bnrSzSe;

    /** 배너 URL */
    @Schema(description = "배너 URL", example = "https://example.com")
    private String bnrUrl;

    /** 삭제 여부 (Y/N) */
    @Schema(description = "삭제 여부", example = "N")
    private String delYn;

    /** 배너 비고 */
    @Schema(description = "배너 비고")
    private String bnrRmk;

    /** 생성 일시 */
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:00")
    private String crtAt;

    /** 수정 일시 */
    @Schema(description = "수정 일시", example = "2026-03-26 10:30:00")
    private String updAt;
}
