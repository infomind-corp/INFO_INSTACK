package infomind.instack.api.cms.user.model;

import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateUserRequest {

    private String userNm;

    @Email(message = "이메일 형식이 올바르지 않습니다.")
    private String eml;

    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String zip;
    private String pwd;
}
