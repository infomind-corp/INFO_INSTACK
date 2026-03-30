package infomind.instack.api.cms.banner.service.impl;

import infomind.instack.api.cms.banner.dao.CmsBannerDao;
import infomind.instack.api.cms.banner.entity.CmsBannerGrpVO;
import infomind.instack.api.cms.banner.entity.CmsBannerVO;
import infomind.instack.api.cms.banner.model.BannerGrpRequest;
import infomind.instack.api.cms.banner.model.BannerGrpResponse;
import infomind.instack.api.cms.banner.model.BannerRequest;
import infomind.instack.api.cms.banner.model.BannerResponse;
import infomind.instack.api.cms.banner.service.CmsBannerService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 배너 서비스 구현.
 * <p>배너 그룹(CMS_BNR_GRP)과 배너(CMS_BNR)를 관리한다.</p>
 */
@Service
@RequiredArgsConstructor
public class CmsBannerServiceImpl extends EgovAbstractServiceImpl implements CmsBannerService {

    private final CmsBannerDao cmsBannerDao;

    // ----- 배너 그룹 -----

    /**
     * 배너 그룹 목록을 조회한다.
     *
     * @param request 조회 조건 (siteCd, langSe, useYn)
     * @return 배너 그룹 응답 목록
     */
    @Override
    public List<BannerGrpResponse> listBannerGrp(BannerGrpRequest request) {
        return cmsBannerDao.selectBannerGrpList(request);
    }

    /**
     * 배너 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @return 배너 그룹 응답 정보
     * @throws BizException 배너 그룹을 찾을 수 없는 경우
     */
    @Override
    public BannerGrpResponse detailBannerGrp(String siteCd, String bnrGrpId, String langSe) {
        return cmsBannerDao.selectBannerGrpById(siteCd, bnrGrpId, langSe)
                .orElseThrow(() -> new BizException("배너 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 배너 그룹을 등록한다.
     *
     * @param siteCd  사이트 코드
     * @param request 배너 그룹 등록 요청
     */
    @Override
    @Transactional
    public void createBannerGrp(String siteCd, BannerGrpRequest request) {
        CmsBannerGrpVO vo = new CmsBannerGrpVO();
        BeanUtils.copyProperties(request, vo);
        vo.setSiteCd(siteCd);
        cmsBannerDao.insertBannerGrp(vo);
    }

    /**
     * 배너 그룹 정보를 수정한다.
     * 수정 전 배너 그룹 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @param request  배너 그룹 수정 요청
     * @throws BizException 배너 그룹을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void updateBannerGrp(String siteCd, String bnrGrpId, String langSe, BannerGrpRequest request) {
        cmsBannerDao.selectBannerGrpById(siteCd, bnrGrpId, langSe)
                .orElseThrow(() -> new BizException("배너 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsBannerGrpVO vo = new CmsBannerGrpVO();
        BeanUtils.copyProperties(request, vo);
        cmsBannerDao.updateBannerGrp(siteCd, bnrGrpId, langSe, vo);
    }

    /**
     * 배너 그룹을 삭제한다.
     * 그룹에 속한 배너(CMS_BNR)를 먼저 삭제한 후 그룹(CMS_BNR_GRP)을 삭제한다.
     * 삭제 전 배너 그룹 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @throws BizException 배너 그룹을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void deleteBannerGrp(String siteCd, String bnrGrpId, String langSe) {
        cmsBannerDao.selectBannerGrpById(siteCd, bnrGrpId, langSe)
                .orElseThrow(() -> new BizException("배너 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsBannerDao.deleteBannerByGrp(siteCd, bnrGrpId, langSe);
        cmsBannerDao.deleteBannerGrp(siteCd, bnrGrpId, langSe);
    }

    // ----- 배너 -----

    /**
     * 배너 목록을 조회한다.
     *
     * @param request 조회 조건 (siteCd, bnrGrpId, langSe, useYn)
     * @return 배너 응답 목록
     */
    @Override
    public List<BannerResponse> listBanner(BannerRequest request) {
        return cmsBannerDao.selectBannerList(request);
    }

    /**
     * 배너를 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @return 배너 응답 정보
     * @throws BizException 배너를 찾을 수 없는 경우
     */
    @Override
    public BannerResponse detailBanner(String siteCd, String bnrGrpId, String bnrId, String langSe) {
        return cmsBannerDao.selectBannerById(siteCd, bnrGrpId, bnrId, langSe)
                .orElseThrow(() -> new BizException("배너를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 배너를 등록한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param request  배너 등록 요청
     */
    @Override
    @Transactional
    public void createBanner(String siteCd, String bnrGrpId, BannerRequest request) {
        CmsBannerVO vo = new CmsBannerVO();
        BeanUtils.copyProperties(request, vo);
        vo.setSiteCd(siteCd);
        vo.setBnrGrpId(bnrGrpId);
        cmsBannerDao.insertBanner(vo);
    }

    /**
     * 배너 정보를 수정한다.
     * 수정 전 배너 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @param request  배너 수정 요청
     * @throws BizException 배너를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void updateBanner(String siteCd, String bnrGrpId, String bnrId, String langSe, BannerRequest request) {
        cmsBannerDao.selectBannerById(siteCd, bnrGrpId, bnrId, langSe)
                .orElseThrow(() -> new BizException("배너를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsBannerVO vo = new CmsBannerVO();
        BeanUtils.copyProperties(request, vo);
        cmsBannerDao.updateBanner(siteCd, bnrGrpId, bnrId, langSe, vo);
    }

    /**
     * 배너를 삭제한다.
     * 삭제 전 배너 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @throws BizException 배너를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void deleteBanner(String siteCd, String bnrGrpId, String bnrId, String langSe) {
        cmsBannerDao.selectBannerById(siteCd, bnrGrpId, bnrId, langSe)
                .orElseThrow(() -> new BizException("배너를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsBannerDao.deleteBanner(siteCd, bnrGrpId, bnrId, langSe);
    }
}
