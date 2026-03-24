package infomind.instack.api.auth.admin.controller;

import infomind.instack.api.auth.admin.service.AdminAuthService;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.model.RefreshRequest;
import infomind.instack.api.common.model.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth/admin")
@RequiredArgsConstructor
public class AdminAuthController {

    private final AdminAuthService adminAuthService;

    @PostMapping("/login")
    public ApiResponse<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        return ApiResponse.ok(adminAuthService.login(request));
    }

    @PostMapping("/refresh")
    public ApiResponse<LoginResponse> refresh(@Valid @RequestBody RefreshRequest request) {
        return ApiResponse.ok(adminAuthService.refresh(request));
    }

    @GetMapping("/logout")
    public ApiResponse<Void> logout(@AuthenticationPrincipal AuthUserVO authUserVO) {
        adminAuthService.logout(authUserVO.getId());
        return ApiResponse.ok();
    }
}
