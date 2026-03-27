package infomind.instack.api.cms.board.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * 게시판 조회 응답 모델 (목록/상세 공용).
 */
@Getter
@Setter
@Schema(description = "게시판 조회 응답")
public class BoardResponse {

    /** 사이트 코드 */
    @Schema(description = "사이트 코드", example = "SITE001")
    private String siteCd;

    /** 게시판 ID */
    @Schema(description = "게시판 ID", example = "NOTICE")
    private String brdId;

    /** 게시판 구분 코드 */
    @Schema(description = "게시판 구분 코드", example = "BBS")
    private String brdSe;

    /** 게시판 명 */
    @Schema(description = "게시판 명", example = "공지사항")
    private String brdNm;

    /** 게시판 설명 */
    @Schema(description = "게시판 설명", example = "공지사항 게시판입니다")
    private String brdDesc;

    /** 정렬 순서 */
    @Schema(description = "정렬 순서", example = "1")
    private Integer ord;

    /** 사용 여부 (Y/N) */
    @Schema(description = "사용 여부", example = "Y")
    private String useYn;

    /** 로그인 사용자만 사용 여부 (Y/N) */
    @Schema(description = "로그인 사용자만 사용 여부", example = "N")
    private String lgnUserUseYn;

    /** 작성자 개인글 조회 여부 (Y/N) */
    @Schema(description = "작성자 개인글 조회 여부", example = "N")
    private String wrtrPsnQryYn;

    /** 비밀번호 사용 여부 (Y/N) */
    @Schema(description = "비밀번호 사용 여부", example = "N")
    private String pwdUseYn;

    /** 파일 사용 여부 (Y/N) */
    @Schema(description = "파일 사용 여부", example = "Y")
    private String fileUseYn;

    /** 댓글 사용 여부 (Y/N) */
    @Schema(description = "댓글 사용 여부", example = "Y")
    private String cmtUseYn;

    /** 쓰기 권한 코드 */
    @Schema(description = "쓰기 권한 코드", example = "AUTH_USER")
    private String wrtAuthCd;

    /** 조회 권한 코드 */
    @Schema(description = "조회 권한 코드", example = "AUTH_ALL")
    private String qryAuthCd;

    /** 댓글 권한 코드 */
    @Schema(description = "댓글 권한 코드", example = "AUTH_USER")
    private String cmtAuthCd;

    /** 생성 일시 */
    @Schema(description = "생성 일시", example = "2026-03-26 10:30:00")
    private String crtAt;

    /** 수정 일시 */
    @Schema(description = "수정 일시", example = "2026-03-26 10:30:00")
    private String updAt;
}
