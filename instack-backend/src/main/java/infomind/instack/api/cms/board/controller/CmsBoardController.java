package infomind.instack.api.cms.board.controller;

import infomind.instack.api.cms.board.model.BoardRequest;
import infomind.instack.api.cms.board.model.BoardResponse;
import infomind.instack.api.cms.board.service.CmsBoardService;
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
 * CMS 게시판 컨트롤러.
 */
@Tag(name = "CMS 게시판 관리", description = "사이트별 게시판 관리 API")
@RestController
@RequestMapping("/api/cms/site/{siteCd}/board")
@RequiredArgsConstructor
public class CmsBoardController {

    private final CmsBoardService cmsBoardService;

    @AuditLog(action = "게시판 목록 조회")
    @GetMapping
    @Operation(summary = "게시판 목록 조회", description = "사이트의 게시판 목록을 조회합니다. 게시판 구분 코드로 필터링할 수 있습니다.")
    public ApiResponse<List<BoardResponse>> list(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "게시판 구분 코드 (선택사항)", example = "BBS") @RequestParam(required = false) String brdSe) {
        return ApiResponse.ok(cmsBoardService.list(siteCd, brdSe));
    }

    @AuditLog(action = "게시판 단건 조회")
    @GetMapping("/{brdId}")
    @Operation(summary = "게시판 단건 조회", description = "게시판 ID로 게시판 상세 정보를 조회합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "게시판 없음")
    })
    public ApiResponse<BoardResponse> detail(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "게시판 ID", example = "NOTICE") @PathVariable String brdId) {
        return ApiResponse.ok(cmsBoardService.detail(siteCd, brdId));
    }

    @AuditLog(action = "게시판 등록")
    @PostMapping
    @Operation(summary = "게시판 등록", description = "새로운 게시판과 권한 정보를 등록합니다.")
    public ApiResponse<Void> create(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Valid @RequestBody BoardRequest request) {
        cmsBoardService.create(siteCd, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "게시판 수정")
    @PutMapping("/{brdId}")
    @Operation(summary = "게시판 수정", description = "게시판 정보와 권한 정보를 수정합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "게시판 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "게시판 ID", example = "NOTICE") @PathVariable String brdId,
            @Valid @RequestBody BoardRequest request) {
        cmsBoardService.update(siteCd, brdId, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "게시판 삭제")
    @DeleteMapping("/{brdId}")
    @Operation(summary = "게시판 삭제", description = "게시판과 권한 정보를 삭제합니다.")
    @ApiResponses({
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
        @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "게시판 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드") @PathVariable String siteCd,
            @Parameter(description = "게시판 ID", example = "NOTICE") @PathVariable String brdId) {
        cmsBoardService.delete(siteCd, brdId);
        return ApiResponse.ok();
    }
}
