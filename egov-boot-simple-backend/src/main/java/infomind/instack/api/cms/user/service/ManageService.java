package infomind.instack.api.cms.user.service;

import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.common.model.PageResponse;

public interface ManageService {

    PageResponse<UserListResponse> list(UserListRequest request);

    UserDetailResponse detail(String id, String userSe);

    void create(CreateUserRequest request);

    void update(String id, UpdateUserRequest request);

    void delete(String id, String userSe);
}
