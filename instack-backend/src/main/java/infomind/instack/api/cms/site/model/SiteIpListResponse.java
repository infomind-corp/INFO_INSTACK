package infomind.instack.api.cms.site.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteIpListResponse {
    private String siteCd;
    private String sn;
    private String useYn;
    private String ipDesc;
    private String permIp;
    private String useStYmd;
    private String useEndYmd;
}
