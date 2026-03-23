package infomind.instack.api.auth.manage.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateGeneralRequest {

    private String loginId;
    private String userNm;
    private String mtelno;
    private String telno;
    private String gndrSe;
    private String eml;
    private String addr;
    private String daddr;
    private String zip;
    private String pwd;
}
