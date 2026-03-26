package infomind.instack.api.cms.content.service.impl;

import infomind.instack.api.cms.content.dao.CmsContentDao;
import infomind.instack.api.cms.content.entity.CmsCttSeoVO;
import infomind.instack.api.cms.content.entity.CmsCttVO;
import infomind.instack.api.cms.content.model.ContentRequest;
import infomind.instack.api.cms.content.model.ContentResponse;
import infomind.instack.api.cms.content.service.CmsContentService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 컨텐츠 서비스 구현.
 * <p>CMS_CTT 및 CMS_CTT_SEO 테이블을 함께 관리한다.
 * SEO 데이터는 metaTtl 또는 metaDesc가 있을 때만 처리된다.</p>
 */
@Service
@RequiredArgsConstructor
public class CmsContentServiceImpl extends EgovAbstractServiceImpl implements CmsContentService {

    private final CmsContentDao cmsContentDao;

    /**
     * 컨텐츠 목록을 조회한다.
     *
     * @param request 검색 조건 (siteCd 필수, langSe/useYn/pubYn/keyword 선택)
     * @return 컨텐츠 응답 목록
     */
    @Override
    public List<ContentResponse> list(ContentRequest request) {
        return cmsContentDao.selectContentList(request);
    }

    /**
     * 컨텐츠를 단건 조회한다. SEO 정보를 포함한다.
     *
     * @param siteCd 사이트 코드
     * @param cttId  컨텐츠 아이디
     * @param langSe 언어 구분
     * @return 컨텐츠 응답 정보 (SEO 포함)
     * @throws BizException 컨텐츠를 찾을 수 없는 경우
     */
    @Override
    public ContentResponse select(String siteCd, String cttId, String langSe) {
        return cmsContentDao.selectContentById(siteCd, cttId, langSe)
                .orElseThrow(() -> new BizException("컨텐츠를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 컨텐츠를 등록한다.
     * SEO 필드(metaTtl 또는 metaDesc)가 있으면 CMS_CTT_SEO에도 함께 등록한다.
     *
     * @param request 컨텐츠 등록 요청
     */
    @Override
    @Transactional
    public void insert(ContentRequest request) {
        CmsCttVO vo = new CmsCttVO();
        BeanUtils.copyProperties(request, vo);
        cmsContentDao.insertContent(vo);

        if (hasSeoData(request)) {
            CmsCttSeoVO seoVo = new CmsCttSeoVO();
            seoVo.setSiteCd(request.getSiteCd());
            seoVo.setCttId(request.getCttId());
            seoVo.setLangSe(request.getLangSe());
            seoVo.setMetaTtl(request.getMetaTtl());
            seoVo.setMetaDesc(request.getMetaDesc());
            cmsContentDao.insertContentSeo(seoVo);
        }
    }

    /**
     * 컨텐츠를 수정한다.
     * SEO 데이터가 이미 존재하면 UPDATE, 없으면 INSERT한다(upsert).
     * SEO 필드가 요청에 없으면 SEO 테이블은 변경하지 않는다.
     *
     * @param siteCd  사이트 코드
     * @param cttId   컨텐츠 아이디
     * @param request 컨텐츠 수정 요청 (langSe 포함)
     * @throws BizException 컨텐츠를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String siteCd, String cttId, ContentRequest request) {
        String langSe = request.getLangSe();

        cmsContentDao.selectContentById(siteCd, cttId, langSe)
                .orElseThrow(() -> new BizException("컨텐츠를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsCttVO vo = new CmsCttVO();
        BeanUtils.copyProperties(request, vo);
        cmsContentDao.updateContent(siteCd, cttId, langSe, vo);

        if (hasSeoData(request)) {
            boolean seoExists = cmsContentDao.selectContentSeo(siteCd, cttId, langSe).isPresent();
            if (seoExists) {
                CmsCttSeoVO seoVo = new CmsCttSeoVO();
                seoVo.setMetaTtl(request.getMetaTtl());
                seoVo.setMetaDesc(request.getMetaDesc());
                cmsContentDao.updateContentSeo(siteCd, cttId, langSe, seoVo);
            } else {
                CmsCttSeoVO seoVo = new CmsCttSeoVO();
                seoVo.setSiteCd(siteCd);
                seoVo.setCttId(cttId);
                seoVo.setLangSe(langSe);
                seoVo.setMetaTtl(request.getMetaTtl());
                seoVo.setMetaDesc(request.getMetaDesc());
                cmsContentDao.insertContentSeo(seoVo);
            }
        }
    }

    /**
     * 컨텐츠를 삭제한다.
     * SEO 데이터를 먼저 삭제한 후 컨텐츠를 삭제한다.
     *
     * @param siteCd 사이트 코드
     * @param cttId  컨텐츠 아이디
     * @param langSe 언어 구분
     * @throws BizException 컨텐츠를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String siteCd, String cttId, String langSe) {
        cmsContentDao.selectContentById(siteCd, cttId, langSe)
                .orElseThrow(() -> new BizException("컨텐츠를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        cmsContentDao.deleteContentSeo(siteCd, cttId, langSe);
        cmsContentDao.deleteContent(siteCd, cttId, langSe);
    }

    /**
     * SEO 데이터 포함 여부를 판단한다.
     *
     * @param request 요청 모델
     * @return metaTtl 또는 metaDesc 중 하나라도 값이 있으면 true
     */
    private boolean hasSeoData(ContentRequest request) {
        return (request.getMetaTtl() != null && !request.getMetaTtl().isBlank())
            || (request.getMetaDesc() != null && !request.getMetaDesc().isBlank());
    }
}
