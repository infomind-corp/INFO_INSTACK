package infomind.instack.api.cms.manage.dao;

import infomind.instack.api.cms.manage.entity.CmsAdminUserVO;
import infomind.instack.api.cms.manage.entity.CmsPasswordVO;
import infomind.instack.api.cms.manage.entity.CmsTaskUserVO;
import infomind.instack.api.cms.manage.entity.CmsUserVO;
import infomind.instack.api.cms.manage.model.UserListRequest;
import infomind.instack.api.cms.manage.model.UserListResponse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ManageDao {

    List<UserListResponse> selectUserList(UserListRequest request);

    int countUserList(UserListRequest request);

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
