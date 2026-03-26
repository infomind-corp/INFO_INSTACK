package infomind.instack.api.cms.content.service;

import infomind.instack.api.cms.content.model.ContentRequest;
import infomind.instack.api.cms.content.model.ContentResponse;

import java.util.List;

/**
 * CMS 컨텐츠 서비스 인터페이스.
 */
public interface CmsContentService {

    List<ContentResponse> list(ContentRequest request);

    ContentResponse select(String siteCd, String cttId, String langSe);

    void insert(ContentRequest request);

    void update(String siteCd, String cttId, ContentRequest request);

    void delete(String siteCd, String cttId, String langSe);
}
