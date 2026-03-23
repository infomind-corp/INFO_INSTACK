package infomind.instack.api.cms.user.dao;

import infomind.instack.api.cms.user.entity.CmsAdminUserVO;
import infomind.instack.api.cms.user.entity.CmsPasswordVO;
import infomind.instack.api.cms.user.entity.CmsTaskUserVO;
import infomind.instack.api.cms.user.entity.CmsUserVO;
import infomind.instack.api.cms.user.model.UserDetailResponse;
import infomind.instack.api.cms.user.model.UserListRequest;
import infomind.instack.api.cms.user.model.UserListResponse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface CmsUserDao {

    List<UserListResponse> selectUserList(UserListRequest request);

    int countUserList(UserListRequest request);

    Optional<UserDetailResponse> selectAdminUserById(String id);

    Optional<UserDetailResponse> selectTaskUserById(String id);

    Optional<UserDetailResponse> selectGeneralUserById(String id);

    void insertAdminUser(CmsAdminUserVO vo);

    void insertTaskUser(CmsTaskUserVO vo);

    void insertGeneralUser(CmsUserVO vo);

    void insertPassword(CmsPasswordVO vo);

    void updateAdminUser(@Param("id") String id, @Param("vo") CmsAdminUserVO vo);

    void updateTaskUser(@Param("id") String id, @Param("vo") CmsTaskUserVO vo);

    void updateGeneralUser(@Param("id") String id, @Param("vo") CmsUserVO vo);

    void updatePassword(CmsPasswordVO vo);

    void deleteAdminUser(String id);

    void deleteTaskUser(String id);

    void deleteGeneralUser(String id);

    void deletePasswordByUserIdAndUserSe(@Param("userId") String userId, @Param("userSe") String userSe);
}
