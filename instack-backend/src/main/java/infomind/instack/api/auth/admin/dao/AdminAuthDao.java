package infomind.instack.api.auth.admin.dao;

import infomind.instack.api.auth.admin.entity.CmsRefreshTokenVO;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AdminAuthDao {

    Optional<AuthUserVO> selectAdminUserByUserId(String userId);

    Optional<String> selectPasswordByUserId(String userId);

    Optional<CmsRefreshTokenVO> selectRefreshTokenByUserId(String userId);

    void insertRefreshToken(CmsRefreshTokenVO vo);

    void deleteRefreshTokenByUserId(String userId);
}
