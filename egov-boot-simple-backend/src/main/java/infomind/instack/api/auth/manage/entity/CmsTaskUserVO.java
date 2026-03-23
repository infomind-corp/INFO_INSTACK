package infomind.instack.api.auth.manage.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsTaskUserVO {

    private String taskUserId;
    private String userNm;
    private String gndrSe;
    private String mtelno;
    private String eml;
    private String telno;
    private String addr;
    private String daddr;
    private String authExpYmd;
    private String authGrntYmd;
    private String authRvkSe;
    private String userStsSe;
    private String deptCd;
    private String orgCd;
    private String ci;
    private String di;
}
