package infomind.instack.api.cms.code.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS 공통 코드 VO.
 * <p>CMS_COM_CODE 테이블 매핑. 코드 계층 구조를 self-referencing FK로 관리한다.</p>
 * <p>최상위 코드는 UP_CD = '0' 으로 처리한다.</p>
 */
@Getter
@Setter
public class CmsCodeVO extends BaseAuditVO {
    private String cd;            // 코드 (PK)
    private String upCd;          // 상위 코드 (PK, self-referencing, 최상위='0')
    private String cdNm;          // 코드 명
    private Integer cdLvl;        // 코드 레벨 (1=최상위, 상위 레벨+1로 자동 계산)
    private String useYn;         // 사용 여부
    private Integer cdOrd;        // 코드 순서
    private String refCd1;        // 참조 코드1
    private String refCd2;        // 참조 코드2
    private String refCd3;        // 참조 코드3
    private String refCd4;        // 참조 코드4
    private String refCd5;        // 참조 코드5
    private Double refNum1;       // 참조 숫자1
    private Double refNum2;       // 참조 숫자2
    private Double refNum3;       // 참조 숫자3
    private Double refNum4;       // 참조 숫자4
    private Double refNum5;       // 참조 숫자5
    private String cdRmk;         // 코드 비고

    public CmsCodeVO() {
        super();
    }
}
