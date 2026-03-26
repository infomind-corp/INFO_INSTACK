package infomind.instack.api.cms.site.model;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SiteRequest {

    @NotBlank(message = "사이트 코드는 필수입니다.")
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    @NotBlank(message = "사이트 이름은 필수입니다.")
    @Schema(description = "사이트 명", example = "인스택 메인")
    private String siteNm;

    @NotBlank(message = "사이트 URL은 필수입니다.")
    @Schema(description = "사이트 URL", example = "https://instack.co.kr")
    private String siteUrl;

    @Schema(description = "사이트 설명")
    private String siteDesc;

    @Schema(description = "사용 여부", example = "Y")
    private String useYn;
}
