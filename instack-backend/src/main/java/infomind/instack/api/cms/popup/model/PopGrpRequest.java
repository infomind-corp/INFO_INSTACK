package infomind.instack.api.cms.popup.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 팝업 그룹 생성/수정 요청 모델.
 */
@Getter
@Setter
public class PopGrpRequest {

    /** 팝업 그룹 아이디 */
    @NotBlank(message = "팝업 그룹 아이디는 필수입니다")
    private String popGrpId;

    /** 언어 구분 */
    @NotBlank(message = "언어 구분은 필수입니다")
    private String langSe;

    /** 팝업 그룹 명 */
    @NotBlank(message = "팝업 그룹 명은 필수입니다")
    private String popGrpNm;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 팝업 그룹 순서 */
    private Integer popGrpOrd;
}
