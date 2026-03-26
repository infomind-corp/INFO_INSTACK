package infomind.instack.api.cms.site.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteUpdateRequest {

    @Schema(description = "사이트 명")
    private String siteNm;

    @Schema(description = "사이트 URL")
    private String siteUrl;

    @Schema(description = "사이트 설명")
    private String siteDesc;

    @Schema(description = "사용 여부", example = "Y")
    private String useYn;
}
