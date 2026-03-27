package infomind.instack.api.cms.banner.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 배너 그룹 VO.
 * <p>CMS_BNR_GRP 테이블 매핑. 복합 PK: BNR_GRP_ID, SITE_CD, LANG_SE.</p>
 */
@Getter
@Setter
public class CmsBannerGrpVO extends BaseAuditVO {

    /** 배너 그룹 아이디 (PK) */
    private String bnrGrpId;

    /** 사이트 코드 (PK) */
    private String siteCd;

    /** 언어 구분 (PK) */
    private String langSe;

    /** 배너 그룹 명 */
    private String bnrGrpNm;

    /** 배너 그룹 내용 */
    private String bnrGrpDesc;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 정렬 순서 */
    private Integer sort;

    public CmsBannerGrpVO() {
        super();
    }
}
