package infomind.instack.api.cms.site.service.impl;

import infomind.instack.api.cms.site.dao.CmsSiteDao;
import infomind.instack.api.cms.site.entity.CmsSitePermVO;
import infomind.instack.api.cms.site.entity.CmsSiteVO;
import infomind.instack.api.cms.site.model.*;
import infomind.instack.api.cms.site.service.CmsSiteService;
import infomind.instack.api.common.exception.BizException;
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
    public List<SiteResponse> list() {
        return cmsSiteDao.selectSiteList();
    }

    @Override
    public SiteResponse detail(String siteCd) {
        return cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    @Override
    @Transactional
    public void create(SiteRequest request) {
        CmsSiteVO vo = new CmsSiteVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.insertSite(vo);
    }

    @Override
    @Transactional
    public void update(String siteCd, SiteUpdateRequest request) {
        cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        CmsSiteVO vo = new CmsSiteVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.updateSite(siteCd, vo);
    }

    @Override
    @Transactional
    public void delete(String siteCd) {
        cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsSiteDao.deleteSitePermBySiteCd(siteCd);
        cmsSiteDao.deleteSite(siteCd);
    }

    @Override
    public List<SitePermitResponse> permitList(String siteCd) {
        return cmsSiteDao.selectSitePermListBySiteCd(siteCd);
    }

    @Override
    public SitePermitResponse permitDetail(String siteCd, Long sn) {
        return cmsSiteDao.selectSitePermBySiteCdAndSn(siteCd, sn)
                .orElseThrow(() -> new BizException("허용 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    @Override
    @Transactional
    public void createPermit(String siteCd, SitePermitRequest request) {
        cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        CmsSitePermVO vo = new CmsSitePermVO();
        vo.setSiteCd(siteCd);
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.insertSitePerm(vo);
    }

    @Override
    @Transactional
    public void updatePermit(String siteCd, Long sn, SitePermitRequest request) {
        cmsSiteDao.selectSitePermBySiteCdAndSn(siteCd, sn)
                .orElseThrow(() -> new BizException("허용 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        CmsSitePermVO vo = new CmsSitePermVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.updateSitePerm(siteCd, sn, vo);
    }
}
