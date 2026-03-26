package infomind.instack.api.cms.code.service;

import infomind.instack.api.cms.code.model.CodeRequest;
import infomind.instack.api.cms.code.model.CodeResponse;

import java.util.List;

/**
 * CMS 공통 코드 서비스 인터페이스.
 */
public interface CmsCodeService {
    List<CodeResponse> listByUpCd(String upCd);

    CodeResponse select(String cd, String upCd);

    void insertSub(String upCd, CodeRequest request);

    void update(String cd, String upCd, CodeRequest request);

    void delete(String cd, String upCd);
}
