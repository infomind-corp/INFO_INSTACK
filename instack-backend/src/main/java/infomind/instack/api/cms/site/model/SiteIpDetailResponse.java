package infomind.instack.api.cms.site.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteIpDetailResponse {
    private String siteCd;
    private String sn;
    private String useYn;
    private String ipDesc;
    private String permIp;
    private String useStYmd;
    private String useEndYmd;
    private String crtAt;
    private String crtBy;
    private String updAt;
    private String updBy;
}
