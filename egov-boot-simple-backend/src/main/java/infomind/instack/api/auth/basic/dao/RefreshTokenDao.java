package infomind.instack.api.auth.basic.dao;

import infomind.instack.api.auth.basic.entity.RefreshTokenVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface RefreshTokenDao {

    void merge(RefreshTokenVO refreshTokenVO);

    Optional<RefreshTokenVO> selectByMemberId(String memberId);

    void deleteByMemberId(String memberId);
}