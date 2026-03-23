package infomind.instack.api.cms.user.controller;

import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.cms.user.service.CmsUserService;
import infomind.instack.api.common.model.ApiResponse;
import infomind.instack.api.common.model.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cms/user")
@RequiredArgsConstructor
public class CmsUserController {

    private final CmsUserService cmsUserService;

    @GetMapping("/list")
    public ApiResponse<PageResponse<UserListResponse>> list(@ModelAttribute UserListRequest request) {
        return ApiResponse.ok(cmsUserService.list(request));
    }

    @GetMapping("/{userSe}/{userId}")
    public ApiResponse<UserDetailResponse> detail(@PathVariable String userSe, @PathVariable String userId) {
        return ApiResponse.ok(cmsUserService.detail(userId, userSe));
    }

    @PostMapping("/{userSe}")
    public ApiResponse<Void> create(@PathVariable String userSe, @RequestBody CreateUserRequest request) {
        cmsUserService.create(userSe, request);
        return ApiResponse.ok();
    }

    @PutMapping("/{userSe}/{userId}")
    public ApiResponse<Void> update(@PathVariable String userSe, @PathVariable String userId, @RequestBody UpdateUserRequest request) {
        cmsUserService.update(userSe, userId, request);
        return ApiResponse.ok();
    }

    @DeleteMapping("/{userSe}/{userId}")
    public ApiResponse<Void> delete(@PathVariable String userSe, @PathVariable String userId) {
        cmsUserService.delete(userId, userSe);
        return ApiResponse.ok();
    }
}
