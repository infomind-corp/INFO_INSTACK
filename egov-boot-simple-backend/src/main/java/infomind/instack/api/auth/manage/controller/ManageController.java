package infomind.instack.api.auth.manage.controller;

import infomind.instack.api.auth.manage.model.*;
import infomind.instack.api.auth.manage.service.ManageService;
import infomind.instack.api.common.model.ApiResponse;
import infomind.instack.api.common.model.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth/manage")
@RequiredArgsConstructor
public class ManageController {

    private final ManageService manageService;

    @GetMapping("/list")
    public ApiResponse<PageResponse<UserListResponse>> list(@ModelAttribute UserListRequest request) {
        return ApiResponse.ok(manageService.list(request));
    }

    @PostMapping("/create/admin")
    public ApiResponse<Void> createAdmin(@RequestBody CreateAdminRequest request) {
        manageService.createAdmin(request);
        return ApiResponse.ok();
    }

    @PostMapping("/create/employee")
    public ApiResponse<Void> createEmployee(@RequestBody CreateEmployeeRequest request) {
        manageService.createEmployee(request);
        return ApiResponse.ok();
    }

    @PostMapping("/create/general")
    public ApiResponse<Void> createGeneral(@RequestBody CreateGeneralRequest request) {
        manageService.createGeneral(request);
        return ApiResponse.ok();
    }

    @PutMapping("/update/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody UpdateUserRequest request) {
        manageService.update(id, request);
        return ApiResponse.ok();
    }

    @DeleteMapping("/delete/{id}")
    public ApiResponse<Void> delete(@PathVariable String id, @RequestParam String userSe) {
        manageService.delete(id, userSe);
        return ApiResponse.ok();
    }
}
