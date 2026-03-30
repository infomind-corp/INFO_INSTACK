package infomind.instack.api.cms.banner.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 배너 생성/수정 요청 모델.
 */
@Getter
@Setter
public class BannerRequest {

    /** 배너 아이디 */
    @NotBlank(message = "배너 아이디는 필수입니다")
    private String bnrId;

    /** 배너 그룹 아이디 (PathVariable 또는 RequestParam에서 주입) */
    private String bnrGrpId;

    /** 사이트 코드 (PathVariable에서 주입) */
    private String siteCd;

    /** 언어 구분 */
    @NotBlank(message = "언어 구분은 필수입니다")
    private String langSe;

    /** 배너 명 */
    @NotBlank(message = "배너 명은 필수입니다")
    private String bnrNm;

    /** 배너 내용 */
    private String bnrDesc;

    /** 첨부파일 아이디 */
    private String afileId;

    /** 순서 */
    private Integer ord;

    /** 게시 시작 일자 (YYYYMMDD) */
    private String pubStYmd;

    /** 게시 시작 시간 (HH24mm) */
    private String pubStHr;

    /** 게시 종료 일자 (YYYYMMDD) */
    private String pubEndYmd;

    /** 게시 종료 시간 (HH24mm) */
    private String pubEndHr;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 배너 구분 (_self 등) */
    private String bnrSe;

    /** 배너 크기 구분 */
    private String bnrSzSe;

    /** 배너 URL */
    private String bnrUrl;

    /** 삭제 여부 (Y/N) */
    private String delYn;

    /** 배너 비고 */
    private String bnrRmk;
}
