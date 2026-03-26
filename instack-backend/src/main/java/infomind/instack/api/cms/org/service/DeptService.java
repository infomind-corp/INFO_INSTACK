package infomind.instack.api.cms.org.service;

import infomind.instack.api.cms.org.model.DeptRequest;
import infomind.instack.api.cms.org.model.DeptResponse;

import java.util.List;

/**
 * CMS 공통 부서 서비스 인터페이스.
 */
public interface DeptService {
    List<DeptResponse> listByOrgCd(String orgCd);

    DeptResponse select(String deptCd);

    void insert(String orgCd, DeptRequest request);

    void update(String orgCd, String deptCd, DeptRequest request);

    void delete(String deptCd);
}
