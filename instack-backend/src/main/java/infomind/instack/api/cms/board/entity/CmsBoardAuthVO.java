package infomind.instack.api.cms.board.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 게시판 권한 VO.
 * <p>CMS_BRD_AUTH 테이블 매핑. 복합 PK: BRD_ID, BRD_SE, SITE_CD (FK to CMS_BRD).</p>
 */
@Getter
@Setter
public class CmsBoardAuthVO extends BaseAuditVO {

    /** 게시판 ID (PK, FK) */
    private String brdId;

    /** 게시판 구분 코드 (PK, FK) */
    private String brdSe;

    /** 사이트 코드 (PK, FK) */
    private String siteCd;

    /** 쓰기 권한 코드 */
    private String wrtAuthCd;

    /** 조회 권한 코드 */
    private String qryAuthCd;

    /** 댓글 권한 코드 */
    private String cmtAuthCd;

    public CmsBoardAuthVO() {
        super();
    }
}
