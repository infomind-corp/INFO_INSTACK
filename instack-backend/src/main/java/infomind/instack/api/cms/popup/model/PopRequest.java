package infomind.instack.api.cms.popup.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 팝업 생성/수정 요청 모델.
 */
@Getter
@Setter
public class PopRequest {

    /** 팝업 그룹 아이디 */
    @NotBlank(message = "팝업 그룹 아이디는 필수입니다")
    private String popGrpId;

    /** 팝업 아이디 */
    @NotBlank(message = "팝업 아이디는 필수입니다")
    private String popId;

    /** 언어 구분 */
    @NotBlank(message = "언어 구분은 필수입니다")
    private String langSe;

    /** 팝업 명 */
    @NotBlank(message = "팝업 명은 필수입니다")
    private String popNm;

    /** 팝업 제목 */
    private String popTtl;

    /** 팝업 내용 */
    private String popDesc;

    /** 게시 시작 일자 (YYYYMMDD) */
    private String pubStYmd;

    /** 게시 종료 일자 (YYYYMMDD) */
    private String pubEndYmd;

    /** 게시 시작 시간 (HHMM) */
    private String pubStHr;

    /** 게시 종료 시간 (HHMM) */
    private String pubEndHr;

    /** 오늘 하루동안 그만보기 여부 구분 */
    private String popPubSe;

    /** 게시 여부 (Y/N) */
    private String pubYn;

    /** 비고 */
    private String rmk;

    /** 추가 URL */
    private String addUrl;

    /** URL 타겟 구분 (_self, _blank) */
    private String urlTgtSe;

    /** 팝업 가로 (픽셀) */
    private BigDecimal popW;

    /** 가로 위치 (픽셀) */
    private BigDecimal wPstn;

    /** 팝업 세로 (픽셀) */
    private BigDecimal popH;

    /** 세로 위치 (픽셀) */
    private BigDecimal hPstn;

    /** 첨부파일 아이디 */
    private String afileId;
}
