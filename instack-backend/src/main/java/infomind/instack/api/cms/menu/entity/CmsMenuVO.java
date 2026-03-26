package infomind.instack.api.cms.menu.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 공통 메뉴 VO.
 * <p>CMS_COM_MENU 테이블 매핑. 메뉴 계층 구조를 self-referencing FK로 관리한다.</p>
 */
@Getter
@Setter
public class CmsMenuVO extends BaseAuditVO {
    private String menuCd;        // 메뉴 코드 (PK)
    private String upMenuCd;      // 상위 메뉴 코드 (FK, self-referencing)
    private String menuNm;        // 메뉴 명
    private Integer menuLvl;      // 메뉴 레벨
    private Integer menuOrd;      // 메뉴 순서
    private String prgmNm;        // 소스 파일 명
    private String prgmPath;      // 소스 경로
    private String qryUseYn;      // 조회 사용 여부
    private String newUseYn;      // 신규 사용 여부
    private String saveUseYn;     // 저장 사용 여부
    private String delUseYn;      // 삭제 사용 여부
    private String outpUseYn;     // 출력 사용 여부
    private String urlTgtSe;     // URL 메서드 구분 (내부/새창)
    private String urlAddr;       // 외부 URL
    private String param1;        // 파라미터 1
    private String param2;        // 파라미터 2
    private String param3;        // 파라미터 3
    private String param4;        // 파라미터 4
    private String param5;        // 파라미터 5
    private String menuRmk;       // 메뉴 비고
    private String prvUseYn;      // 개인정보 사용 여부

    public CmsMenuVO() {
        super();
    }
}
