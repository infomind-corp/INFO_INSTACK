package infomind.instack.api.auth.basic.dao;

import infomind.instack.api.auth.basic.entity.AuthUserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AuthDao {

    Optional<AuthUserVO> selectAuthUserByLoginId(String loginId);

    Optional<AuthUserVO> selectAuthUserByMemberId(String memberId);
}