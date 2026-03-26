package infomind.instack.api.cms.dept.service;

import infomind.instack.api.cms.dept.model.OrgRequest;
import infomind.instack.api.cms.dept.model.OrgResponse;

import java.util.List;

/**
 * CMS 공통 조직 서비스 인터페이스.
 */
public interface OrgService {
    List<OrgResponse> list(OrgRequest request);

    OrgResponse select(String orgCd);

    void insert(OrgRequest request);

    void update(String orgCd, OrgRequest request);

    void delete(String orgCd);
}
