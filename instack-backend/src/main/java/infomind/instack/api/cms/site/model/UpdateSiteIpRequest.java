package infomind.instack.api.cms.site.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateSiteIpRequest {
    private String permIp;
    private String useYn;
    private String ipDesc;
    private String useStYmd;
    private String useEndYmd;
}
