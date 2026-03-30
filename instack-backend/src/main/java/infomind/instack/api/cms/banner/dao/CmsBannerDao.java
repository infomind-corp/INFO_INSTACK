package infomind.instack.api.cms.banner.dao;

import infomind.instack.api.cms.banner.entity.CmsBannerGrpVO;
import infomind.instack.api.cms.banner.entity.CmsBannerVO;
import infomind.instack.api.cms.banner.model.BannerGrpRequest;
import infomind.instack.api.cms.banner.model.BannerGrpResponse;
import infomind.instack.api.cms.banner.model.BannerRequest;
import infomind.instack.api.cms.banner.model.BannerResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 배너 DAO.
 * <p>CMS_BNR_GRP 및 CMS_BNR 테이블 접근.</p>
 */
@EgovMapper("CmsBannerDao")
public interface CmsBannerDao {

    // ----- CMS_BNR_GRP -----

    /**
     * 배너 그룹 목록을 조회한다.
     *
     * @param request 배너 그룹 요청 (siteCd, langSe, useYn 필터)
     * @return 배너 그룹 응답 목록
     */
    List<BannerGrpResponse> selectBannerGrpList(BannerGrpRequest request);

    /**
     * 배너 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @return 배너 그룹 응답 정보
     */
    Optional<BannerGrpResponse> selectBannerGrpById(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("langSe") String langSe);

    /**
     * 배너 그룹을 등록한다.
     *
     * @param vo 배너 그룹 VO
     */
    void insertBannerGrp(CmsBannerGrpVO vo);

    /**
     * 배너 그룹 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @param vo       배너 그룹 VO
     */
    void updateBannerGrp(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("langSe") String langSe,
            @Param("vo") CmsBannerGrpVO vo);

    /**
     * 배너 그룹을 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     */
    void deleteBannerGrp(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("langSe") String langSe);

    // ----- CMS_BNR -----

    /**
     * 배너 목록을 조회한다.
     *
     * @param request 배너 요청 (siteCd, bnrGrpId, langSe, useYn 필터)
     * @return 배너 응답 목록
     */
    List<BannerResponse> selectBannerList(BannerRequest request);

    /**
     * 배너를 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @return 배너 응답 정보
     */
    Optional<BannerResponse> selectBannerById(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("bnrId") String bnrId,
            @Param("langSe") String langSe);

    /**
     * 배너를 등록한다.
     *
     * @param vo 배너 VO
     */
    void insertBanner(CmsBannerVO vo);

    /**
     * 배너 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @param vo       배너 VO
     */
    void updateBanner(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("bnrId") String bnrId,
            @Param("langSe") String langSe,
            @Param("vo") CmsBannerVO vo);

    /**
     * 배너를 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     */
    void deleteBanner(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("bnrId") String bnrId,
            @Param("langSe") String langSe);

    /**
     * 배너 그룹에 속한 배너를 전체 삭제한다 (그룹 삭제 전 FK 정리용).
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     */
    void deleteBannerByGrp(
            @Param("siteCd") String siteCd,
            @Param("bnrGrpId") String bnrGrpId,
            @Param("langSe") String langSe);
}
