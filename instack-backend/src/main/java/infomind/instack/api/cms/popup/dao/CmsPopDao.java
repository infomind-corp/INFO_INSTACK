package infomind.instack.api.cms.popup.dao;

import infomind.instack.api.cms.popup.entity.CmsPopVO;
import infomind.instack.api.cms.popup.model.PopResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 팝업 DAO.
 * <p>CMS_POP 테이블 접근.</p>
 */
@EgovMapper("CmsPopDao")
public interface CmsPopDao {

    /**
     * 팝업 목록을 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 응답 목록
     */
    List<PopResponse> selectPopList(@Param("siteCd") String siteCd, @Param("popGrpId") String popGrpId, @Param("langSe") String langSe);

    /**
     * 팝업을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param popId  팝업 아이디
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 응답 정보
     */
    Optional<PopResponse> selectPopById(@Param("siteCd") String siteCd, @Param("popId") String popId, @Param("langSe") String langSe);

    /**
     * 팝업을 등록한다.
     *
     * @param vo 팝업 VO
     */
    void insertPop(CmsPopVO vo);

    /**
     * 팝업 정보를 수정한다.
     *
     * @param siteCd 사이트 코드
     * @param popId  팝업 아이디
     * @param vo     팝업 VO
     */
    void updatePop(@Param("siteCd") String siteCd, @Param("popId") String popId, @Param("vo") CmsPopVO vo);

    /**
     * 팝업을 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param popId    팝업 아이디
     * @param popGrpId 팝업 그룹 아이디 (null 허용)
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     */
    void deletePop(@Param("siteCd") String siteCd, @Param("popId") String popId, @Param("popGrpId") String popGrpId, @Param("langSe") String langSe);

    /**
     * 팝업 그룹에 속한 팝업을 일괄 삭제한다. (팝업 그룹 삭제 시 cascade 용도)
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     */
    void deletePopByGrpId(@Param("siteCd") String siteCd, @Param("popGrpId") String popGrpId, @Param("langSe") String langSe);
}
