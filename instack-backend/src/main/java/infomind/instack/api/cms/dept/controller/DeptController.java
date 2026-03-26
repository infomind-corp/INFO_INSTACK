package infomind.instack.api.cms.dept.controller;

import infomind.instack.api.cms.dept.model.DeptRequest;
import infomind.instack.api.cms.dept.model.DeptResponse;
import infomind.instack.api.cms.dept.model.OrgRequest;
import infomind.instack.api.cms.dept.model.OrgResponse;
import infomind.instack.api.cms.dept.service.DeptService;
import infomind.instack.api.cms.dept.service.OrgService;
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
 * CMS 공통 조직/부서 컨트롤러.
 */
@RestController
@RequestMapping("/api/cms/dept")
@RequiredArgsConstructor
@Tag(name = "CMS 공통 조직/부서 관리", description = "CMS 공통 조직/부서 조회/등록/수정/삭제 API")
public class DeptController {

    private final OrgService orgService;
    private final DeptService deptService;

    // ========================
    // 조직(Org) API
    // ========================

    @AuditLog(action = "조직 목록 조회")
    @GetMapping("/org")
    @Operation(summary = "조직 목록 조회", description = "조직 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = OrgResponse.class))))
    })
    public ApiResponse<List<OrgResponse>> listOrg(OrgRequest request) {
        return ApiResponse.ok(orgService.list(request));
    }

    @AuditLog(action = "조직 단건 조회")
    @GetMapping("/org/{orgCd}")
    @Operation(summary = "조직 단건 조회", description = "특정 조직의 상세 정보를 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = OrgResponse.class))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "조직을 찾을 수 없음")
    })
    public ApiResponse<OrgResponse> selectOrg(
            @Parameter(description = "조직 코드", example = "ORG001")
            @PathVariable String orgCd) {
        return ApiResponse.ok(orgService.select(orgCd));
    }

    @AuditLog(action = "조직 등록")
    @PostMapping("/org")
    @Operation(summary = "조직 등록", description = "새로운 조직을 등록합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공")
    })
    public ApiResponse<Void> insertOrg(@Valid @RequestBody OrgRequest request) {
        orgService.insert(request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "조직 수정")
    @PutMapping("/org/{orgCd}")
    @Operation(summary = "조직 수정", description = "조직 정보를 수정합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "조직을 찾을 수 없음")
    })
    public ApiResponse<Void> updateOrg(
            @Parameter(description = "조직 코드", example = "ORG001")
            @PathVariable String orgCd,
            @Valid @RequestBody OrgRequest request) {
        orgService.update(orgCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "조직 삭제")
    @DeleteMapping("/org/{orgCd}")
    @Operation(summary = "조직 삭제", description = "조직과 해당 조직의 모든 부서를 삭제합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "조직을 찾을 수 없음")
    })
    public ApiResponse<Void> deleteOrg(
            @Parameter(description = "조직 코드", example = "ORG001")
            @PathVariable String orgCd) {
        orgService.delete(orgCd);
        return ApiResponse.ok();
    }

    // ========================
    // 부서(Dept) API
    // ========================

    @AuditLog(action = "부서 목록 조회")
    @GetMapping
    @Operation(summary = "부서 목록 조회", description = "부서 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = DeptResponse.class))))
    })
    public ApiResponse<List<DeptResponse>> listDept(DeptRequest request) {
        return ApiResponse.ok(deptService.list(request));
    }

    @AuditLog(action = "부서 단건 조회")
    @GetMapping("/{deptCd}")
    @Operation(summary = "부서 단건 조회", description = "특정 부서의 상세 정보를 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = DeptResponse.class))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "부서를 찾을 수 없음")
    })
    public ApiResponse<DeptResponse> selectDept(
            @Parameter(description = "부서 코드", example = "DEPT001")
            @PathVariable String deptCd) {
        return ApiResponse.ok(deptService.select(deptCd));
    }

    @AuditLog(action = "부서 목록 조회 (조직별)")
    @GetMapping("/org/{orgCd}")
    @Operation(summary = "부서 목록 조회 (조직별)", description = "특정 조직의 부서 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = DeptResponse.class)))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "조직을 찾을 수 없음")
    })
    public ApiResponse<List<DeptResponse>> listDeptByOrgCd(
            @Parameter(description = "조직 코드", example = "ORG001")
            @PathVariable String orgCd) {
        return ApiResponse.ok(deptService.listByOrgCd(orgCd));
    }

    @AuditLog(action = "부서 등록")
    @PostMapping
    @Operation(summary = "부서 등록", description = "새로운 부서를 등록합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "조직을 찾을 수 없음")
    })
    public ApiResponse<Void> insertDept(@Valid @RequestBody DeptRequest request) {
        deptService.insert(request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "부서 수정")
    @PutMapping("/{deptCd}")
    @Operation(summary = "부서 수정", description = "부서 정보를 수정합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "부서를 찾을 수 없음")
    })
    public ApiResponse<Void> updateDept(
            @Parameter(description = "부서 코드", example = "DEPT001")
            @PathVariable String deptCd,
            @Valid @RequestBody DeptRequest request) {
        deptService.update(deptCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "부서 삭제")
    @DeleteMapping("/{deptCd}")
    @Operation(summary = "부서 삭제", description = "부서를 삭제합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "부서를 찾을 수 없음")
    })
    public ApiResponse<Void> deleteDept(
            @Parameter(description = "부서 코드", example = "DEPT001")
            @PathVariable String deptCd) {
        deptService.delete(deptCd);
        return ApiResponse.ok();
    }
}
