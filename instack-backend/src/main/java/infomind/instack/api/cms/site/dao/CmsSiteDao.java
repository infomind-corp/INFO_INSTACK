package infomind.instack.api.cms.site.dao;

import infomind.instack.api.cms.site.entity.CmsSiteIpVO;
import infomind.instack.api.cms.site.entity.CmsSiteVO;
import infomind.instack.api.cms.site.model.SiteDetailResponse;
import infomind.instack.api.cms.site.model.SiteIpDetailResponse;
import infomind.instack.api.cms.site.model.SiteIpListResponse;
import infomind.instack.api.cms.site.model.SiteListResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

@EgovMapper("CmsSiteDao")
public interface CmsSiteDao {

    List<SiteListResponse> selectSiteList();

    Optional<SiteDetailResponse> selectSiteBySiteCd(String siteCd);

    List<SiteIpListResponse> selectSiteIpListBySiteCd(String siteCd);

    Optional<SiteIpDetailResponse> selectSiteIpBySiteCdAndSn(@Param("siteCd") String siteCd, @Param("sn") String sn);

    void insertSite(CmsSiteVO vo);

    void insertSiteIp(CmsSiteIpVO vo);

    void updateSite(@Param("siteCd") String siteCd, @Param("vo") CmsSiteVO vo);

    void updateSiteIp(@Param("siteCd") String siteCd, @Param("sn") String sn, @Param("vo") CmsSiteIpVO vo);

    void deleteSite(String siteCd);

    void deleteSiteIpBySiteCd(String siteCd);
}
