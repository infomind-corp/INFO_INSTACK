package infomind.instack.api.cms.user.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsAdminUserVO extends BaseAuditVO {

    private String userId;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String authExpYmd;
    private String authGrntYmd;
    private String authRvkSe;
    private String admStsSe;
    private String ci;
    private String di;
}
