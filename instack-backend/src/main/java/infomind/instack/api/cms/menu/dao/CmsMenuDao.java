package infomind.instack.api.cms.menu.dao;

import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;
import infomind.instack.api.cms.menu.entity.CmsMenuVO;
import infomind.instack.api.cms.menu.model.MenuResponse;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

/**
 * CMS 메뉴 DAO.
 */
@EgovMapper("CmsMenuDao")
public interface CmsMenuDao {
    List<MenuResponse> selectMenuListByUpMenuCd(String upMenuCd);

    Optional<MenuResponse> selectMenuById(String menuCd);

    void insertMenu(CmsMenuVO vo);

    void updateMenu(@Param("menuCd") String menuCd, @Param("vo") CmsMenuVO vo);

    void deleteMenu(String menuCd);

    void deleteMenuByUpMenuCd(String upMenuCd);
}
