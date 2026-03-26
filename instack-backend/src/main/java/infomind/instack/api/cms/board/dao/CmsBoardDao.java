package infomind.instack.api.cms.board.dao;

import infomind.instack.api.cms.board.entity.CmsBoardAuthVO;
import infomind.instack.api.cms.board.entity.CmsBoardVO;
import infomind.instack.api.cms.board.model.BoardResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

/**
 * CMS 게시판 DAO.
 * <p>CMS_BRD 및 CMS_BRD_AUTH 테이블 접근.</p>
 */
@EgovMapper("CmsBoardDao")
public interface CmsBoardDao {

    // ----- CMS_BRD -----

    /**
     * 게시판 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdSe  게시판 구분 코드 (null 허용)
     * @return 게시판 응답 목록
     */
    List<BoardResponse> selectBoardList(@Param("siteCd") String siteCd, @Param("brdSe") String brdSe);

    /**
     * 게시판을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @return 게시판 응답 정보
     */
    Optional<BoardResponse> selectBoardById(@Param("siteCd") String siteCd, @Param("brdId") String brdId);

    /**
     * 게시판을 등록한다.
     *
     * @param vo 게시판 VO
     */
    void insertBoard(CmsBoardVO vo);

    /**
     * 게시판 정보를 수정한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @param vo     게시판 VO
     */
    void updateBoard(@Param("siteCd") String siteCd, @Param("brdId") String brdId, @Param("vo") CmsBoardVO vo);

    /**
     * 게시판을 삭제한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     */
    void deleteBoard(@Param("siteCd") String siteCd, @Param("brdId") String brdId);

    // ----- CMS_BRD_AUTH -----

    /**
     * 게시판 권한 정보를 등록한다.
     *
     * @param vo 게시판 권한 VO
     */
    void insertBoardAuth(CmsBoardAuthVO vo);

    /**
     * 게시판 권한 정보를 수정한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @param vo     게시판 권한 VO
     */
    void updateBoardAuth(@Param("siteCd") String siteCd, @Param("brdId") String brdId, @Param("vo") CmsBoardAuthVO vo);

    /**
     * 게시판 권한 정보를 삭제한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     */
    void deleteBoardAuth(@Param("siteCd") String siteCd, @Param("brdId") String brdId);
}
