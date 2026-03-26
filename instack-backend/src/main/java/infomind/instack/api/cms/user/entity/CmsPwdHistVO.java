package infomind.instack.api.cms.user.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsPwdHistVO extends BaseAuditVO {

    private Long sn;
    private String pwd;
    private String userSe;
    private String pwdChgYmd;
    private String pwdChgSe;
    private String chgUserId;
    private String chgUserSe;
    private String chgUserIp;
    private String pwdExpYmd;
    private String lockYn;
    private java.util.Date lockDt;
    private java.util.Date lockRvkDt;
}
