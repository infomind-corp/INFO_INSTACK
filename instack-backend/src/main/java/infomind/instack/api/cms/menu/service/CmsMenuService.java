package infomind.instack.api.cms.menu.service;

import infomind.instack.api.cms.menu.model.MenuRequest;
import infomind.instack.api.cms.menu.model.MenuResponse;

import java.util.List;

/**
 * CMS 메뉴 서비스 인터페이스.
 */
public interface CmsMenuService {
    List<MenuResponse> listByUpMenuCd(String upMenuCd);

    MenuResponse select(String menuCd);

    void insert(MenuRequest request);

    void update(String menuCd, MenuRequest request);

    void delete(String menuCd);
}
