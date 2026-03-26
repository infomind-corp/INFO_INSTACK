package infomind.instack.api.cms.code.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 코드 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "코드 조회 응답")
public class CodeResponse {
    /**
     * 코드
     */
    @Schema(description = "코드", example = "STATUS")
    private String cd;

    /**
     * 상위 코드
     */
    @Schema(description = "상위 코드", example = "0")
    private String upCd;

    /**
     * 코드 명
     */
    @Schema(description = "코드 명", example = "상태")
    private String cdNm;

    /**
     * 코드 레벨
     */
    @Schema(description = "코드 레벨", example = "1")
    private Integer cdLvl;

    /**
     * 사용 여부 (Y/N)
     */
    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    /**
     * 코드 순서
     */
    @Schema(description = "코드 순서", example = "10")
    private Integer cdOrd;

    /**
     * 참조 코드 1
     */
    @Schema(description = "참조 코드1")
    private String refCd1;

    /**
     * 참조 코드 2
     */
    @Schema(description = "참조 코드2")
    private String refCd2;

    /**
     * 참조 코드 3
     */
    @Schema(description = "참조 코드3")
    private String refCd3;

    /**
     * 참조 코드 4
     */
    @Schema(description = "참조 코드4")
    private String refCd4;

    /**
     * 참조 코드 5
     */
    @Schema(description = "참조 코드5")
    private String refCd5;

    /**
     * 참조 숫자 1
     */
    @Schema(description = "참조 숫자1")
    private Double refNum1;

    /**
     * 참조 숫자 2
     */
    @Schema(description = "참조 숫자2")
    private Double refNum2;

    /**
     * 참조 숫자 3
     */
    @Schema(description = "참조 숫자3")
    private Double refNum3;

    /**
     * 참조 숫자 4
     */
    @Schema(description = "참조 숫자4")
    private Double refNum4;

    /**
     * 참조 숫자 5
     */
    @Schema(description = "참조 숫자5")
    private Double refNum5;

    /**
     * 코드 비고
     */
    @Schema(description = "코드 비고")
    private String cdRmk;

    /**
     * 생성 일시
     */
    @Schema(description = "생성 일시", example = "2026-03-25 10:30:45")
    private String crtAt;

    /**
     * 수정 일시
     */
    @Schema(description = "수정 일시", example = "2026-03-25 10:30:45")
    private String updAt;
}
