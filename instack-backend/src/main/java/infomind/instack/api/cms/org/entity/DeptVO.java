package infomind.instack.api.cms.org.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 공통 부서 VO.
 * <p>CMS_COM_DEPT 테이블 매핑.</p>
 */
@Getter
@Setter
public class DeptVO extends BaseAuditVO {
    private String deptCd;        // 부서 코드 (PK)
    private String orgCd;         // 조직 코드 (FK)
    private String deptNm;        // 부서 명
    private Integer ord;          // 순서
    private String useYn;         // 사용 여부
    private String searchKeyword; // 검색 키워드 (DB 컬럼 아님)

    public DeptVO() {
        super();
    }
}
