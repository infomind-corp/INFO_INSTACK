package infomind.instack.api.cms.site.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SitePermitResponse {

    @Schema(description = "사이트 코드")
    private String siteCd;

    @Schema(description = "일련번호")
    private Long sn;

    @Schema(description = "사용 여부")
    private String useYn;

    @Schema(description = "구분 (IP 또는 DOMAIN)")
    private String sitePermKndSe;

    @Schema(description = "허용 IP 주소 또는 도메인명")
    private String sitePermNm;

    @Schema(description = "허용 설명")
    private String sitePermDesc;

    @Schema(description = "사용 시작 일자")
    private String useStYmd;

    @Schema(description = "사용 종료 일자")
    private String useEndYmd;

    @Schema(description = "등록 일시")
    private String crtAt;

    @Schema(description = "등록자")
    private String crtBy;

    @Schema(description = "수정 일시")
    private String updAt;

    @Schema(description = "수정자")
    private String updBy;
}
