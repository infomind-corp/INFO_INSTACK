package infomind.instack.api.auth.jwt.controller;

import infomind.instack.api.auth.jwt.service.JwtAuthService;
import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import infomind.instack.api.auth.jwt.model.LoginRequest;
import infomind.instack.api.auth.jwt.model.LoginResponse;
import infomind.instack.api.auth.jwt.model.RefreshRequest;
import infomind.instack.api.common.aop.AuditLog;
import infomind.instack.api.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@Tag(name = "통합 JWT 인증", description = "사용자 유형별 JWT 인증 API (A=관리자, E=업무사용자, G=일반사용자)")
@RestController
@RequestMapping("/api/auth/jwt")
@RequiredArgsConstructor
public class JwtAuthController {

    private final JwtAuthService jwtAuthService;

    @AuditLog(action = "로그인")
    @Operation(summary = "로그인", description = "userSe(A/E/G)에 따라 해당 사용자 테이블에서 인증 후 JWT 발급합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "로그인 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "유효하지 않은 사용자 구분"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "아이디 또는 비밀번호 불일치")
    })
    @PostMapping("/{userSe}/login")
    public ApiResponse<LoginResponse> login(
            @PathVariable @Parameter(description = "사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)") String userSe,
            @Valid @RequestBody LoginRequest request) {
        return ApiResponse.ok(jwtAuthService.login(userSe, request));
    }

    @AuditLog(action = "토큰 갱신")
    @Operation(summary = "토큰 갱신", description = "Refresh Token으로 새 Access Token을 발급합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "갱신 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "401", description = "유효하지 않거나 만료된 Refresh Token")
    })
    @PostMapping("/refresh")
    public ApiResponse<LoginResponse> refresh(@Valid @RequestBody RefreshRequest request) {
        return ApiResponse.ok(jwtAuthService.refresh(request));
    }

    @AuditLog(action = "로그아웃")
    @Operation(summary = "로그아웃", description = "Refresh Token을 삭제합니다.")
    @GetMapping("/logout")
    public ApiResponse<Void> logout(@AuthenticationPrincipal AuthUserVO authUserVO) {
        jwtAuthService.logout(authUserVO.getId());
        return ApiResponse.ok();
    }
}
