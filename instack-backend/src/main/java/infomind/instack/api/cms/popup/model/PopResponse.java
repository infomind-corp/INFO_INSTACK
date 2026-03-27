package infomind.instack.api.cms.popup.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 팝업 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "팝업 조회 응답")
public class PopResponse {

    /** 사이트 코드 */
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    /** 팝업 그룹 아이디 */
    @Schema(description = "팝업 그룹 아이디", example = "POP_MAIN")
    private String popGrpId;

    /** 팝업 아이디 */
    @Schema(description = "팝업 아이디", example = "POP001")
    private String popId;

    /** 언어 구분 */
    @Schema(description = "언어 구분", example = "ko")
    private String langSe;

    /** 팝업 명 */
    @Schema(description = "팝업 명", example = "이벤트 팝업")
    private String popNm;

    /** 팝업 제목 */
    @Schema(description = "팝업 제목", example = "이벤트 안내")
    private String popTtl;

    /** 팝업 내용 */
    @Schema(description = "팝업 내용")
    private String popDesc;

    /** 게시 시작 일자 (YYYYMMDD) */
    @Schema(description = "게시 시작 일자", example = "20260101")
    private String pubStYmd;

    /** 게시 종료 일자 (YYYYMMDD) */
    @Schema(description = "게시 종료 일자", example = "20261231")
    private String pubEndYmd;

    /** 게시 시작 시간 (HHMM) */
    @Schema(description = "게시 시작 시간", example = "0900")
    private String pubStHr;

    /** 게시 종료 시간 (HHMM) */
    @Schema(description = "게시 종료 시간", example = "1800")
    private String pubEndHr;

    /** 오늘 하루동안 그만보기 여부 구분 */
    @Schema(description = "오늘 하루동안 그만보기 여부 구분")
    private String popPubSe;

    /** 게시 여부 (Y/N) */
    @Schema(description = "게시 여부", example = "Y")
    private String pubYn;

    /** 비고 */
    @Schema(description = "비고")
    private String rmk;

    /** 추가 URL */
    @Schema(description = "추가 URL", example = "https://example.com")
    private String addUrl;

    /** URL 타겟 구분 (_self, _blank) */
    @Schema(description = "URL 타겟 구분", example = "_blank")
    private String urlTgtSe;

    /** 팝업 가로 (픽셀) */
    @Schema(description = "팝업 가로 (픽셀)", example = "400")
    private BigDecimal popW;

    /** 가로 위치 (픽셀) */
    @Schema(description = "가로 위치 (픽셀)", example = "100")
    private BigDecimal wPstn;

    /** 팝업 세로 (픽셀) */
    @Schema(description = "팝업 세로 (픽셀)", example = "300")
    private BigDecimal popH;

    /** 세로 위치 (픽셀) */
    @Schema(description = "세로 위치 (픽셀)", example = "100")
    private BigDecimal hPstn;

    /** 첨부파일 아이디 */
    @Schema(description = "첨부파일 아이디")
    private String afileId;

    /** 생성 일시 */
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:00")
    private String crtAt;

    /** 수정 일시 */
    @Schema(description = "수정 일시", example = "2026-03-26 10:30:00")
    private String updAt;
}
