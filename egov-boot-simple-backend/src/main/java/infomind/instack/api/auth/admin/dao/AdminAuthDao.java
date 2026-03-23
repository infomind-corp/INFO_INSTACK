package infomind.instack.api.auth.admin.dao;

import infomind.instack.api.auth.admin.entity.CmsRefreshTokenVO;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AdminAuthDao {

    Optional<AuthUserVO> selectAdminUserByAdmId(String admId);

    Optional<String> selectPasswordByAdmId(String admId);

    Optional<CmsRefreshTokenVO> selectRefreshTokenByUserId(String userId);

    void insertRefreshToken(CmsRefreshTokenVO vo);

    void deleteRefreshTokenByUserId(String userId);
}
