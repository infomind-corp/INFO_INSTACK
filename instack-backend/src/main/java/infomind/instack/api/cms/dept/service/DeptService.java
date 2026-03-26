package infomind.instack.api.cms.dept.service;

import infomind.instack.api.cms.dept.model.DeptRequest;
import infomind.instack.api.cms.dept.model.DeptResponse;

import java.util.List;

/**
 * CMS 공통 부서 서비스 인터페이스.
 */
public interface DeptService {
    List<DeptResponse> list(DeptRequest request);

    DeptResponse select(String deptCd);

    List<DeptResponse> listByOrgCd(String orgCd);

    void insert(DeptRequest request);

    void update(String deptCd, DeptRequest request);

    void delete(String deptCd);
}
