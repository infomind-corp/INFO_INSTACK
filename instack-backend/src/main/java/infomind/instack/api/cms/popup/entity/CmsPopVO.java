package infomind.instack.api.cms.popup.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 팝업 VO.
 * <p>CMS_POP 테이블 매핑. 복합 PK: SITE_CD, POP_GRP_ID, POP_ID, LANG_SE.</p>
 */
@Getter
@Setter
public class CmsPopVO extends BaseAuditVO {

    /** 사이트 코드 (PK, FK to CMS_SITE) */
    private String siteCd;

    /** 팝업 그룹 아이디 (PK, FK to CMS_POP_GRP) */
    private String popGrpId;

    /** 팝업 아이디 (PK) */
    private String popId;

    /** 언어 구분 (PK) */
    private String langSe;

    /** 팝업 명 */
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
    private java.math.BigDecimal popW;

    /** 가로 위치 (픽셀) */
    private java.math.BigDecimal wPstn;

    /** 팝업 세로 (픽셀) */
    private java.math.BigDecimal popH;

    /** 세로 위치 (픽셀) */
    private java.math.BigDecimal hPstn;

    /** 첨부파일 아이디 */
    private String afileId;

    public CmsPopVO() {
        super();
    }
}
