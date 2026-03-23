package infomind.instack.api.auth.manage.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserListResponse {

    private String id;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String userSe;
    private String userStsSe;
}
