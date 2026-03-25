package infomind.instack.api.auth.admin.controller;

import infomind.instack.api.auth.admin.service.AdminAuthService;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.model.RefreshRequest;
import infomind.instack.api.common.aop.AuditLog;
import infomind.instack.api.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Tag(name = "관리자 인증", description = "관리자 JWT 인증 API")
@RestController
@RequestMapping("/api/auth/admin")
@RequiredArgsConstructor
public class AdminAuthController {

    private final AdminAuthService adminAuthService;

    @AuditLog(action = "로그인")
    @Operation(summary = "로그인", description = "아이디/비밀번호로 로그인 후 JWT 토큰을 발급합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "로그인 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "아이디 또는 비밀번호 불일치")
    })
    @PostMapping("/login")
    public ApiResponse<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        return ApiResponse.ok(adminAuthService.login(request));
    }

    @AuditLog(action = "토큰 갱신")
    @Operation(summary = "토큰 갱신", description = "Refresh Token으로 새 Access Token을 발급합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "갱신 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "유효하지 않거나 만료된 Refresh Token")
    })
    @PostMapping("/refresh")
    public ApiResponse<LoginResponse> refresh(@Valid @RequestBody RefreshRequest request) {
        return ApiResponse.ok(adminAuthService.refresh(request));
    }

    @AuditLog(action = "로그아웃")
    @Operation(summary = "로그아웃", description = "Refresh Token을 삭제합니다.")
    @GetMapping("/logout")
    public ApiResponse<Void> logout(@AuthenticationPrincipal AuthUserVO authUserVO) {
        adminAuthService.logout(authUserVO.getId());
        return ApiResponse.ok();
    }
}
