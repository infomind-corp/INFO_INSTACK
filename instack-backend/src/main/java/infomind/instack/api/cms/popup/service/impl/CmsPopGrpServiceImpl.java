package infomind.instack.api.cms.popup.service.impl;

import infomind.instack.api.cms.popup.dao.CmsPopDao;
import infomind.instack.api.cms.popup.dao.CmsPopGrpDao;
import infomind.instack.api.cms.popup.entity.CmsPopGrpVO;
import infomind.instack.api.cms.popup.model.PopGrpRequest;
import infomind.instack.api.cms.popup.model.PopGrpResponse;
import infomind.instack.api.cms.popup.service.CmsPopGrpService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 팝업 그룹 서비스 구현.
 * <p>팝업 그룹(CMS_POP_GRP)을 관리한다. 삭제 시 연관 팝업(CMS_POP)도 함께 삭제한다.</p>
 */
@Service
@RequiredArgsConstructor
public class CmsPopGrpServiceImpl extends EgovAbstractServiceImpl implements CmsPopGrpService {

    private final CmsPopGrpDao cmsPopGrpDao;
    private final CmsPopDao cmsPopDao;

    /**
     * 팝업 그룹 목록을 조회한다.
     * langSe가 null인 경우 전 언어 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 그룹 응답 목록
     */
    @Override
    public List<PopGrpResponse> list(String siteCd, String langSe) {
        return cmsPopGrpDao.selectPopGrpList(siteCd, langSe);
    }

    /**
     * 팝업 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 그룹 응답 정보
     * @throws BizException 팝업 그룹을 찾을 수 없는 경우
     */
    @Override
    public PopGrpResponse detail(String siteCd, String popGrpId, String langSe) {
        return cmsPopGrpDao.selectPopGrpById(siteCd, popGrpId, langSe)
                .orElseThrow(() -> new BizException("팝업 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 팝업 그룹을 등록한다.
     *
     * @param siteCd  사이트 코드
     * @param request 팝업 그룹 등록 요청
     */
    @Override
    public void create(String siteCd, PopGrpRequest request) {
        CmsPopGrpVO vo = new CmsPopGrpVO();
        BeanUtils.copyProperties(request, vo);
        vo.setSiteCd(siteCd);
        cmsPopGrpDao.insertPopGrp(vo);
    }

    /**
     * 팝업 그룹 정보를 수정한다.
     * 수정 전 팝업 그룹 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param request  팝업 그룹 수정 요청
     * @throws BizException 팝업 그룹을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String siteCd, String popGrpId, PopGrpRequest request) {
        cmsPopGrpDao.selectPopGrpById(siteCd, popGrpId, request.getLangSe())
                .orElseThrow(() -> new BizException("팝업 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsPopGrpVO vo = new CmsPopGrpVO();
        BeanUtils.copyProperties(request, vo);
        cmsPopGrpDao.updatePopGrp(siteCd, popGrpId, vo);
    }

    /**
     * 팝업 그룹을 삭제한다.
     * 연관 팝업(CMS_POP)을 먼저 삭제한 후 팝업 그룹(CMS_POP_GRP)을 삭제한다.
     * 삭제 전 팝업 그룹 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     * @throws BizException 팝업 그룹을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String siteCd, String popGrpId, String langSe) {
        cmsPopGrpDao.selectPopGrpById(siteCd, popGrpId, langSe)
                .orElseThrow(() -> new BizException("팝업 그룹을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsPopDao.deletePopByGrpId(siteCd, popGrpId, langSe);
        cmsPopGrpDao.deletePopGrp(siteCd, popGrpId, langSe);
    }
}
