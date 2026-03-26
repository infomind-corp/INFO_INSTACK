package infomind.instack.api.cms.org.dao;

import infomind.instack.api.cms.org.entity.OrgVO;
import infomind.instack.api.cms.org.model.OrgResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 공통 조직 DAO.
 */
@EgovMapper("OrgDao")
public interface OrgDao {
    List<OrgResponse> selectOrgList(OrgVO vo);

    Optional<OrgResponse> selectOrgById(String orgCd);

    void insertOrg(OrgVO vo);

    void updateOrg(@Param("orgCd") String orgCd, @Param("vo") OrgVO vo);

    void deleteOrg(String orgCd);
}
