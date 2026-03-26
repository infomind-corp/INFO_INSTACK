package infomind.instack.api.cms.org.service.impl;

import infomind.instack.api.cms.org.dao.DeptDao;
import infomind.instack.api.cms.org.dao.OrgDao;
import infomind.instack.api.cms.org.entity.OrgVO;
import infomind.instack.api.cms.org.model.OrgRequest;
import infomind.instack.api.cms.org.model.OrgResponse;
import infomind.instack.api.cms.org.service.OrgService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 공통 조직 서비스 구현.
 */
@Service
@RequiredArgsConstructor
public class OrgServiceImpl extends EgovAbstractServiceImpl implements OrgService {

    private final OrgDao orgDao;
    private final DeptDao deptDao;

    @Override
    public List<OrgResponse> list(OrgRequest request) {
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        return orgDao.selectOrgList(vo);
    }

    @Override
    public OrgResponse select(String orgCd) {
        return orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    @Override
    public void insert(OrgRequest request) {
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        orgDao.insertOrg(vo);
    }

    @Override
    public void update(String orgCd, OrgRequest request) {
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        orgDao.updateOrg(orgCd, vo);
    }

    @Override
    @Transactional
    public void delete(String orgCd) {
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        // 해당 조직의 부서 먼저 삭제
        deptDao.deleteDeptByOrgCd(orgCd);
        // 조직 삭제
        orgDao.deleteOrg(orgCd);
    }
}
