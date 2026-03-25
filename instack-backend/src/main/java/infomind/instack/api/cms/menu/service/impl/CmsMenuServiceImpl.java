package infomind.instack.api.cms.menu.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import infomind.instack.api.cms.menu.dao.CmsMenuDao;
import infomind.instack.api.cms.menu.entity.CmsMenuVO;
import infomind.instack.api.cms.menu.model.MenuRequest;
import infomind.instack.api.cms.menu.model.MenuResponse;
import infomind.instack.api.cms.menu.service.CmsMenuService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
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

    @Override
    public List<MenuResponse> listTop() {
        return cmsMenuDao.selectMenuListByUpMenuCd(null);
    }

    @Override
    public List<MenuResponse> listByUpMenuCd(String upMenuCd) {
        return cmsMenuDao.selectMenuListByUpMenuCd(upMenuCd);
    }

    @Override
    public MenuResponse select(String menuCd) {
        return cmsMenuDao.selectMenuById(menuCd)
                .orElseThrow(() -> new BizException("메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    @Override
    @Transactional
    public void insertTop(MenuRequest request) {
        CmsMenuVO vo = new CmsMenuVO();
        BeanUtils.copyProperties(request, vo);
        vo.setMenuLvl(1);
        vo.setUpMenuCd(null);
        cmsMenuDao.insertMenu(vo);
    }

    @Override
    @Transactional
    public void insertSub(String upMenuCd, MenuRequest request) {
        // 상위 메뉴 존재 여부 확인
        cmsMenuDao.selectMenuById(upMenuCd)
                .orElseThrow(() -> new BizException("상위 메뉴를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        CmsMenuVO vo = new CmsMenuVO();
        BeanUtils.copyProperties(request, vo);
        vo.setMenuLvl(2);
        vo.setUpMenuCd(upMenuCd);
        cmsMenuDao.insertMenu(vo);
    }

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
