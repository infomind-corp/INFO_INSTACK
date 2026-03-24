package infomind.instack.api.cms.user.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsPasswordVO extends BaseAuditVO {

    private String userId;
    private String userSe;
    private String pwd;
    private String useYn;
}
