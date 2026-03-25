package infomind.instack.api.cms.menu.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 메뉴 생성/수정 요청 모델.
 */
@Getter
@Setter
public class MenuRequest {
    @NotBlank(message = "메뉴 코드는 필수입니다")
    private String menuCd;

    @NotBlank(message = "메뉴 명은 필수입니다")
    private String menuNm;

    private Integer menuOrd;
    private String prgmNm;
    private String prgmPath;
    private String qryUseYn;
    private String newUseYn;
    private String saveUseYn;
    private String delUseYn;
    private String outpUseYn;
    private String urlMthdSe;
    private String urlAddr;
    private String param1;
    private String param2;
    private String param3;
    private String param4;
    private String param5;
    private String menuRmk;
    private String prvUseYn;
}
