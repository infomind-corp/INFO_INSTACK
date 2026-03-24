package infomind.instack.api.cms.user.service;

import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.common.model.PageResponse;

public interface CmsUserService {

    PageResponse<UserListResponse> list(UserListRequest request);

    UserDetailResponse detail(String userId, String userSe);

    void create(String userSe, CreateUserRequest request);

    void update(String userSe, String userId, UpdateUserRequest request);

    void delete(String userId, String userSe);
}
