package infomind.instack.api.cms.site.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteResponse {

    @Schema(description = "사이트 코드")
    private String siteCd;

    @Schema(description = "사이트 명")
    private String siteNm;

    @Schema(description = "사이트 URL")
    private String siteUrl;

    @Schema(description = "사이트 설명")
    private String siteDesc;

    @Schema(description = "사용 여부")
    private String useYn;

    @Schema(description = "등록 일시")
    private String crtAt;

    @Schema(description = "등록자")
    private String crtBy;

    @Schema(description = "수정 일시")
    private String updAt;

    @Schema(description = "수정자")
    private String updBy;
}
