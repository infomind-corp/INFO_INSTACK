package infomind.instack.api.cms.menu.controller;

import infomind.instack.api.cms.menu.model.MenuRequest;
import infomind.instack.api.cms.menu.model.MenuResponse;
import infomind.instack.api.cms.menu.service.CmsMenuService;
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
 * CMS 메뉴 컨트롤러.
 */
@RestController
@RequestMapping("/api/cms/menu")
@RequiredArgsConstructor
@Tag(name = "CMS 메뉴 관리", description = "CMS 공통 메뉴 조회/등록/수정/삭제 API")
public class CmsMenuController {

    private final CmsMenuService cmsMenuService;

    @AuditLog(action = "최상위 메뉴 조회")
    @GetMapping("/top")
    @Operation(summary = "최상위 메뉴 목록 조회", description = "최상위 메뉴(UP_MENU_CD IS NULL)의 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = MenuResponse.class))))
    })
    public ApiResponse<List<MenuResponse>> listTop() {
        return ApiResponse.ok(cmsMenuService.listTop());
    }

    @AuditLog(action = "하위 메뉴 목록 조회")
    @GetMapping("/top/{upMenuCd}")
    @Operation(summary = "하위 메뉴 목록 조회", description = "특정 메뉴의 하위 메뉴(UP_MENU_CD = {upMenuCd}) 목록을 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = MenuResponse.class)))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "상위 메뉴를 찾을 수 없음")
    })
    public ApiResponse<List<MenuResponse>> listByUpMenuCd(
            @Parameter(description = "상위 메뉴 코드", example = "MENU001")
            @PathVariable String upMenuCd) {
        return ApiResponse.ok(cmsMenuService.listByUpMenuCd(upMenuCd));
    }

    @AuditLog(action = "메뉴 단건 조회")
    @GetMapping("/{upMenuCd}/{menuCd}")
    @Operation(summary = "메뉴 단건 조회", description = "특정 메뉴의 상세 정보를 조회합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = MenuResponse.class))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "메뉴를 찾을 수 없음")
    })
    public ApiResponse<MenuResponse> select(
            @Parameter(description = "상위 메뉴 코드", example = "MENU001")
            @PathVariable String upMenuCd,
            @Parameter(description = "메뉴 코드", example = "MENU001_001")
            @PathVariable String menuCd) {
        return ApiResponse.ok(cmsMenuService.select(menuCd));
    }

    @AuditLog(action = "최상위 메뉴 등록")
    @PostMapping("/top")
    @Operation(summary = "최상위 메뉴 생성", description = "최상위 메뉴(UP_MENU_CD=NULL)를 생성합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공")
    })
    public ApiResponse<Void> insertTop(
            @Valid @RequestBody MenuRequest request) {
        cmsMenuService.insertTop(request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "하위 메뉴 등록")
    @PostMapping("/{upMenuCd}")
    @Operation(summary = "하위 메뉴 생성", description = "특정 메뉴의 하위 메뉴를 생성합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "상위 메뉴를 찾을 수 없음")
    })
    public ApiResponse<Void> insertSub(
            @Parameter(description = "상위 메뉴 코드", example = "MENU001")
            @PathVariable String upMenuCd,
            @Valid @RequestBody MenuRequest request) {
        cmsMenuService.insertSub(upMenuCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "메뉴 수정")
    @PutMapping("/{upMenuCd}/{menuCd}")
    @Operation(summary = "메뉴 수정", description = "메뉴의 정보를 수정합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "메뉴를 찾을 수 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "상위 메뉴 코드", example = "MENU001")
            @PathVariable String upMenuCd,
            @Parameter(description = "메뉴 코드", example = "MENU001_001")
            @PathVariable String menuCd,
            @Valid @RequestBody MenuRequest request) {
        cmsMenuService.update(menuCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "메뉴 삭제")
    @DeleteMapping("/{upMenuCd}/{menuCd}")
    @Operation(summary = "메뉴 삭제", description = "메뉴와 해당 메뉴의 모든 하위 메뉴를 삭제합니다")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "메뉴를 찾을 수 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "상위 메뉴 코드", example = "MENU001")
            @PathVariable String upMenuCd,
            @Parameter(description = "메뉴 코드", example = "MENU001_001")
            @PathVariable String menuCd) {
        cmsMenuService.delete(menuCd);
        return ApiResponse.ok();
    }
}
