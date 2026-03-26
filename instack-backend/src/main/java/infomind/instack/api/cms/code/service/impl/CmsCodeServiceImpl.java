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

    @Override
    public List<CodeResponse> listByUpCd(String upCd) {
        return cmsCodeDao.selectCodeListByUpCd(upCd);
    }

    @Override
    public CodeResponse select(String cd, String upCd) {
        return cmsCodeDao.selectCodeById(cd, upCd)
                .orElseThrow(() -> new BizException("코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));
    }

    @Override
    @Transactional
    public void insertSub(String upCd, CodeRequest request) {
        // 상위 코드 존재 여부 확인
        cmsCodeDao.selectCodeById(upCd, TOP_CD)
                .orElseThrow(() -> new BizException("상위 코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        CmsCodeVO vo = new CmsCodeVO();
        BeanUtils.copyProperties(request, vo);
        vo.setCdLvl(2);
        vo.setUpCd(upCd);
        cmsCodeDao.insertCode(vo);
    }

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

    @Override
    @Transactional
    public void delete(String cd, String upCd) {
        // 코드 존재 여부 확인
        cmsCodeDao.selectCodeById(cd, upCd)
                .orElseThrow(() -> new BizException("코드를 찾을 수 없습니다", HttpStatus.NOT_FOUND));

        // 하위 코드 삭제
        cmsCodeDao.deleteCodeByUpCd(cd);
        // 코드 삭제
        cmsCodeDao.deleteCode(cd, upCd);
    }
}
