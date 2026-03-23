package infomind.instack.api.cms.user.controller;

import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.cms.user.service.ManageService;
import infomind.instack.api.common.model.ApiResponse;
import infomind.instack.api.common.model.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cms/user")
@RequiredArgsConstructor
public class ManageController {

    private final ManageService manageService;

    @GetMapping("/list")
    public ApiResponse<PageResponse<UserListResponse>> list(@ModelAttribute UserListRequest request) {
        return ApiResponse.ok(manageService.list(request));
    }

    @GetMapping("/{id}")
    public ApiResponse<UserDetailResponse> detail(@PathVariable String id, @RequestParam String userSe) {
        return ApiResponse.ok(manageService.detail(id, userSe));
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody CreateUserRequest request) {
        manageService.create(request);
        return ApiResponse.ok();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody UpdateUserRequest request) {
        manageService.update(id, request);
        return ApiResponse.ok();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id, @RequestParam String userSe) {
        manageService.delete(id, userSe);
        return ApiResponse.ok();
    }
}
