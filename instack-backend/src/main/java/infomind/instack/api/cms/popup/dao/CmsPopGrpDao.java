package infomind.instack.api.cms.popup.dao;

import infomind.instack.api.cms.popup.entity.CmsPopGrpVO;
import infomind.instack.api.cms.popup.model.PopGrpResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 팝업 그룹 DAO.
 * <p>CMS_POP_GRP 테이블 접근.</p>
 */
@EgovMapper("CmsPopGrpDao")
public interface CmsPopGrpDao {

    /**
     * 팝업 그룹 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param langSe 언어 구분 (null 허용)
     * @return 팝업 그룹 응답 목록
     */
    List<PopGrpResponse> selectPopGrpList(@Param("siteCd") String siteCd, @Param("langSe") String langSe);

    /**
     * 팝업 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 허용)
     * @return 팝업 그룹 응답 정보
     */
    Optional<PopGrpResponse> selectPopGrpById(@Param("siteCd") String siteCd, @Param("popGrpId") String popGrpId, @Param("langSe") String langSe);

    /**
     * 팝업 그룹을 등록한다.
     *
     * @param vo 팝업 그룹 VO
     */
    void insertPopGrp(CmsPopGrpVO vo);

    /**
     * 팝업 그룹 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param vo       팝업 그룹 VO
     */
    void updatePopGrp(@Param("siteCd") String siteCd, @Param("popGrpId") String popGrpId, @Param("vo") CmsPopGrpVO vo);

    /**
     * 팝업 그룹을 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param popGrpId 팝업 그룹 아이디
     * @param langSe   언어 구분 (null 시 전 언어 삭제)
     */
    void deletePopGrp(@Param("siteCd") String siteCd, @Param("popGrpId") String popGrpId, @Param("langSe") String langSe);
}
