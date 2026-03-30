package infomind.instack.api.cms.popup.service;

import infomind.instack.api.cms.popup.model.PopGrpRequest;
import infomind.instack.api.cms.popup.model.PopGrpResponse;

import java.util.List;

/**
 * CMS 팝업 그룹 서비스 인터페이스.
 */
public interface CmsPopGrpService {

    /**
     * 팝업 그룹 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 그룹 응답 목록
     */
    List<PopGrpResponse> list(String siteCd, String langSe);

    /**
     * 팝업 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 그룹 응답 정보
     */
    PopGrpResponse detail(String siteCd, String popGrpId, String langSe);

    /**
     * 팝업 그룹을 등록한다.
     *
     * @param siteCd  사이트 코드
     * @param request 팝업 그룹 등록 요청
     */
    void create(String siteCd, PopGrpRequest request);

    /**
     * 팝업 그룹 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param request  팝업 그룹 수정 요청
     */
    void update(String siteCd, String popGrpId, PopGrpRequest request);

    /**
     * 팝업 그룹을 삭제한다.
     * 연관 팝업(CMS_POP)도 함께 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     */
    void delete(String siteCd, String popGrpId, String langSe);
}
