package infomind.instack.api.cms.menu.service.impl;

import infomind.instack.api.cms.menu.dao.CmsMenuDao;
import infomind.instack.api.cms.menu.entity.CmsMenuVO;
import infomind.instack.api.cms.menu.model.MenuRequest;
import infomind.instack.api.cms.menu.model.MenuResponse;
import infomind.instack.api.cms.menu.service.CmsMenuService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 메뉴 서비스 구현.
 */
@Service
@RequiredArgsConstructor
public class CmsMenuServiceImpl extends EgovAbstractServiceImpl implements CmsMenuService {

    private final CmsMenuDao cmsMenuDao;

    /**
     * 상위 메뉴로 하위 메뉴 목록을 조회한다.
     *
     * @param upMenuCd 상위 메뉴 코드
     * @return 메뉴 응답 목록
     */
    @Override
    public List<MenuResponse> listByUpMenuCd(String upMenuCd) {
        return cmsMenuDao.selectMenuListByUpMenuCd(upMenuCd);
    }

    /**
     * 메뉴를 단건 조회한다.
     *
     * @param menuCd 조회할 메뉴 코드
     * @return 메뉴 응답 정보
     * @throws BizException 메뉴를 찾을 수 없는 경우
     */
    @Override
    public MenuResponse select(String menuCd) {
        return cmsMenuDao.selectMenuById(menuCd)
                .orElseThrow(() -> new BizException("메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    /**
     * 메뉴를 등록한다.
     * 상위 메뉴가 있으면 존재 여부를 확인한다.
     *
     * @param request 메뉴 등록 요청
     * @throws BizException 상위 메뉴를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void insert(MenuRequest request) {
        // 상위 메뉴가 있으면 존재 여부 확인
        if (request.getUpMenuCd() != null && !request.getUpMenuCd().isBlank()) {
            cmsMenuDao.selectMenuById(request.getUpMenuCd())
                    .orElseThrow(() -> new BizException("상위 메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        }

        CmsMenuVO vo = new CmsMenuVO();
        BeanUtils.copyProperties(request, vo);
        cmsMenuDao.insertMenu(vo);
    }

    /**
     * 메뉴 정보를 수정한다.
     * 수정 전 메뉴 존재 여부를 확인한다.
     *
     * @param menuCd  수정할 메뉴 코드
     * @param request 메뉴 수정 요청
     * @throws BizException 메뉴를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String menuCd, MenuRequest request) {
        // 메뉴 존재 여부 확인
        cmsMenuDao.selectMenuById(menuCd)
                .orElseThrow(() -> new BizException("메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        CmsMenuVO vo = new CmsMenuVO();
        BeanUtils.copyProperties(request, vo);
        cmsMenuDao.updateMenu(menuCd, vo);
    }

    /**
     * 메뉴를 삭제한다.
     * 해당 메뉴의 모든 하위 메뉴도 함께 삭제된다(Cascade).
     * 삭제 전 메뉴 존재 여부를 확인한다.
     *
     * @param menuCd 삭제할 메뉴 코드
     * @throws BizException 메뉴를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String menuCd) {
        // 메뉴 존재 여부 확인
        cmsMenuDao.selectMenuById(menuCd)
                .orElseThrow(() -> new BizException("메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        // 하위 메뉴 삭제
        cmsMenuDao.deleteMenuByUpMenuCd(menuCd);
        // 메뉴 삭제
        cmsMenuDao.deleteMenu(menuCd);
    }
}
