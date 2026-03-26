package infomind.instack.api.cms.site.dao;

import infomind.instack.api.cms.site.entity.CmsSitePermVO;
import infomind.instack.api.cms.site.entity.CmsSiteVO;
import infomind.instack.api.cms.site.model.SitePermitResponse;
import infomind.instack.api.cms.site.model.SiteResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

@EgovMapper("CmsSiteDao")
public interface CmsSiteDao {

    // ----- CMS_SITE -----

    List<SiteResponse> selectSiteList();

    Optional<SiteResponse> selectSiteBySiteCd(String siteCd);

    void insertSite(CmsSiteVO vo);

    void updateSite(@Param("siteCd") String siteCd, @Param("vo") CmsSiteVO vo);

    void deleteSite(String siteCd);

    // ----- CMS_SITE_ACC_PERM -----

    List<SitePermitResponse> selectSitePermListBySiteCd(String siteCd);

    Optional<SitePermitResponse> selectSitePermBySiteCdAndSn(@Param("siteCd") String siteCd, @Param("sn") Long sn);

    void insertSitePerm(CmsSitePermVO vo);

    void updateSitePerm(@Param("siteCd") String siteCd, @Param("sn") Long sn, @Param("vo") CmsSitePermVO vo);

    void deleteSitePermBySiteCd(String siteCd);
}
