package infomind.instack.api.cms.content.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 컨텐츠 생성/수정 요청 모델.
 * <p>CMS_CTT 및 CMS_CTT_SEO 필드를 통합한다.
 * 목록 조회 시 파라미터 캐리어로도 사용된다.</p>
 */
@Getter
@Setter
public class ContentRequest {

    // --- 식별자 ---
    /** 사이트 코드 */
    private String siteCd;

    /** 컨텐츠 아이디 (POST 시 필수) */
    @NotBlank(message = "컨텐츠 아이디는 필수입니다")
    private String cttId;

    /** 언어 구분 (POST/PUT 시 필수) */
    @NotBlank(message = "언어 구분은 필수입니다")
    private String langSe;

    // --- CMS_CTT 필드 ---
    /** 컨텐츠 명 */
    @NotBlank(message = "컨텐츠 명은 필수입니다")
    private String cttNm;

    /** 컨텐츠 내용 (puck editor JSON) */
    private String cttDesc;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 게시 여부 (Y/N) */
    private String pubYn;

    /** 게시 시작 일자 (YYYYMMDD) */
    private String pubStYmd;

    /** 게시 시작 시분 (HHmm) */
    private String pubStHhmm;

    /** 게시 종료 일자 (YYYYMMDD) */
    private String pubEndYmd;

    /** 게시 종료 시분 (HHmm) */
    private String pubEndHhmm;

    /** 비고 */
    private String cttRmk;

    // --- CMS_CTT_SEO 필드 (선택) ---
    /** 메타 제목 */
    private String metaTtl;

    /** 메타 설명 */
    private String metaDesc;

    // --- 목록 검색 전용 (DB 컬럼 아님) ---
    /** 컨텐츠 명 키워드 검색 */
    private String keyword;
}
