package infomind.instack.api.cms.content.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 컨텐츠 조회 응답 모델 (목록/상세 공용).
 * <p>CMS_CTT 및 CMS_CTT_SEO 정보를 통합한다.</p>
 */
@Getter
@Setter
@Schema(description = "컨텐츠 조회 응답")
public class ContentResponse {

    // --- CMS_CTT 필드 ---
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    @Schema(description = "컨텐츠 아이디", example = "CTT_MAIN_BANNER")
    private String cttId;

    @Schema(description = "언어 구분", example = "ko")
    private String langSe;

    @Schema(description = "컨텐츠 명", example = "메인 배너")
    private String cttNm;

    @Schema(description = "컨텐츠 내용 (puck editor JSON)")
    private String cttDesc;

    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    @Schema(description = "게시 여부", example = "Y")
    private String pubYn;

    @Schema(description = "게시 시작 일자", example = "20260101")
    private String pubStYmd;

    @Schema(description = "게시 시작 시분", example = "0900")
    private String pubStHhmm;

    @Schema(description = "게시 종료 일자", example = "20261231")
    private String pubEndYmd;

    @Schema(description = "게시 종료 시분", example = "1800")
    private String pubEndHhmm;

    @Schema(description = "비고")
    private String cttRmk;

    // --- CMS_CTT_SEO 필드 (nullable) ---
    @Schema(description = "SEO 일련번호")
    private Long seoSn;

    @Schema(description = "메타 제목", example = "메인 배너 - 사이트명")
    private String metaTtl;

    @Schema(description = "메타 설명", example = "메인 배너 설명")
    private String metaDesc;

    // --- 감사 ---
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:45")
    private String crtAt;

    @Schema(description = "수정 일시", example = "2026-03-26 10:30:45")
    private String updAt;
}
