package infomind.instack.api.auth.basic.dao;

import infomind.instack.api.auth.basic.entity.AuthUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AuthDao {

    Optional<AuthUser> selectByLoginId(String loginId);

    void mergeRefreshToken(String memberId, String refreshToken);
}