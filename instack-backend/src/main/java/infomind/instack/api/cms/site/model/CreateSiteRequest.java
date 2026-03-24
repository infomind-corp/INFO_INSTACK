package infomind.instack.api.cms.site.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateSiteRequest {

    @NotBlank(message = "사이트 코드는 필수입니다.")
    private String siteCd;

    @NotBlank(message = "사이트 이름은 필수입니다.")
    private String siteNm;

    private String siteDesc;
    private String useYn;

    @NotBlank(message = "허용 IP는 필수입니다.")
    private String permIp;
}
