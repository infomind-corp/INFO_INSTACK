package infomind.instack.api.cms.content.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 컨텐츠 VO.
 * <p>CMS_CTT 테이블 매핑. SITE_CD + CTT_ID + LANG_SE 복합 PK.</p>
 */
@Getter
@Setter
public class CmsCttVO extends BaseAuditVO {
    private String siteCd;       // 사이트 코드 (PK)
    private String cttId;        // 컨텐츠 아이디 (PK)
    private String langSe;       // 언어 구분 (PK)
    private String cttNm;        // 컨텐츠 명
    private String cttDesc;      // 컨텐츠 내용 (puck editor)
    private String useYn;        // 사용 여부
    private String pubYn;        // 게시 여부
    private String pubStYmd;     // 게시 시작 일자
    private String pubStHhmm;    // 게시 시작 시분
    private String pubEndYmd;    // 게시 종료 일자
    private String pubEndHhmm;   // 게시 종료 시분
    private String cttRmk;       // 비고

    public CmsCttVO() {
        super();
    }
}
