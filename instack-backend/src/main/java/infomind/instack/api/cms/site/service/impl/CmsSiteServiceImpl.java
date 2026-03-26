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

/**
 * CMS 사이트 서비스 구현.
 * <p>사이트 정보 관리 및 사이트별 접근 권한(IP/도메인) 관리</p>
 */
@Service
@RequiredArgsConstructor
public class CmsSiteServiceImpl extends EgovAbstractServiceImpl implements CmsSiteService {

    private final CmsSiteDao cmsSiteDao;

    /**
     * 사이트 목록을 조회한다.
     *
     * @return 사이트 응답 목록
     */
    @Override
    public List<SiteResponse> list() {
        return cmsSiteDao.selectSiteList();
    }

    /**
     * 사이트를 단건 조회한다.
     *
     * @param siteCd 조회할 사이트 코드
     * @return 사이트 응답 정보
     * @throws BizException 사이트를 찾을 수 없는 경우
     */
    @Override
    public SiteResponse detail(String siteCd) {
        return cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 사이트를 생성한다.
     *
     * @param request 사이트 생성 요청
     */
    @Override
    @Transactional
    public void create(SiteRequest request) {
        CmsSiteVO vo = new CmsSiteVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.insertSite(vo);
    }

    /**
     * 사이트 정보를 수정한다.
     * 수정 전 사이트 존재 여부를 확인한다.
     *
     * @param siteCd  수정할 사이트 코드
     * @param request 사이트 수정 요청
     * @throws BizException 사이트를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String siteCd, SiteUpdateRequest request) {
        cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        CmsSiteVO vo = new CmsSiteVO();
        BeanUtils.copyProperties(request, vo);
        cmsSiteDao.updateSite(siteCd, vo);
    }

    /**
     * 사이트를 삭제한다.
     * 해당 사이트의 모든 접근 권한도 함께 삭제된다(Cascade).
     * 삭제 전 사이트 존재 여부를 확인한다.
     *
     * @param siteCd 삭제할 사이트 코드
     * @throws BizException 사이트를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String siteCd) {
        cmsSiteDao.selectSiteBySiteCd(siteCd)
                .orElseThrow(() -> new BizException("사이트를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsSiteDao.deleteSitePermBySiteCd(siteCd);
        cmsSiteDao.deleteSite(siteCd);
    }

    /**
     * 사이트 접근 권한(IP/도메인) 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @return 접근 권한 응답 목록
     */
    @Override
    public List<SitePermitResponse> permitList(String siteCd) {
        return cmsSiteDao.selectSitePermListBySiteCd(siteCd);
    }

    /**
     * 사이트 접근 권한을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param sn     권한 일련번호
     * @return 접근 권한 응답 정보
     * @throws BizException 권한을 찾을 수 없는 경우
     */
    @Override
    public SitePermitResponse permitDetail(String siteCd, Long sn) {
        return cmsSiteDao.selectSitePermBySiteCdAndSn(siteCd, sn)
                .orElseThrow(() -> new BizException("허용 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 사이트 접근 권한(IP/도메인)을 등록한다.
     * 등록 전 사이트 존재 여부를 확인한다.
     *
     * @param siteCd  사이트 코드
     * @param request 접근 권한 등록 요청
     * @throws BizException 사이트를 찾을 수 없는 경우
     */
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

    /**
     * 사이트 접근 권한을 수정한다.
     * 수정 전 권한 존재 여부를 확인한다.
     *
     * @param siteCd  사이트 코드
     * @param sn      권한 일련번호
     * @param request 접근 권한 수정 요청
     * @throws BizException 권한을 찾을 수 없는 경우
     */
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
