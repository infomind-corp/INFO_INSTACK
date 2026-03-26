package infomind.instack.api.cms.code.controller;

import infomind.instack.api.cms.code.model.CodeRequest;
import infomind.instack.api.cms.code.model.CodeResponse;
import infomind.instack.api.cms.code.service.CmsCodeService;
import infomind.instack.api.common.aop.AuditLog;
import infomind.instack.api.common.model.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * CMS 공통 코드 컨트롤러.
 */
@RestController
@RequestMapping("/api/cms/code")
@RequiredArgsConstructor
@Tag(name = "CMS 공통 코드 관리", description = "CMS 공통 코드 조회/등록/수정/삭제 API")
public class CmsCodeController {

    private final CmsCodeService cmsCodeService;

    @AuditLog(action = "하위 코드 목록 조회")
    @GetMapping("/top/{upCd}")
    @Operation(summary = "하위 코드 목록 조회", description = "특정 코드의 하위 코드(UP_CD = {upCd}) 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = CodeResponse.class)))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "상위 코드를 찾을 수 없음")
    })
    public ApiResponse<List<CodeResponse>> listByUpCd(
            @Parameter(description = "상위 코드", example = "STATUS")
            @PathVariable String upCd) {
        return ApiResponse.ok(cmsCodeService.listByUpCd(upCd));
    }

    @AuditLog(action = "코드 단건 조회")
    @GetMapping("/{upCd}/{cd}")
    @Operation(summary = "코드 단건 조회", description = "특정 코드의 상세 정보를 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = CodeResponse.class))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "코드를 찾을 수 없음")
    })
    public ApiResponse<CodeResponse> select(
            @Parameter(description = "상위 코드", example = "0")
            @PathVariable String upCd,
            @Parameter(description = "코드", example = "STATUS")
            @PathVariable String cd) {
        return ApiResponse.ok(cmsCodeService.select(cd, upCd));
    }

    @AuditLog(action = "하위 코드 등록")
    @PostMapping("/{upCd}")
    @Operation(summary = "하위 코드 생성", description = "특정 코드의 하위 코드를 생성합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "상위 코드를 찾을 수 없음")
    })
    public ApiResponse<Void> insertSub(
            @Parameter(description = "상위 코드", example = "STATUS")
            @PathVariable String upCd,
            @Valid @RequestBody CodeRequest request) {
        cmsCodeService.insertSub(upCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "코드 수정")
    @PutMapping("/{upCd}/{cd}")
    @Operation(summary = "코드 수정", description = "코드 정보를 수정합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "코드를 찾을 수 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "상위 코드", example = "0")
            @PathVariable String upCd,
            @Parameter(description = "코드", example = "STATUS")
            @PathVariable String cd,
            @Valid @RequestBody CodeRequest request) {
        cmsCodeService.update(cd, upCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "코드 삭제")
    @DeleteMapping("/{upCd}/{cd}")
    @Operation(summary = "코드 삭제", description = "코드와 해당 코드의 모든 하위 코드를 삭제합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "코드를 찾을 수 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "상위 코드", example = "0")
            @PathVariable String upCd,
            @Parameter(description = "코드", example = "STATUS")
            @PathVariable String cd) {
        cmsCodeService.delete(cd, upCd);
        return ApiResponse.ok();
    }
}
