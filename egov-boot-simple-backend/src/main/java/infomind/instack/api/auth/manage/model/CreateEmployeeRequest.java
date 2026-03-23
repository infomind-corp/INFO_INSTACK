package infomind.instack.api.auth.manage.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateEmployeeRequest {

    private String loginId;
    private String userNm;
    private String gndrSe;
    private String mtelno;
    private String eml;
    private String telno;
    private String addr;
    private String daddr;
    private String deptCd;
    private String orgCd;
    private String pwd;
}
