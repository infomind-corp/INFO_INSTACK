package infomind.instack.api.cms.manage.model;

import infomind.instack.api.common.model.PageRequest;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserListRequest extends PageRequest {

    private String userSe;
}
