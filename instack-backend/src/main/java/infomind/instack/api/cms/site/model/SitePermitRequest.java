package infomind.instack.api.cms.site.model;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SitePermitRequest {

    @NotBlank(message = "허용 IP/도메인명은 필수입니다.")
    @Schema(description = "허용 IP 주소 또는 도메인명", example = "192.168.1.1")
    private String sitePermNm;

    @NotBlank(message = "구분(IP/DOMAIN)은 필수입니다.")
    @Schema(description = "구분 (IP 또는 DOMAIN)", example = "IP")
    private String sitePermKndSe;

    @Schema(description = "허용 설명")
    private String sitePermDesc;

    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    @Schema(description = "사용 시작 일자", example = "20260101")
    private String useStYmd;

    @Schema(description = "사용 종료 일자", example = "20261231")
    private String useEndYmd;
}
