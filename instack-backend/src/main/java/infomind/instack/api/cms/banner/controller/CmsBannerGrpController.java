package infomind.instack.api.cms.banner.controller;

import infomind.instack.api.cms.banner.model.BannerGrpRequest;
import infomind.instack.api.cms.banner.model.BannerGrpResponse;
import infomind.instack.api.cms.banner.service.CmsBannerService;
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

/**
 * CMS 배너 그룹 컨트롤러.
 */
@Tag(name = "CMS 배너 그룹 관리", description = "사이트별 배너 그룹 관리 API")
@RestController
@RequestMapping("/api/cms/site/{siteCd}/banner-grp")
@RequiredArgsConstructor
public class CmsBannerGrpController {

    private final CmsBannerService cmsBannerService;

    @AuditLog(action = "배너 그룹 목록 조회")
    @GetMapping
    @Operation(summary = "배너 그룹 목록 조회", description = "사이트의 배너 그룹 목록을 조회합니다. 언어 구분 및 사용 여부로 필터링할 수 있습니다.")
    public ApiResponse<List<BannerGrpResponse>> list(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "언어 구분 (선택사항)", example = "ko") @RequestParam(required = false) String langSe,
            @Parameter(description = "사용 여부 (Y/N, 선택사항)", example = "Y") @RequestParam(required = false) String useYn) {
        BannerGrpRequest request = new BannerGrpRequest();
        request.setSiteCd(siteCd);
        request.setLangSe(langSe);
        request.setUseYn(useYn);
        return ApiResponse.ok(cmsBannerService.listBannerGrp(request));
    }

    @AuditLog(action = "배너 그룹 단건 조회")
    @GetMapping("/{bnrGrpId}")
    @Operation(summary = "배너 그룹 단건 조회", description = "배너 그룹 ID와 언어 구분으로 배너 그룹 상세 정보를 조회합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 그룹 없음")
    })
    public ApiResponse<BannerGrpResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @PathVariable String bnrGrpId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam String langSe) {
        return ApiResponse.ok(cmsBannerService.detailBannerGrp(siteCd, bnrGrpId, langSe));
    }

    @AuditLog(action = "배너 그룹 등록")
    @PostMapping
    @Operation(summary = "배너 그룹 등록", description = "새로운 배너 그룹을 등록합니다.")
    public ApiResponse<Void> create(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody BannerGrpRequest request) {
        cmsBannerService.createBannerGrp(siteCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "배너 그룹 수정")
    @PutMapping("/{bnrGrpId}")
    @Operation(summary = "배너 그룹 수정", description = "배너 그룹 정보를 수정합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 그룹 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @PathVariable String bnrGrpId,
            @Valid @RequestBody BannerGrpRequest request) {
        cmsBannerService.updateBannerGrp(siteCd, bnrGrpId, request.getLangSe(), request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "배너 그룹 삭제")
    @DeleteMapping("/{bnrGrpId}")
    @Operation(summary = "배너 그룹 삭제", description = "배너 그룹과 그룹에 속한 배너를 삭제합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 그룹 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @PathVariable String bnrGrpId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam String langSe) {
        cmsBannerService.deleteBannerGrp(siteCd, bnrGrpId, langSe);
        return ApiResponse.ok();
    }
}
