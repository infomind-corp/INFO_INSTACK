package infomind.instack.api.cms.content.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 컨텐츠 SEO VO.
 * <p>CMS_CTT_SEO 테이블 매핑. SN + SITE_CD + CTT_ID + LANG_SE 복합 PK.
 * SN은 INSERT 시 SQL 서브쿼리로 자동 채번한다.</p>
 */
@Getter
@Setter
public class CmsCttSeoVO extends BaseAuditVO {
    private Long   sn;           // 일련번호 (PK, SQL 자동 채번)
    private String siteCd;       // 사이트 코드 (PK)
    private String cttId;        // 컨텐츠 아이디 (PK)
    private String langSe;       // 언어 구분 (PK)
    private String metaTtl;      // 메타 제목
    private String metaDesc;     // 메타 설명

    public CmsCttSeoVO() {
        super();
    }
}
