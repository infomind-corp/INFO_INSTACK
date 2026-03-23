package infomind.instack.api.cms.manage.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateUserRequest {

    private String userSe;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String zip;
    private String pwd;
}
