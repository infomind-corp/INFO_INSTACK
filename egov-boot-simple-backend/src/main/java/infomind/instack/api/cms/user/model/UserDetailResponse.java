package infomind.instack.api.cms.user.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDetailResponse {

    private String id;
    private String userSe;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String zip;
    private String stsSe;
    private String authExpYmd;
    private String authGrntYmd;
    private String authRvkSe;
    private String ci;
    private String di;
}
