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
    /**
     * 코드 (필수)
     */
    @NotBlank(message = "코드는 필수입니다")
    private String cd;

    /**
     * 코드 명 (필수)
     */
    @NotBlank(message = "코드 명은 필수입니다")
    private String cdNm;

    /**
     * 사용 여부 (Y/N)
     */
    private String useYn;

    /**
     * 코드 순서
     */
    private Integer cdOrd;

    /**
     * 참조 코드 1
     */
    private String refCd1;

    /**
     * 참조 코드 2
     */
    private String refCd2;

    /**
     * 참조 코드 3
     */
    private String refCd3;

    /**
     * 참조 코드 4
     */
    private String refCd4;

    /**
     * 참조 코드 5
     */
    private String refCd5;

    /**
     * 참조 숫자 1
     */
    private Double refNum1;

    /**
     * 참조 숫자 2
     */
    private Double refNum2;

    /**
     * 참조 숫자 3
     */
    private Double refNum3;

    /**
     * 참조 숫자 4
     */
    private Double refNum4;

    /**
     * 참조 숫자 5
     */
    private Double refNum5;

    /**
     * 코드 비고
     */
    private String cdRmk;
}
