package infomind.instack.api.cms.menu.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 메뉴 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "메뉴 조회 응답")
public class MenuResponse {
    @Schema(description = "메뉴 코드", example = "MENU001")
    private String menuCd;

    @Schema(description = "상위 메뉴 코드", example = "MENU001")
    private String upMenuCd;

    @Schema(description = "메뉴 명", example = "통계 관리")
    private String menuNm;

    @Schema(description = "메뉴 레벨", example = "2")
    private Integer menuLvl;

    @Schema(description = "메뉴 순서", example = "10")
    private Integer menuOrd;

    @Schema(description = "소스 파일 명", example = "Statistics.java")
    private String prgmNm;

    @Schema(description = "소스 경로", example = "/src/main/java/statistics")
    private String prgmPath;

    @Schema(description = "조회 사용 여부", example = "Y")
    private String qryUseYn;

    @Schema(description = "신규 사용 여부", example = "Y")
    private String newUseYn;

    @Schema(description = "저장 사용 여부", example = "Y")
    private String saveUseYn;

    @Schema(description = "삭제 사용 여부", example = "Y")
    private String delUseYn;

    @Schema(description = "출력 사용 여부", example = "Y")
    private String outpUseYn;

    @Schema(description = "URL 메서드 구분", example = "INTERNAL")
    private String urlTgtSe;

    @Schema(description = "외부 URL", example = "https://example.com")
    private String urlAddr;

    @Schema(description = "파라미터 1")
    private String param1;

    @Schema(description = "파라미터 2")
    private String param2;

    @Schema(description = "파라미터 3")
    private String param3;

    @Schema(description = "파라미터 4")
    private String param4;

    @Schema(description = "파라미터 5")
    private String param5;

    @Schema(description = "메뉴 비고")
    private String menuRmk;

    @Schema(description = "개인정보 사용 여부", example = "Y")
    private String prvUseYn;

    @Schema(description = "생성 일시", example = "2026-03-25 10:30:45")
    private String crtAt;

    @Schema(description = "수정 일시", example = "2026-03-25 10:30:45")
    private String updAt;
}
