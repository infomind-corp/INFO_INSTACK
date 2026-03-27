package infomind.instack.api.cms.popup.service.impl;

import infomind.instack.api.cms.popup.dao.CmsPopDao;
import infomind.instack.api.cms.popup.entity.CmsPopVO;
import infomind.instack.api.cms.popup.model.PopRequest;
import infomind.instack.api.cms.popup.model.PopResponse;
import infomind.instack.api.cms.popup.service.CmsPopService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 팝업 서비스 구현.
 * <p>팝업 개별 항목(CMS_POP)을 관리한다.</p>
 */
@Service
@RequiredArgsConstructor
public class CmsPopServiceImpl extends EgovAbstractServiceImpl implements CmsPopService {

    private final CmsPopDao cmsPopDao;

    /**
     * 팝업 목록을 조회한다.
     * popGrpId/langSe가 null인 경우 해당 조건 없이 전체 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 응답 목록
     */
    @Override
    public List<PopResponse> list(String siteCd, String popGrpId, String langSe) {
        return cmsPopDao.selectPopList(siteCd, popGrpId, langSe);
    }

    /**
     * 팝업을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param popId  팝업 아이디
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 응답 정보
     * @throws BizException 팝업을 찾을 수 없는 경우
     */
    @Override
    public PopResponse detail(String siteCd, String popId, String langSe) {
        return cmsPopDao.selectPopById(siteCd, popId, langSe)
                .orElseThrow(() -> new BizException("팝업을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 팝업을 등록한다.
     * request의 popGrpId를 사용하여 그룹에 소속시킨다.
     *
     * @param siteCd  사이트 코드
     * @param request 팝업 등록 요청
     */
    @Override
    public void create(String siteCd, PopRequest request) {
        CmsPopVO vo = new CmsPopVO();
        BeanUtils.copyProperties(request, vo);
        vo.setSiteCd(siteCd);
        cmsPopDao.insertPop(vo);
    }

    /**
     * 팝업 정보를 수정한다.
     * 수정 전 팝업 존재 여부를 확인한다.
     *
     * @param siteCd  사이트 코드
     * @param popId   팝업 아이디
     * @param request 팝업 수정 요청
     * @throws BizException 팝업을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String siteCd, String popId, PopRequest request) {
        cmsPopDao.selectPopById(siteCd, popId, request.getLangSe())
                .orElseThrow(() -> new BizException("팝업을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsPopVO vo = new CmsPopVO();
        BeanUtils.copyProperties(request, vo);
        cmsPopDao.updatePop(siteCd, popId, vo);
    }

    /**
     * 팝업을 삭제한다.
     * 삭제 전 팝업 존재 여부를 확인한다.
     *
     * @param siteCd   사이트 코드
     * @param popId    팝업 아이디
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     * @throws BizException 팝업을 찾을 수 없는 경우
     */
    @Override
    public void delete(String siteCd, String popId, String popGrpId, String langSe) {
        cmsPopDao.selectPopById(siteCd, popId, langSe)
                .orElseThrow(() -> new BizException("팝업을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsPopDao.deletePop(siteCd, popId, popGrpId, langSe);
    }
}
