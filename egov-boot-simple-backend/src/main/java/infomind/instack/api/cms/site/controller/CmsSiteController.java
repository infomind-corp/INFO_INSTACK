package infomind.instack.api.cms.site.controller;

import infomind.instack.api.cms.site.model.*;
import infomind.instack.api.cms.site.service.CmsSiteService;
import infomind.instack.api.common.model.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cms/site")
@RequiredArgsConstructor
public class CmsSiteController {

    private final CmsSiteService cmsSiteService;

    @GetMapping
    public ApiResponse<List<SiteListResponse>> list() {
        return ApiResponse.ok(cmsSiteService.list());
    }

    @GetMapping("/{siteCd}")
    public ApiResponse<SiteDetailResponse> detail(@PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.detail(siteCd));
    }

    @GetMapping("/{siteCd}/ip")
    public ApiResponse<List<SiteIpListResponse>> ipList(@PathVariable String siteCd) {
        return ApiResponse.ok(cmsSiteService.ipList(siteCd));
    }

    @GetMapping("/{siteCd}/ip/{sn}")
    public ApiResponse<SiteIpDetailResponse> ipDetail(@PathVariable String siteCd, @PathVariable String sn) {
        return ApiResponse.ok(cmsSiteService.ipDetail(siteCd, sn));
    }

    @PostMapping
    public ApiResponse<Void> create(@RequestBody CreateSiteRequest request) {
        cmsSiteService.create(request);
        return ApiResponse.ok();
    }

    @PutMapping("/{siteCd}")
    public ApiResponse<Void> update(@PathVariable String siteCd, @RequestBody UpdateSiteRequest request) {
        cmsSiteService.update(siteCd, request);
        return ApiResponse.ok();
    }

    @PutMapping("/{siteCd}/ip/{sn}")
    public ApiResponse<Void> updateIp(@PathVariable String siteCd, @PathVariable String sn, @RequestBody UpdateSiteIpRequest request) {
        cmsSiteService.updateIp(siteCd, sn, request);
        return ApiResponse.ok();
    }

    @DeleteMapping("/{siteCd}")
    public ApiResponse<Void> delete(@PathVariable String siteCd) {
        cmsSiteService.delete(siteCd);
        return ApiResponse.ok();
    }
}
