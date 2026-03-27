package infomind.instack.api.cms.code.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import infomind.instack.api.cms.code.dao.CmsCodeDao;
import infomind.instack.api.cms.code.entity.CmsCodeVO;
import infomind.instack.api.cms.code.model.CodeRequest;
import infomind.instack.api.cms.code.model.CodeResponse;
import infomind.instack.api.cms.code.service.CmsCodeService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 공통 코드 서비스 구현.
 */
@Service
@RequiredArgsConstructor
public class CmsCodeServiceImpl extends EgovAbstractServiceImpl implements CmsCodeService {

    private static final String TOP_CD = "0";

    private final CmsCodeDao cmsCodeDao;

    /**
     * 상위 코드로 하위 코드 목록을 조회한다.
     *
     * @param upCd 상위 코드
     * @return 하위 코드 응답 목록
     */
    @Override
    public List<CodeResponse> listByUpCd(String upCd) {
        return cmsCodeDao.selectCodeListByUpCd(upCd);
    }

    /**
     * 코드를 단건 조회한다.
     *
     * @param cd   조회할 코드
     * @param upCd 상위 코드
     * @return 코드 응답 정보
     * @throws BizException 코드를 찾을 수 없는 경우
     */
    @Override
    public CodeResponse select(String cd, String upCd) {
        return cmsCodeDao.selectCodeById(cd, upCd)
                .orElseThrow(() -> new BizException("코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    /**
     * 최상위 코드를 등록한다.
     * 코드 레벨을 1로 설정하여 저장한다.
     *
     * @param request 코드 생성 요청
     */
    @Override
    @Transactional
    public void insert(CodeRequest request) {
        CmsCodeVO vo = new CmsCodeVO();
        BeanUtils.copyProperties(request, vo);
        vo.setCdLvl(1);
        vo.setUpCd(TOP_CD);
        cmsCodeDao.insertCode(vo);
    }

    /**
     * 하위 코드를 등록한다.
     * 상위 코드의 레벨을 조회하여 코드 레벨을 자동 계산(상위 레벨 + 1)하여 저장한다.
     *
     * @param upCd    상위 코드
     * @param request 코드 생성 요청
     * @throws BizException 상위 코드를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void insertSub(String upCd, CodeRequest request) {
        // 상위 코드 존재 여부 확인 및 레벨 조회
        CodeResponse parent = cmsCodeDao.selectCodeByCd(upCd)
                .orElseThrow(() -> new BizException("상위 코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        CmsCodeVO vo = new CmsCodeVO();
        BeanUtils.copyProperties(request, vo);
        vo.setCdLvl(parent.getCdLvl() + 1);
        vo.setUpCd(upCd);
        cmsCodeDao.insertCode(vo);
    }

    /**
     * 코드 정보를 수정한다.
     * 수정 전 코드 존재 여부를 확인한다.
     *
     * @param cd      수정할 코드
     * @param upCd    상위 코드
     * @param request 코드 수정 요청
     * @throws BizException 코드를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String cd, String upCd, CodeRequest request) {
        // 코드 존재 여부 확인
        cmsCodeDao.selectCodeById(cd, upCd)
                .orElseThrow(() -> new BizException("코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        CmsCodeVO vo = new CmsCodeVO();
        BeanUtils.copyProperties(request, vo);
        cmsCodeDao.updateCode(cd, upCd, vo);
    }

    /**
     * 코드를 삭제한다.
     * 해당 코드의 모든 하위 코드도 함께 삭제된다(Cascade).
     * 삭제 전 코드 존재 여부를 확인한다.
     *
     * @param cd      삭제할 코드
     * @param upCd    상위 코드
     * @throws BizException 코드를 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String cd, String upCd) {
        // 코드 존재 여부 확인
        cmsCodeDao.selectCodeById(cd, upCd)
                .orElseThrow(() -> new BizException("코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        // 하위 코드 재귀 삭제
        deleteAllDescendants(cd);
        // 코드 삭제
        cmsCodeDao.deleteCode(cd, upCd);
    }

    /**
     * 지정된 코드의 모든 하위 코드를 재귀적으로 삭제한다.
     *
     * @param cd 삭제할 상위 코드
     */
    private void deleteAllDescendants(String cd) {
        List<CodeResponse> children = cmsCodeDao.selectCodeListByUpCd(cd);
        for (CodeResponse child : children) {
            deleteAllDescendants(child.getCd());
        }
        cmsCodeDao.deleteCodeByUpCd(cd);
    }
}
