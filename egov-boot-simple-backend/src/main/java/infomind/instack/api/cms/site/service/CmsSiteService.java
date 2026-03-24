package infomind.instack.api.cms.site.service;

import infomind.instack.api.cms.site.model.*;

import java.util.List;

public interface CmsSiteService {

    List<SiteListResponse> list();

    SiteDetailResponse detail(String siteCd);

    List<SiteIpListResponse> ipList(String siteCd);

    SiteIpDetailResponse ipDetail(String siteCd, String sn);

    void create(CreateSiteRequest request);

    void update(String siteCd, UpdateSiteRequest request);

    void updateIp(String siteCd, String sn, UpdateSiteIpRequest request);

    void delete(String siteCd);
}
