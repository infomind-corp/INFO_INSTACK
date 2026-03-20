package infomind.instack.api.auth.basic.dao;

import infomind.instack.api.auth.basic.entity.RefreshToken;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface RefreshTokenDao {

    void upsert(RefreshToken refreshToken);

    Optional<RefreshToken> selectByMemberId(String memberId);

    void deleteByMemberId(String memberId);
}