package infomind.instack.api.cms.board.service;

import infomind.instack.api.cms.board.model.BoardRequest;
import infomind.instack.api.cms.board.model.BoardResponse;

import java.util.List;

/**
 * CMS 게시판 서비스 인터페이스.
 * <p>게시판 기본 정보(CMS_BRD)와 권한 정보(CMS_BRD_AUTH)를 함께 관리한다.</p>
 */
public interface CmsBoardService {

    /**
     * 게시판 목록을 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdSe  게시판 구분 코드 (null 허용)
     * @return 게시판 응답 목록
     */
    List<BoardResponse> list(String siteCd, String brdSe);

    /**
     * 게시판을 단건 조회한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     * @return 게시판 응답 정보
     */
    BoardResponse detail(String siteCd, String brdId);

    /**
     * 게시판을 등록한다.
     *
     * @param siteCd  사이트 코드
     * @param request 게시판 등록 요청
     */
    void create(String siteCd, BoardRequest request);

    /**
     * 게시판 정보를 수정한다.
     *
     * @param siteCd  사이트 코드
     * @param brdId   게시판 ID
     * @param request 게시판 수정 요청
     */
    void update(String siteCd, String brdId, BoardRequest request);

    /**
     * 게시판을 삭제한다.
     *
     * @param siteCd 사이트 코드
     * @param brdId  게시판 ID
     */
    void delete(String siteCd, String brdId);
}
