package infomind.instack.api.auth.manage.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsAdminUserVO {

    private String admId;
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
    private String deptCd;
    private String orgCd;
    private String ci;
    private String di;
}
