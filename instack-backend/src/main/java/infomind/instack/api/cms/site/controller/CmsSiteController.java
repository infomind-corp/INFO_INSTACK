package infomind.instack.api.cms.site.controller;

import infomind.instack.api.cms.site.model.*;
import infomind.instack.api.cms.site.service.CmsSiteService;
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

    @Operation(summary = "사이트 목록 조회")
    @GetMapping
    public ApiResponse<List<SiteListResponse>> list() {
        return ApiResponse.ok(cmsSiteService.list());
    }

    @Operation(summary = "사이트 단건 조회")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    @GetMapping("/{siteCd}")
    public ApiResponse<SiteDetailResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.detail(siteCd));
    }

    @Operation(summary = "사이트 IP 목록 조회")
    @GetMapping("/{siteCd}/ip")
    public ApiResponse<List<SiteIpListResponse>> ipList(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.ipList(siteCd));
    }

    @Operation(summary = "사이트 IP 단건 조회")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "IP 없음")
    })
    @GetMapping("/{siteCd}/ip/{sn}")
    public ApiResponse<SiteIpDetailResponse> ipDetail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "일련번호") @PathVariable String sn) {
        return ApiResponse.ok(cmsSiteService.ipDetail(siteCd, sn));
    }

    @Operation(summary = "사이트 생성")
    @PostMapping
    public ApiResponse<Void> create(@Valid @RequestBody CreateSiteRequest request) {
        cmsSiteService.create(request);
        return ApiResponse.ok();
    }

    @Operation(summary = "사이트 정보 수정")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    @PutMapping("/{siteCd}")
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody UpdateSiteRequest request) {
        cmsSiteService.update(siteCd, request);
        return ApiResponse.ok();
    }

    @Operation(summary = "사이트 IP 수정")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "IP 없음")
    })
    @PutMapping("/{siteCd}/ip/{sn}")
    public ApiResponse<Void> updateIp(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "일련번호") @PathVariable String sn,
            @Valid @RequestBody UpdateSiteIpRequest request) {
        cmsSiteService.updateIp(siteCd, sn, request);
        return ApiResponse.ok();
    }

    @Operation(summary = "사이트 삭제 (연관 IP 포함)")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "사이트 없음")
    })
    @DeleteMapping("/{siteCd}")
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd) {
        cmsSiteService.delete(siteCd);
        return ApiResponse.ok();
    }
}
