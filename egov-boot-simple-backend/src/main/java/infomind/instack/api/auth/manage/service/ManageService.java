package infomind.instack.api.auth.manage.service;

import infomind.instack.api.auth.manage.model.*;
import infomind.instack.api.common.model.PageResponse;

public interface ManageService {

    PageResponse<UserListResponse> list(UserListRequest request);

    void createAdmin(CreateAdminRequest request);

    void createEmployee(CreateEmployeeRequest request);

    void createGeneral(CreateGeneralRequest request);

    void update(String id, UpdateUserRequest request);

    void delete(String id, String userSe);
}
