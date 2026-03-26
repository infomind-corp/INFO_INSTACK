package infomind.instack.api.auth.sns.controller;

import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.sns.model.SnsCallbackRequest;
import infomind.instack.api.auth.sns.service.SnsAuthService;
import infomind.instack.api.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth/sns")
@RequiredArgsConstructor
@Tag(name = "SNS Auth", description = "SNS OAuth 인증 API")
public class SnsAuthController {
    private final SnsAuthService snsAuthService;

    @PostMapping("/{provider}/callback")
    @Operation(
        summary = "SNS OAuth 콜백 처리",
        description = "Authorization Code를 받아 SNS 인증을 처리하고 JWT 토큰을 발급합니다."
    )
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(
            responseCode = "200",
            description = "인증 성공",
            content = @Content(schema = @Schema(implementation = ApiResponse.class))
        ),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(
            responseCode = "400",
            description = "요청 오류"
        ),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(
            responseCode = "401",
            description = "인증 실패 또는 로그인 비허용"
        ),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(
            responseCode = "403",
            description = "연동 정보 없음"
        )
    })
    public ResponseEntity<ApiResponse<LoginResponse>> handleCallback(
        @PathVariable
        @Parameter(description = "SNS 공급자", example = "google")
        String provider,

        @RequestBody
        @Valid
        SnsCallbackRequest request
    ) {
        LoginResponse response = snsAuthService.handleCallback(provider, request);
        return ResponseEntity.ok(ApiResponse.ok(response));
    }
}
