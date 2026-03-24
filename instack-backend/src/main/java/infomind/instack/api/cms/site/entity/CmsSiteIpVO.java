package infomind.instack.api.cms.site.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsSiteIpVO extends BaseAuditVO {
    private String siteCd;
    private String sn;
    private String useYn;
    private String ipDesc;
    private String permIp;
    private String useStYmd;
    private String useEndYmd;
}
