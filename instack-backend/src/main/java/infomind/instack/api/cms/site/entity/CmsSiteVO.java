package infomind.instack.api.cms.site.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsSiteVO extends BaseAuditVO {
    private String siteCd;
    private String siteNm;
    private String siteDesc;
    private String useYn;
}
