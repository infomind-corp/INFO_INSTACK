package infomind.instack.api.auth.jwt.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

/**
 * Refresh Token 저장소 (CMS_RF_TK)
 */
@Getter
@Setter
@NoArgsConstructor
public class RefreshTokenVO extends BaseAuditVO {

    private String tkId;
    private String userId;
    private String tk;
    private Date tkExpDt;
    private String rkvYn;
    private String ipAddr;
    private String userAgt;
    private Date crtAt;
    private Date updAt;
}
