package infomind.instack.api.cms.site.service;

import infomind.instack.api.cms.site.model.*;

import java.util.List;

public interface CmsSiteService {

    List<SiteResponse> list();

    SiteResponse detail(String siteCd);

    void create(SiteRequest request);

    void update(String siteCd, SiteUpdateRequest request);

    void delete(String siteCd);

    List<SitePermitResponse> permitList(String siteCd);

    SitePermitResponse permitDetail(String siteCd, Long sn);

    void createPermit(String siteCd, SitePermitRequest request);

    void updatePermit(String siteCd, Long sn, SitePermitRequest request);
}
