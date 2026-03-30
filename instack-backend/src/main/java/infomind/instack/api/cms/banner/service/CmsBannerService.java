package infomind.instack.api.cms.banner.service;

import infomind.instack.api.cms.banner.model.BannerGrpRequest;
import infomind.instack.api.cms.banner.model.BannerGrpResponse;
import infomind.instack.api.cms.banner.model.BannerRequest;
import infomind.instack.api.cms.banner.model.BannerResponse;

import java.util.List;

/**
 * CMS 배너 서비스 인터페이스.
 * <p>배너 그룹(CMS_BNR_GRP)과 배너(CMS_BNR)를 관리한다.</p>
 */
public interface CmsBannerService {

    // ----- 배너 그룹 -----

    /**
     * 배너 그룹 목록을 조회한다.
     *
     * @param request 조회 조건 (siteCd, langSe, useYn)
     * @return 배너 그룹 응답 목록
     */
    List<BannerGrpResponse> listBannerGrp(BannerGrpRequest request);

    /**
     * 배너 그룹을 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @return 배너 그룹 응답 정보
     */
    BannerGrpResponse detailBannerGrp(String siteCd, String bnrGrpId, String langSe);

    /**
     * 배너 그룹을 등록한다.
     *
     * @param siteCd  사이트 코드
     * @param request 배너 그룹 등록 요청
     */
    void createBannerGrp(String siteCd, BannerGrpRequest request);

    /**
     * 배너 그룹 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     * @param request  배너 그룹 수정 요청
     */
    void updateBannerGrp(String siteCd, String bnrGrpId, String langSe, BannerGrpRequest request);

    /**
     * 배너 그룹을 삭제한다.
     * 그룹에 속한 배너(CMS_BNR)를 먼저 삭제한 후 그룹(CMS_BNR_GRP)을 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param langSe   언어 구분
     */
    void deleteBannerGrp(String siteCd, String bnrGrpId, String langSe);

    // ----- 배너 -----

    /**
     * 배너 목록을 조회한다.
     *
     * @param request 조회 조건 (siteCd, bnrGrpId, langSe, useYn)
     * @return 배너 응답 목록
     */
    List<BannerResponse> listBanner(BannerRequest request);

    /**
     * 배너를 단건 조회한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @return 배너 응답 정보
     */
    BannerResponse detailBanner(String siteCd, String bnrGrpId, String bnrId, String langSe);

    /**
     * 배너를 등록한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param request  배너 등록 요청
     */
    void createBanner(String siteCd, String bnrGrpId, BannerRequest request);

    /**
     * 배너 정보를 수정한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     * @param request  배너 수정 요청
     */
    void updateBanner(String siteCd, String bnrGrpId, String bnrId, String langSe, BannerRequest request);

    /**
     * 배너를 삭제한다.
     *
     * @param siteCd   사이트 코드
     * @param bnrGrpId 배너 그룹 아이디
     * @param bnrId    배너 아이디
     * @param langSe   언어 구분
     */
    void deleteBanner(String siteCd, String bnrGrpId, String bnrId, String langSe);
}
