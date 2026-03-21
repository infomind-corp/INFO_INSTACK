package infomind.instack.api.auth.basic.controller;

import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.service.AuthService;
import infomind.instack.api.common.model.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ApiResponse<LoginResponse> login(@RequestBody LoginRequest request) {
        return ApiResponse.ok(authService.login(request));
    }

    @PostMapping("/refresh")
    public ApiResponse<LoginResponse> refresh() {

        return ApiResponse.ok();
    }

    @GetMapping("/logout")
    public ApiResponse<Void> logout(@AuthenticationPrincipal AuthUserVO authUserVO) {
        authService.logout(authUserVO.getMemberId());
        return ApiResponse.ok();
    }
}