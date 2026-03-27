package infomind.instack.api.cms.popup.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 팝업 그룹 VO.
 * <p>CMS_POP_GRP 테이블 매핑. 복합 PK: SITE_CD, POP_GRP_ID, LANG_SE.</p>
 */
@Getter
@Setter
public class CmsPopGrpVO extends BaseAuditVO {

    /** 사이트 코드 (PK, FK to CMS_SITE) */
    private String siteCd;

    /** 팝업 그룹 아이디 (PK) */
    private String popGrpId;

    /** 언어 구분 (PK) */
    private String langSe;

    /** 팝업 그룹 명 */
    private String popGrpNm;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 팝업 그룹 순서 */
    private Integer popGrpOrd;

    public CmsPopGrpVO() {
        super();
    }
}
