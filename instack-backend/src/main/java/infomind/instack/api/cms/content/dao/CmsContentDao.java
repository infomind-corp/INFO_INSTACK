package infomind.instack.api.cms.content.dao;

import infomind.instack.api.cms.content.entity.CmsCttSeoVO;
import infomind.instack.api.cms.content.entity.CmsCttVO;
import infomind.instack.api.cms.content.model.ContentRequest;
import infomind.instack.api.cms.content.model.ContentResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 컨텐츠 DAO.
 */
@EgovMapper("CmsContentDao")
public interface CmsContentDao {

    // ----- CMS_CTT -----

    List<ContentResponse> selectContentList(ContentRequest request);

    Optional<ContentResponse> selectContentById(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe);

    void insertContent(CmsCttVO vo);

    void updateContent(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe,
            @Param("vo")     CmsCttVO vo);

    void deleteContent(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe);

    // ----- CMS_CTT_SEO -----

    Optional<CmsCttSeoVO> selectContentSeo(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe);

    void insertContentSeo(CmsCttSeoVO vo);

    void updateContentSeo(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe,
            @Param("vo")     CmsCttSeoVO vo);

    void deleteContentSeo(
            @Param("siteCd") String siteCd,
            @Param("cttId")  String cttId,
            @Param("langSe") String langSe);
}
