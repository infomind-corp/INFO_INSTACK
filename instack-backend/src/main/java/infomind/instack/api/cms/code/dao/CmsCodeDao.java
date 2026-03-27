package infomind.instack.api.cms.code.dao;

import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;
import infomind.instack.api.cms.code.entity.CmsCodeVO;
import infomind.instack.api.cms.code.model.CodeResponse;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

/**
 * CMS 공통 코드 DAO.
 */
@EgovMapper("CmsCodeDao")
public interface CmsCodeDao {
    List<CodeResponse> selectCodeListByUpCd(String upCd);

    Optional<CodeResponse> selectCodeById(@Param("cd") String cd, @Param("upCd") String upCd);

    Optional<CodeResponse> selectCodeByCd(String cd);

    void insertCode(CmsCodeVO vo);

    void updateCode(@Param("cd") String cd, @Param("upCd") String upCd, @Param("vo") CmsCodeVO vo);

    void deleteCode(@Param("cd") String cd, @Param("upCd") String upCd);

    void deleteCodeByUpCd(String upCd);
}
