package infomind.instack.api.common.entity;

import infomind.instack.api.common.util.AuditHolder;
import lombok.Getter;
import lombok.Setter;

/**
 * 공통 감사 컬럼 기본 VO.
 * <p>모든 테이블의 감사 컬럼(CRT_BY, CRT_IP, CRT_PGM, UPD_BY, UPD_IP, UPD_PGM)을 보유한다.
 * 생성자에서 {@link infomind.instack.api.common.util.AuditHolder}를 통해 값을 자동으로 채운다.
 * DB INSERT/UPDATE 시 {@code SYSDATE} 기반 날짜 컬럼(CRT_AT, UPD_AT)은 Mapper XML에서 처리된다.</p>
 */
@Getter
@Setter
public abstract class BaseAuditVO {

    private String crtBy;
    private String crtIp;
    private String crtPgm;
    private String updBy;
    private String updIp;
    private String updPgm;

    protected BaseAuditVO() {
        AuditHolder.Audit audit = AuditHolder.get();
        this.crtBy  = audit.by();   this.updBy  = audit.by();
        this.crtIp  = audit.ip();   this.updIp  = audit.ip();
        this.crtPgm = audit.pgm();  this.updPgm = audit.pgm();
    }
}
