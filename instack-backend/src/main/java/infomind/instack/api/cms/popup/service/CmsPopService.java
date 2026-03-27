package infomind.instack.api.cms.popup.service;

import infomind.instack.api.cms.popup.model.PopRequest;
import infomind.instack.api.cms.popup.model.PopResponse;

import java.util.List;

/**
 * CMS 팝업 서비스 인터페이스.
 */
public interface CmsPopService {

    /**
     * 팝업 목록을 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 응답 목록
     */
    List<PopResponse> list(String siteCd, String popGrpId, String langSe);

    /**
     * 팝업을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param popId  팝업 아이디
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 응답 정보
     */
    PopResponse detail(String siteCd, String popId, String langSe);

    /**
     * 팝업을 등록한다.
     * request에 popGrpId가 포함되어야 한다.
     *
     * @param siteCd  사이트 코드
     * @param request 팝업 등록 요청
     */
    void create(String siteCd, PopRequest request);

    /**
     * 팝업 정보를 수정한다.
     *
     * @param siteCd  사이트 코드
     * @param popId   팝업 아이디
     * @param request 팝업 수정 요청
     */
    void update(String siteCd, String popId, PopRequest request);

    /**
     * 팝업을 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param popId    팝업 아이디
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     */
    void delete(String siteCd, String popId, String popGrpId, String langSe);
}
