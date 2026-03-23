package infomind.instack.api.cms.user.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateUserRequest {

    private String userSe;
    private String userId;
    private String pwd;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String zip;
}
