package infomind.instack.api.cms.popup.controller;

import infomind.instack.api.cms.popup.model.PopGrpRequest;
import infomind.instack.api.cms.popup.model.PopGrpResponse;
import infomind.instack.api.cms.popup.service.CmsPopGrpService;
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
 * CMS 팝업 그룹 컨트롤러.
 */
@Tag(name = "CMS 팝업 그룹 관리", description = "사이트별 팝업 그룹 관리 API")
@RestController
@RequestMapping("/api/cms/site/{siteCd}/popup-group")
@RequiredArgsConstructor
public class CmsPopGrpController {

    private final CmsPopGrpService cmsPopGrpService;

    @AuditLog(action = "팝업 그룹 목록 조회")
    @GetMapping
    @Operation(summary = "팝업 그룹 목록 조회", description = "사이트의 팝업 그룹 목록을 조회합니다. langSe로 필터링할 수 있습니다.")
    public ApiResponse<List<PopGrpResponse>> list(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "언어 구분 (선택사항)", example = "ko") @RequestParam(required = false) String langSe) {
        return ApiResponse.ok(cmsPopGrpService.list(siteCd, langSe));
    }

    @AuditLog(action = "팝업 그룹 단건 조회")
    @GetMapping("/{popGrpId}")
    @Operation(summary = "팝업 그룹 단건 조회", description = "팝업 그룹 ID로 팝업 그룹 상세 정보를 조회합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "팝업 그룹 없음")
    })
    public ApiResponse<PopGrpResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "팝업 그룹 아이디", example = "POP_MAIN") @PathVariable String popGrpId,
            @Parameter(description = "언어 구분 (선택사항)", example = "ko") @RequestParam(required = false) String langSe) {
        return ApiResponse.ok(cmsPopGrpService.detail(siteCd, popGrpId, langSe));
    }

    @AuditLog(action = "팝업 그룹 등록")
    @PostMapping
    @Operation(summary = "팝업 그룹 등록", description = "새로운 팝업 그룹을 등록합니다.")
    public ApiResponse<Void> create(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody PopGrpRequest request) {
        cmsPopGrpService.create(siteCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "팝업 그룹 수정")
    @PutMapping("/{popGrpId}")
    @Operation(summary = "팝업 그룹 수정", description = "팝업 그룹 정보를 수정합니다. 요청 body의 langSe로 수정 대상 언어를 지정합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "팝업 그룹 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "팝업 그룹 아이디", example = "POP_MAIN") @PathVariable String popGrpId,
            @Valid @RequestBody PopGrpRequest request) {
        cmsPopGrpService.update(siteCd, popGrpId, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "팝업 그룹 삭제")
    @DeleteMapping("/{popGrpId}")
    @Operation(summary = "팝업 그룹 삭제", description = "팝업 그룹과 연관된 팝업을 함께 삭제합니다. langSe 미지정 시 전 언어 삭제.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "팝업 그룹 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "팝업 그룹 아이디", example = "POP_MAIN") @PathVariable String popGrpId,
            @Parameter(description = "언어 구분 (미지정 시 전 언어 삭제)", example = "ko") @RequestParam(required = false) String langSe) {
        cmsPopGrpService.delete(siteCd, popGrpId, langSe);
        return ApiResponse.ok();
    }
}
