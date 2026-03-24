package infomind.instack.api.cms.site.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateSiteRequest {
    private String siteNm;
    private String siteDesc;
    private String useYn;
}
