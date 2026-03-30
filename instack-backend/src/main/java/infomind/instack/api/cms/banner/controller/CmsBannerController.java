package infomind.instack.api.cms.banner.controller;

import infomind.instack.api.cms.banner.model.BannerRequest;
import infomind.instack.api.cms.banner.model.BannerResponse;
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
 * CMS 배너 컨트롤러.
 */
@Tag(name = "CMS 배너 관리", description = "사이트별 배너 관리 API")
@RestController
@RequestMapping("/api/cms/site/{siteCd}/banner")
@RequiredArgsConstructor
public class CmsBannerController {

    private final CmsBannerService cmsBannerService;

    @AuditLog(action = "배너 목록 조회")
    @GetMapping
    @Operation(summary = "배너 목록 조회", description = "사이트의 배너 목록을 조회합니다. 배너 그룹, 언어 구분, 사용 여부로 필터링할 수 있습니다.")
    public ApiResponse<List<BannerResponse>> list(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 그룹 아이디 (선택사항)", example = "GRP_MAIN") @RequestParam(required = false) String bnrGrpId,
            @Parameter(description = "언어 구분 (선택사항)", example = "ko") @RequestParam(required = false) String langSe,
            @Parameter(description = "사용 여부 (Y/N, 선택사항)", example = "Y") @RequestParam(required = false) String useYn) {
        BannerRequest request = new BannerRequest();
        request.setSiteCd(siteCd);
        request.setBnrGrpId(bnrGrpId);
        request.setLangSe(langSe);
        request.setUseYn(useYn);
        return ApiResponse.ok(cmsBannerService.listBanner(request));
    }

    @AuditLog(action = "배너 단건 조회")
    @GetMapping("/{bnrId}")
    @Operation(summary = "배너 단건 조회", description = "배너 ID, 배너 그룹 아이디, 언어 구분으로 배너 상세 정보를 조회합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 없음")
    })
    public ApiResponse<BannerResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 아이디", example = "BNR_001") @PathVariable String bnrId,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @RequestParam String bnrGrpId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam String langSe) {
        return ApiResponse.ok(cmsBannerService.detailBanner(siteCd, bnrGrpId, bnrId, langSe));
    }

    @AuditLog(action = "배너 등록")
    @PostMapping
    @Operation(summary = "배너 등록", description = "새로운 배너를 등록합니다.")
    public ApiResponse<Void> create(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @RequestParam String bnrGrpId,
            @Valid @RequestBody BannerRequest request) {
        cmsBannerService.createBanner(siteCd, bnrGrpId, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "배너 수정")
    @PutMapping("/{bnrId}")
    @Operation(summary = "배너 수정", description = "배너 정보를 수정합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 아이디", example = "BNR_001") @PathVariable String bnrId,
            @Valid @RequestBody BannerRequest request) {
        cmsBannerService.updateBanner(siteCd, request.getBnrGrpId(), bnrId, request.getLangSe(), request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "배너 삭제")
    @DeleteMapping("/{bnrId}")
    @Operation(summary = "배너 삭제", description = "배너를 삭제합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "배너 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "배너 아이디", example = "BNR_001") @PathVariable String bnrId,
            @Parameter(description = "배너 그룹 아이디", example = "GRP_MAIN") @RequestParam String bnrGrpId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam String langSe) {
        cmsBannerService.deleteBanner(siteCd, bnrGrpId, bnrId, langSe);
        return ApiResponse.ok();
    }
}
