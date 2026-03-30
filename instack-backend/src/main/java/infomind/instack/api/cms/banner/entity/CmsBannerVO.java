package infomind.instack.api.cms.banner.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 배너 VO.
 * <p>CMS_BNR 테이블 매핑. 복합 PK: BNR_ID, BNR_GRP_ID, SITE_CD, LANG_SE.</p>
 */
@Getter
@Setter
public class CmsBannerVO extends BaseAuditVO {

    /** 배너 아이디 (PK) */
    private String bnrId;

    /** 배너 그룹 아이디 (PK, FK to CMS_BNR_GRP) */
    private String bnrGrpId;

    /** 사이트 코드 (PK) */
    private String siteCd;

    /** 언어 구분 (PK) */
    private String langSe;

    /** 배너 명 */
    private String bnrNm;

    /** 배너 내용 */
    private String bnrDesc;

    /** 첨부파일 아이디 */
    private String afileId;

    /** 순서 */
    private Integer ord;

    /** 게시 시작 일자 (YYYYMMDD) */
    private String pubStYmd;

    /** 게시 시작 시간 (HH24mm) */
    private String pubStHr;

    /** 게시 종료 일자 (YYYYMMDD) */
    private String pubEndYmd;

    /** 게시 종료 시간 (HH24mm) */
    private String pubEndHr;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 배너 구분 (_self 등) */
    private String bnrSe;

    /** 배너 크기 구분 */
    private String bnrSzSe;

    /** 배너 URL */
    private String bnrUrl;

    /** 삭제 여부 (Y/N) */
    private String delYn;

    /** 배너 비고 */
    private String bnrRmk;

    public CmsBannerVO() {
        super();
    }
}
