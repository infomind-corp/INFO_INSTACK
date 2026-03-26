package infomind.instack.api.cms.org.service.impl;

import infomind.instack.api.cms.org.dao.DeptDao;
import infomind.instack.api.cms.org.dao.OrgDao;
import infomind.instack.api.cms.org.entity.DeptVO;
import infomind.instack.api.cms.org.model.DeptRequest;
import infomind.instack.api.cms.org.model.DeptResponse;
import infomind.instack.api.cms.org.service.DeptService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CMS 공통 부서 서비스 구현.
 */
@Service
@RequiredArgsConstructor
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {

    private final DeptDao deptDao;
    private final OrgDao orgDao;

    @Override
    public List<DeptResponse> listByOrgCd(String orgCd) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        return deptDao.selectDeptByOrgCd(orgCd);
    }

    @Override
    public DeptResponse select(String deptCd) {
        return deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    @Override
    public void insert(String orgCd, DeptRequest request) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        DeptVO vo = new DeptVO();
        BeanUtils.copyProperties(request, vo);
        vo.setOrgCd(orgCd);
        deptDao.insertDept(vo);
    }

    @Override
    public void update(String orgCd, String deptCd, DeptRequest request) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        DeptResponse dept = deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        // 부서가 해당 조직에 속하는지 확인
        if (!dept.getOrgCd().equals(orgCd)) {
            throw new BizException("해당 조직의 부서가 아닙니다", HttpStatus.BAD_REQUEST);
        }

        DeptVO vo = new DeptVO();
        BeanUtils.copyProperties(request, vo);
        vo.setOrgCd(orgCd);
        deptDao.updateDept(deptCd, vo);
    }

    @Override
    public void delete(String deptCd) {
        deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        deptDao.deleteDept(deptCd);
    }
}
