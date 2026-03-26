package infomind.instack.api.cms.content.controller;

import infomind.instack.api.cms.content.model.ContentRequest;
import infomind.instack.api.cms.content.model.ContentResponse;
import infomind.instack.api.cms.content.service.CmsContentService;
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
 * CMS 컨텐츠 컨트롤러.
 */
@RestController
@RequestMapping("/api/cms/site/{siteCd}/content")
@RequiredArgsConstructor
@Tag(name = "CMS 컨텐츠 관리", description = "CMS 컨텐츠 조회/등록/수정/삭제 API")
public class CmsContentController {

    private final CmsContentService cmsContentService;

    @AuditLog(action = "컨텐츠 목록 조회")
    @GetMapping
    @Operation(summary = "컨텐츠 목록 조회", description = "사이트의 컨텐츠 목록을 조회합니다. langSe/useYn/pubYn/keyword로 필터링 가능합니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(array = @ArraySchema(schema = @Schema(implementation = ContentResponse.class))))
    })
    public ApiResponse<List<ContentResponse>> list(
            @Parameter(description = "사이트 코드", example = "SITE001") @PathVariable String siteCd,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam(required = false) String langSe,
            @Parameter(description = "사용 여부 (Y/N)", example = "Y") @RequestParam(required = false) String useYn,
            @Parameter(description = "게시 여부 (Y/N)", example = "Y") @RequestParam(required = false) String pubYn,
            @Parameter(description = "컨텐츠 명 키워드 검색") @RequestParam(required = false) String keyword) {
        ContentRequest request = new ContentRequest();
        request.setSiteCd(siteCd);
        request.setLangSe(langSe);
        request.setUseYn(useYn);
        request.setPubYn(pubYn);
        request.setKeyword(keyword);
        return ApiResponse.ok(cmsContentService.list(request));
    }

    @AuditLog(action = "컨텐츠 상세 조회")
    @GetMapping("/{cttId}")
    @Operation(summary = "컨텐츠 상세 조회", description = "컨텐츠 상세 정보를 조회합니다. SEO 정보를 포함합니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "조회 성공",
                    content = @Content(schema = @Schema(implementation = ContentResponse.class))),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "컨텐츠를 찾을 수 없음")
    })
    public ApiResponse<ContentResponse> select(
            @Parameter(description = "사이트 코드", example = "SITE001") @PathVariable String siteCd,
            @Parameter(description = "컨텐츠 아이디", example = "CTT_MAIN_BANNER") @PathVariable String cttId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam(required = false) String langSe) {
        return ApiResponse.ok(cmsContentService.select(siteCd, cttId, langSe));
    }

    @AuditLog(action = "컨텐츠 등록")
    @PostMapping
    @Operation(summary = "컨텐츠 등록", description = "컨텐츠를 등록합니다. SEO 필드(metaTtl/metaDesc) 입력 시 SEO 정보도 함께 등록됩니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "등록 성공")
    })
    public ApiResponse<Void> insert(
            @Parameter(description = "사이트 코드", example = "SITE001") @PathVariable String siteCd,
            @Valid @RequestBody ContentRequest request) {
        request.setSiteCd(siteCd);
        cmsContentService.insert(request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "컨텐츠 수정")
    @PutMapping("/{cttId}")
    @Operation(summary = "컨텐츠 수정", description = "컨텐츠를 수정합니다. SEO 필드 입력 시 SEO 정보가 upsert됩니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "수정 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "컨텐츠를 찾을 수 없음")
    })
    public ApiResponse<Void> update(
            @Parameter(description = "사이트 코드", example = "SITE001") @PathVariable String siteCd,
            @Parameter(description = "컨텐츠 아이디", example = "CTT_MAIN_BANNER") @PathVariable String cttId,
            @RequestBody ContentRequest request) {
        request.setSiteCd(siteCd);
        cmsContentService.update(siteCd, cttId, request);
        return ApiResponse.ok();
    }

    @AuditLog(action = "컨텐츠 삭제")
    @DeleteMapping("/{cttId}")
    @Operation(summary = "컨텐츠 삭제", description = "컨텐츠 및 연관된 SEO 정보를 함께 삭제합니다.")
    @ApiResponses(value = {
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "삭제 성공"),
            @io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "404", description = "컨텐츠를 찾을 수 없음")
    })
    public ApiResponse<Void> delete(
            @Parameter(description = "사이트 코드", example = "SITE001") @PathVariable String siteCd,
            @Parameter(description = "컨텐츠 아이디", example = "CTT_MAIN_BANNER") @PathVariable String cttId,
            @Parameter(description = "언어 구분", example = "ko") @RequestParam(required = false) String langSe) {
        cmsContentService.delete(siteCd, cttId, langSe);
        return ApiResponse.ok();
    }
}
