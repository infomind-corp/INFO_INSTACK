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

    /**
     * 조직 목록을 조회한다.
     *
     * @param request 조직 조회 요청
     * @return 조직 응답 목록
     */
    @Override
    public List<OrgResponse> list(OrgRequest request) {
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        return orgDao.selectOrgList(vo);
    }

    /**
     * 조직을 단건 조회한다.
     *
     * @param orgCd 조회할 조직 코드
     * @return 조직 응답 정보
     * @throws BizException 조직을 찾을 수 없는 경우
     */
    @Override
    public OrgResponse select(String orgCd) {
        return orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    /**
     * 조직을 등록한다.
     *
     * @param request 조직 등록 요청
     */
    @Override
    public void insert(OrgRequest request) {
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        orgDao.insertOrg(vo);
    }

    /**
     * 조직 정보를 수정한다.
     * 수정 전 조직 존재 여부를 확인한다.
     *
     * @param orgCd   수정할 조직 코드
     * @param request 조직 수정 요청
     * @throws BizException 조직을 찾을 수 없는 경우
     */
    @Override
    public void update(String orgCd, OrgRequest request) {
        orgDao.selectOrgById(orgCd)
                .orElseThrow(() -> new BizException("조직을 찾을 수 없습니다", HttpStatus.NOT_FOUND));
        OrgVO vo = new OrgVO();
        BeanUtils.copyProperties(request, vo);
        orgDao.updateOrg(orgCd, vo);
    }

    /**
     * 조직을 삭제한다.
     * 해당 조직의 모든 부서도 함께 삭제된다(Cascade).
     * 삭제 전 조직 존재 여부를 확인한다.
     *
     * @param orgCd 삭제할 조직 코드
     * @throws BizException 조직을 찾을 수 없는 경우
     */
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
