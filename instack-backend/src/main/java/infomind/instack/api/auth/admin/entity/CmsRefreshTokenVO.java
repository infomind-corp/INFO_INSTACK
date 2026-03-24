package infomind.instack.api.auth.admin.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * CMS_RF_TK 테이블 매핑 엔티티
 */
@Getter
@Setter
public class CmsRefreshTokenVO extends BaseAuditVO {
    private String userId;
    private String tk;
    private Date tkExpDt;
    private String rkvYn;
    private String ipAddr;
    private String userAgt;
}
