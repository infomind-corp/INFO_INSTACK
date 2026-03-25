package infomind.instack.api.auth.jwt.dao;

import infomind.instack.api.auth.jwt.entity.RefreshTokenVO;
import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

/**
 * 통합 JWT 인증 DAO
 * <p>사용자 구분(userSe)별로 각 테이블(CMS_USER_ADMIN, CMS_USER_TASK, CMS_USER)에서 사용자 조회</p>
 */
@EgovMapper("JwtAuthDao")
public interface JwtAuthDao {

    /**
     * 관리자 사용자 조회 (CMS_USER_ADMIN)
     */
    Optional<AuthUserVO> selectAdminUserByUserId(String userId);

    /**
     * 업무 사용자 조회 (CMS_USER_TASK)
     */
    Optional<AuthUserVO> selectTaskUserByUserId(String userId);

    /**
     * 일반 사용자 조회 (CMS_USER)
     */
    Optional<AuthUserVO> selectUserByUserId(String userId);

    /**
     * 비밀번호 조회 (CMS_PWD)
     * @param userId 사용자 ID
     * @param userSe 사용자 구분 (A/E/G)
     */
    Optional<String> selectPasswordByUserId(@Param("userId") String userId, @Param("userSe") String userSe);

    /**
     * Refresh Token 조회 (CMS_RF_TK)
     */
    Optional<RefreshTokenVO> selectRefreshTokenByUserId(String userId);

    /**
     * Refresh Token 저장 (CMS_RF_TK)
     */
    void insertRefreshToken(RefreshTokenVO vo);

    /**
     * Refresh Token 삭제 (CMS_RF_TK)
     */
    void deleteRefreshTokenByUserId(String userId);
}
