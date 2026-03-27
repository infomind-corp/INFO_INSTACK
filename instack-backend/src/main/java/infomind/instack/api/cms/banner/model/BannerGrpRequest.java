package infomind.instack.api.cms.banner.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 배너 그룹 생성/수정 요청 모델.
 */
@Getter
@Setter
public class BannerGrpRequest {

    /** 배너 그룹 아이디 */
    @NotBlank(message = "배너 그룹 아이디는 필수입니다")
    private String bnrGrpId;

    /** 사이트 코드 (PathVariable에서 주입) */
    private String siteCd;

    /** 언어 구분 */
    @NotBlank(message = "언어 구분은 필수입니다")
    private String langSe;

    /** 배너 그룹 명 */
    @NotBlank(message = "배너 그룹 명은 필수입니다")
    private String bnrGrpNm;

    /** 배너 그룹 내용 */
    private String bnrGrpDesc;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 정렬 순서 */
    private Integer sort;
}
