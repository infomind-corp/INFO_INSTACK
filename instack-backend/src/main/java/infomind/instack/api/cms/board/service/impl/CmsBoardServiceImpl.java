package infomind.instack.api.cms.board.service.impl;

import infomind.instack.api.cms.board.dao.CmsBoardDao;
import infomind.instack.api.cms.board.entity.CmsBoardAuthVO;
import infomind.instack.api.cms.board.entity.CmsBoardVO;
import infomind.instack.api.cms.board.model.BoardRequest;
import infomind.instack.api.cms.board.model.BoardResponse;
import infomind.instack.api.cms.board.service.CmsBoardService;
import infomind.instack.api.common.exception.BizException;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CMS 게시판 서비스 구현.
 * <p>게시판 기본 정보(CMS_BRD)와 권한 정보(CMS_BRD_AUTH)를 함께 관리한다.</p>
 */
@Service
@RequiredArgsConstructor
public class CmsBoardServiceImpl extends EgovAbstractServiceImpl implements CmsBoardService {

    private final CmsBoardDao cmsBoardDao;

    /**
     * 게시판 목록을 조회한다.
     * brdSe가 null인 경우 사이트의 전체 게시판을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdSe  게시판 구분 코드 (null 허용)
     * @return 게시판 응답 목록
     */
    @Override
    public List<BoardResponse> list(String siteCd, String brdSe) {
        return cmsBoardDao.selectBoardList(siteCd, brdSe);
    }

    /**
     * 게시판을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @return 게시판 응답 정보 (권한 포함)
     * @throws BizException 게시판을 찾을 수 없는 경우
     */
    @Override
    public BoardResponse detail(String siteCd, String brdId) {
        return cmsBoardDao.selectBoardById(siteCd, brdId)
                .orElseThrow(() -> new BizException("게시판을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
    }

    /**
     * 게시판을 등록한다.
     * CMS_BRD와 CMS_BRD_AUTH 레코드를 함께 생성한다.
     *
     * @param siteCd  사이트 코드
     * @param request 게시판 등록 요청
     */
    @Override
    @Transactional
    public void create(String siteCd, BoardRequest request) {
        CmsBoardVO boardVo = new CmsBoardVO();
        BeanUtils.copyProperties(request, boardVo);
        boardVo.setSiteCd(siteCd);
        cmsBoardDao.insertBoard(boardVo);

        CmsBoardAuthVO authVo = new CmsBoardAuthVO();
        authVo.setSiteCd(siteCd);
        authVo.setBrdId(request.getBrdId());
        authVo.setBrdSe(request.getBrdSe());
        authVo.setWrtAuthCd(request.getWrtAuthCd());
        authVo.setQryAuthCd(request.getQryAuthCd());
        authVo.setCmtAuthCd(request.getCmtAuthCd());
        cmsBoardDao.insertBoardAuth(authVo);
    }

    /**
     * 게시판 정보를 수정한다.
     * CMS_BRD와 CMS_BRD_AUTH 레코드를 함께 수정한다.
     * 수정 전 게시판 존재 여부를 확인한다.
     *
     * @param siteCd  사이트 코드
     * @param brdId   게시판 ID
     * @param request 게시판 수정 요청
     * @throws BizException 게시판을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void update(String siteCd, String brdId, BoardRequest request) {
        cmsBoardDao.selectBoardById(siteCd, brdId)
                .orElseThrow(() -> new BizException("게시판을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));

        CmsBoardVO boardVo = new CmsBoardVO();
        BeanUtils.copyProperties(request, boardVo);
        cmsBoardDao.updateBoard(siteCd, brdId, boardVo);

        CmsBoardAuthVO authVo = new CmsBoardAuthVO();
        authVo.setWrtAuthCd(request.getWrtAuthCd());
        authVo.setQryAuthCd(request.getQryAuthCd());
        authVo.setCmtAuthCd(request.getCmtAuthCd());
        cmsBoardDao.updateBoardAuth(siteCd, brdId, authVo);
    }

    /**
     * 게시판을 삭제한다.
     * 권한 정보(CMS_BRD_AUTH)를 먼저 삭제한 후 게시판(CMS_BRD)을 삭제한다.
     * 삭제 전 게시판 존재 여부를 확인한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @throws BizException 게시판을 찾을 수 없는 경우
     */
    @Override
    @Transactional
    public void delete(String siteCd, String brdId) {
        cmsBoardDao.selectBoardById(siteCd, brdId)
                .orElseThrow(() -> new BizException("게시판을 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
        cmsBoardDao.deleteBoardAuth(siteCd, brdId);
        cmsBoardDao.deleteBoard(siteCd, brdId);
    }
}
