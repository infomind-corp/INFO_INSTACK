package infomind.instack.api.cms.site.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteDetailResponse {
    private String siteCd;
    private String siteNm;
    private String siteDesc;
    private String useYn;
    private String crtAt;
    private String crtBy;
    private String updAt;
    private String updBy;
}
