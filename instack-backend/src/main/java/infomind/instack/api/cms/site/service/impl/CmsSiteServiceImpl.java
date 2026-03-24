package infomind.instack.api.cms.site.service.impl;

import infomind.instack.api.cms.site.dao.CmsSiteDao;
import infomind.instack.api.cms.site.entity.CmsSiteIpVO;
import infomind.instack.api.cms.site.entity.CmsSiteVO;
import infomind.instack.api.cms.site.model.*;
import infomind.instack.api.cms.site.service.CmsSiteService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.UuidUtil;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CmsSiteServiceImpl extends EgovAbstractServiceImpl implements CmsSiteService {

    private final CmsSiteDao cmsSiteDao;

    @Override
    public List<SiteListResponse> list() {
        return cmsSiteDao.selectSiteList();
    }

    @Override
    public SiteDetailResponse detail(String siteCd) {
        return cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    @Override
    public List<SiteIpListResponse> ipList(String siteCd) {
        return cmsSiteDao.selectSiteIpListBySiteCd(siteCd);
    }

    @Override
    public SiteIpDetailResponse ipDetail(String siteCd, String sn) {
        return cmsSiteDao.selectSiteIpBySiteCdAndSn(siteCd, sn)
                .orElseThrow(() -> new BizException("사이트 IP를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    @Override
    @Transactional
    public void create(CreateSiteRequest request) {
        CmsSiteVO siteVO = new CmsSiteVO();
        BeanUtils.copyProperties(request, siteVO);
        cmsSiteDao.insertSite(siteVO);

        if (request.getPermIp() != null && !request.getPermIp().isBlank()) {
            CmsSiteIpVO ipVO = new CmsSiteIpVO();
            ipVO.setSiteCd(request.getSiteCd());
            ipVO.setSn(UuidUtil.generateCompact());
            ipVO.setPermIp(request.getPermIp());
            ipVO.setUseYn("Y");
            cmsSiteDao.insertSiteIp(ipVO);
        }
    }

    @Override
    public void update(String siteCd, UpdateSiteRequest request) {
        CmsSiteVO vo = new CmsSiteVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.updateSite(siteCd, vo);
    }

    @Override
    public void updateIp(String siteCd, String sn, UpdateSiteIpRequest request) {
        CmsSiteIpVO vo = new CmsSiteIpVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.updateSiteIp(siteCd, sn, vo);
    }

    @Override
    @Transactional
    public void delete(String siteCd) {
        cmsSiteDao.deleteSiteIpBySiteCd(siteCd);
        cmsSiteDao.deleteSite(siteCd);
    }
}
