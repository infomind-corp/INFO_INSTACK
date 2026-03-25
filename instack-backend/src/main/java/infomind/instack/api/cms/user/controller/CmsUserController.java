package infomind.instack.api.cms.user.controller;

import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.cms.user.service.CmsUserService;
import infomind.instack.api.common.aop.AuditLog;
import infomind.instack.api.common.model.ApiResponse;
import infomind.instack.api.common.model.PageResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@Tag(name = "CMS 사용자 관리", description = "CMS 사용자 관리 API")
@RestController
@RequestMapping("/api/cms/user")
@RequiredArgsConstructor
public class CmsUserController {

    private final CmsUserService cmsUserService;

    @AuditLog(action = "사용자 목록 조회")
    @Operation(summary = "사용자 목록 조회")
    @GetMapping("/list")
    public ApiResponse<PageResponse<UserListResponse>> list(@Valid @ModelAttribute UserListRequest request) {
        return ApiResponse.ok(cmsUserService.list(request));
    }

    @AuditLog(action = "사용자 단건 조회")
    @Operation(summary = "사용자 단건 조회")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사용자 없음")
    })
    @GetMapping("/{userSe}/{userId}")
    public ApiResponse<UserDetailResponse> detail(
            @Parameter(description = "사용자 구분 (A: 관리자, E: 업무사용자, G: 일반사용자)") @PathVariable String userSe,
            @Parameter(description = "사용자 ID") @PathVariable String userId) {
        return ApiResponse.ok(cmsUserService.detail(userId, userSe));
    }

    @AuditLog(action = "사용자 생성")
    @Operation(summary = "사용자 생성")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "생성 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "400", description = "유효하지 않은 userSe")
    })
    @PostMapping("/{userSe}")
    public ApiResponse<Void> create(
            @Parameter(description = "사용자 구분 (A: 관리자, E: 업무사용자, G: 일반사용자)") @PathVariable String userSe,
            @Valid @RequestBody CreateUserRequest request) {
        cmsUserService.create(userSe, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "사용자 정보 수정")
    @Operation(summary = "사용자 정보 수정")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사용자 없음")
    })
    @PutMapping("/{userSe}/{userId}")
    public ApiResponse<Void> update(
            @Parameter(description = "사용자 구분 (A: 관리자, E: 업무사용자, G: 일반사용자)") @PathVariable String userSe,
            @Parameter(description = "사용자 ID") @PathVariable String userId,
            @Valid @RequestBody UpdateUserRequest request) {
        cmsUserService.update(userSe, userId, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "사용자 삭제")
    @Operation(summary = "사용자 삭제")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사용자 없음")
    })
    @DeleteMapping("/{userSe}/{userId}")
    public ApiResponse<Void> delete(
            @Parameter(description = "사용자 구분 (A: 관리자, E: 업무사용자, G: 일반사용자)") @PathVariable String userSe,
            @Parameter(description = "사용자 ID") @PathVariable String userId) {
        cmsUserService.delete(userId, userSe);
        return ApiResponse.ok();
    }
}
