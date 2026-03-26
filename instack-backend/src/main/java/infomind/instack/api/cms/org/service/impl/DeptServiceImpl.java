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

    /**
     * 조직별 부서 목록을 조회한다.
     * 먼저 조직 존재 여부를 확인한다.
     *
     * @param orgCd 조직 코드
     * @return 부서 응답 목록
     * @throws BizException 조직을 찾을 수 없는 경우
     */
    @Override
    public List<DeptResponse> listByOrgCd(String orgCd) {
        // 조직이 존재하는지 확인
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        return deptDao.selectDeptByOrgCd(orgCd);
    }

    /**
     * 부서를 단건 조회한다.
     *
     * @param deptCd 조회할 부서 코드
     * @return 부서 응답 정보
     * @throws BizException 부서를 찾을 수 없는 경우
     */
    @Override
    public DeptResponse select(String deptCd) {
        return deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    /**
     * 부서를 등록한다.
     * 먼저 조직 존재 여부를 확인한다.
     *
     * @param orgCd   조직 코드
     * @param request 부서 등록 요청
     * @throws BizException 조직을 찾을 수 없는 경우
     */
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

    /**
     * 부서 정보를 수정한다.
     * 조직과 부서의 존재 여부를 확인하고, 부서가 해당 조직에 속하는지 검증한다.
     *
     * @param orgCd   조직 코드
     * @param deptCd  수정할 부서 코드
     * @param request 부서 수정 요청
     * @throws BizException 조직/부서를 찾을 수 없거나 부서가 해당 조직에 속하지 않는 경우
     */
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

    /**
     * 부서를 삭제한다.
     * 삭제 전 부서 존재 여부를 확인한다.
     *
     * @param deptCd 삭제할 부서 코드
     * @throws BizException 부서를 찾을 수 없는 경우
     */
    @Override
    public void delete(String deptCd) {
        deptDao.selectDeptById(deptCd)
                .orElseThrow(() -> new BizException("부서를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        deptDao.deleteDept(deptCd);
    }
}
