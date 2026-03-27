package infomind.instack.api.cms.board.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 게시판 VO.
 * <p>CMS_BRD 테이블 매핑. 복합 PK: SITE_CD, BRD_ID, BRD_SE.</p>
 */
@Getter
@Setter
public class CmsBoardVO extends BaseAuditVO {

    /** 사이트 코드 (PK, FK to CMS_SITE) */
    private String siteCd;

    /** 게시판 ID (PK) */
    private String brdId;

    /** 게시판 구분 코드 (PK) */
    private String brdSe;

    /** 게시판 명 */
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

    public CmsBoardVO() {
        super();
    }
}
