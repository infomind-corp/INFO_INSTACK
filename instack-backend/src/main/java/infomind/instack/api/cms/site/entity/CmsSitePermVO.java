package infomind.instack.api.cms.site.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsSitePermVO extends BaseAuditVO {
    private String siteCd;
    private Long sn;
    private String useYn;
    private String sitePermKndSe;
    private String sitePermNm;
    private String sitePermDesc;
    private String useStYmd;
    private String useEndYmd;
}
