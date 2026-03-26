package infomind.instack.api.cms.board.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * 게시판 생성/수정 요청 모델.
 */
@Getter
@Setter
public class BoardRequest {

    /** 게시판 ID */
    @NotBlank(message = "게시판 ID는 필수입니다")
    private String brdId;

    /** 게시판 구분 코드 */
    @NotBlank(message = "게시판 구분은 필수입니다")
    private String brdSe;

    /** 게시판 명 */
    @NotBlank(message = "게시판 명은 필수입니다")
    private String brdNm;

    /** 게시판 설명 */
    private String brdDesc;

    /** 정렬 순서 */
    private Integer ord;

    /** 사용 여부 (Y/N) */
    private String useYn;

    /** 로그인 사용자만 사용 여부 (Y/N) */
    private String lgnUserUseYn;

    /** 작성자 개인글 조회 여부 (Y/N) */
    private String wrtrPsnQryYn;

    /** 비밀번호 사용 여부 (Y/N) */
    private String pwdUseYn;

    /** 파일 사용 여부 (Y/N) */
    private String fileUseYn;

    /** 댓글 사용 여부 (Y/N) */
    private String cmtUseYn;

    /** 쓰기 권한 코드 */
    private String wrtAuthCd;

    /** 조회 권한 코드 */
    private String qryAuthCd;

    /** 댓글 권한 코드 */
    private String cmtAuthCd;
}
