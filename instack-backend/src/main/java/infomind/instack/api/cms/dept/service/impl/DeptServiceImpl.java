package infomind.instack.api.cms.dept.service.impl;

import infomind.instack.api.cms.dept.dao.DeptDao;
import infomind.instack.api.cms.dept.dao.OrgDao;
import infomind.instack.api.cms.dept.entity.DeptVO;
import infomind.instack.api.cms.dept.model.DeptRequest;
import infomind.instack.api.cms.dept.model.DeptResponse;
import infomind.instack.api.cms.dept.service.DeptService;
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
    public List<DeptResponse> list(DeptRequest request) {
        DeptVO vo = new DeptVO();
        BeanUtils.copyProperties(request, vo);
        return deptDao.selectDeptList(vo);
    }

    @Override
    public DeptResponse select(String deptCd) {
        return deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    @Override
    public List<DeptResponse> listByOrgCd(String orgCd) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        return deptDao.selectDeptByOrgCd(orgCd);
    }

    @Override
    public void insert(DeptRequest request) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(request.getOrgCd())
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        DeptVO vo = new DeptVO();
        BeanUtils.copyProperties(request, vo);
        deptDao.insertDept(vo);
    }

    @Override
    public void update(String deptCd, DeptRequest request) {
        deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(request.getOrgCd())
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        DeptVO vo = new DeptVO();
        BeanUtils.copyProperties(request, vo);
        deptDao.updateDept(deptCd, vo);
    }

    @Override
    public void delete(String deptCd) {
        deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        deptDao.deleteDept(deptCd);
    }
}
