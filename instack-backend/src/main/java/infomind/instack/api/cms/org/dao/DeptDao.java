package infomind.instack.api.cms.org.dao;

import infomind.instack.api.cms.org.entity.DeptVO;
import infomind.instack.api.cms.org.model.DeptResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 공통 부서 DAO.
 */
@EgovMapper("DeptDao")
public interface DeptDao {
    List<DeptResponse> selectDeptList(DeptVO vo);

    Optional<DeptResponse> selectDeptById(String deptCd);

    List<DeptResponse> selectDeptByOrgCd(String orgCd);

    void insertDept(DeptVO vo);

    void updateDept(@Param("deptCd") String deptCd, @Param("vo") DeptVO vo);

    void deleteDept(String deptCd);

    void deleteDeptByOrgCd(String orgCd);
}
