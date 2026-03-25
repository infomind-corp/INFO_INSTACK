package infomind.instack.api.cms.code.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 코드 생성/수정 요청 모델.
 */
@Getter
@Setter
public class CodeRequest {
    @NotBlank(message = "코드는 필수입니다")
    private String cd;

    @NotBlank(message = "코드 명은 필수입니다")
    private String cdNm;

    private String useYn;
    private Integer cdOrd;
    private String refCd1;
    private String refCd2;
    private String refCd3;
    private String refCd4;
    private String refCd5;
    private Double refNum1;
    private Double refNum2;
    private Double refNum3;
    private Double refNum4;
    private Double refNum5;
    private String cdRmk;
}
