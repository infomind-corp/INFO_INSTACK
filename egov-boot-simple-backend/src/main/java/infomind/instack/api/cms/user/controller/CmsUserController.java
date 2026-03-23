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

    @GetMapping("/{id}")
    public ApiResponse<UserDetailResponse> detail(@PathVariable String id, @RequestParam String userSe) {
        return ApiResponse.ok(cmsUserService.detail(id, userSe));
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody CreateUserRequest request) {
        cmsUserService.create(request);
        return ApiResponse.ok();
    }

    @PutMapping("/{id}")
    public ApiResponse<Void> update(@PathVariable String id, @RequestBody UpdateUserRequest request) {
        cmsUserService.update(id, request);
        return ApiResponse.ok();
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable String id, @RequestParam String userSe) {
        cmsUserService.delete(id, userSe);
        return ApiResponse.ok();
    }
}
