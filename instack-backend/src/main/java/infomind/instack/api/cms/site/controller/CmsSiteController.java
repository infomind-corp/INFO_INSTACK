package infomind.instack.api.cms.site.controller;

import infomind.instack.api.cms.site.model.*;
import infomind.instack.api.cms.site.service.CmsSiteService;
import infomind.instack.api.common.aop.AuditLog;
import infomind.instack.api.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "CMS 사이트 관리", description = "CMS 사이트 관리 API")
@RestController
@RequestMapping("/api/cms/site")
@RequiredArgsConstructor
public class CmsSiteController {

    private final CmsSiteService cmsSiteService;

    // ===== SITE =====

    @AuditLog(action = "사이트 목록 조회")
    @GetMapping
    @Operation(summary = "사이트 목록 조회")
    public ApiResponse<List<SiteResponse>> list() {
        return ApiResponse.ok(cmsSiteService.list());
    }

    @AuditLog(action = "사이트 단건 조회")
    @GetMapping("/{siteCd}")
    @Operation(summary = "사이트 단건 조회")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    public ApiResponse<SiteResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.detail(siteCd));
    }

    @AuditLog(action = "사이트 생성")
    @PostMapping
    @Operation(summary = "사이트 생성")
    public ApiResponse<Void> create(@Valid @RequestBody SiteRequest request) {
        cmsSiteService.create(request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "사이트 정보 수정")
    @PutMapping("/{siteCd}")
    @Operation(summary = "사이트 정보 수정")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody SiteUpdateRequest request) {
        cmsSiteService.update(siteCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "사이트 삭제 (연관 허용 정보 포함)")
    @DeleteMapping("/{siteCd}")
    @Operation(summary = "사이트 삭제 (연관 허용 정보 포함)")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        cmsSiteService.delete(siteCd);
        return ApiResponse.ok();
    }

    // ===== PERMIT =====

    @AuditLog(action = "사이트 허용 목록 조회")
    @GetMapping("/{siteCd}/permit")
    @Operation(summary = "사이트 허용 목록 조회")
    public ApiResponse<List<SitePermitResponse>> permitList(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.permitList(siteCd));
    }

    @AuditLog(action = "사이트 허용 단건 조회")
    @GetMapping("/{siteCd}/permit/{sn}")
    @Operation(summary = "사이트 허용 단건 조회")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "허용 정보 없음")
    })
    public ApiResponse<SitePermitResponse> permitDetail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "일련번호") @PathVariable Long sn) {
        return ApiResponse.ok(cmsSiteService.permitDetail(siteCd, sn));
    }

    @AuditLog(action = "사이트 허용 등록")
    @PostMapping("/{siteCd}/permit")
    @Operation(summary = "사이트 허용 등록")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    public ApiResponse<Void> createPermit(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody SitePermitRequest request) {
        cmsSiteService.createPermit(siteCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "사이트 허용 수정")
    @PutMapping("/{siteCd}/permit/{sn}")
    @Operation(summary = "사이트 허용 수정")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "허용 정보 없음")
    })
    public ApiResponse<Void> updatePermit(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "일련번호") @PathVariable Long sn,
            @Valid @RequestBody SitePermitRequest request) {
        cmsSiteService.updatePermit(siteCd, sn, request);
        return ApiResponse.ok();
    }
}
