package infomind.instack.api.cms.org.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 공통 조직 VO.
 * <p>CMS_COM_ORG 테이블 매핑.</p>
 */
@Getter
@Setter
public class OrgVO extends BaseAuditVO {
    private String orgCd;         // 조직 코드 (PK)
    private String orgNm;         // 조직 명
    private String orgStsSe;      // 조직 상태 구분
    private Integer ord;          // 순서
    private String useYn;         // 사용 여부
    private String searchKeyword; // 검색 키워드 (DB 컬럼 아님)

    public OrgVO() {
        super();
    }
}
