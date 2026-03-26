package infomind.instack.api.cms.user.dao;

import infomind.instack.api.cms.user.entity.CmsAdminUserVO;
import infomind.instack.api.cms.user.entity.CmsPasswordVO;
import infomind.instack.api.cms.user.entity.CmsPwdHistVO;
import infomind.instack.api.cms.user.entity.CmsTaskUserVO;
import infomind.instack.api.cms.user.entity.CmsUserVO;
import infomind.instack.api.cms.user.model.UserDetailResponse;
import infomind.instack.api.cms.user.model.UserListRequest;
import infomind.instack.api.cms.user.model.UserListResponse;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import java.util.List;
import java.util.Optional;

@EgovMapper("CmsUserDao")
public interface CmsUserDao {

    List<UserListResponse> selectUserList(UserListRequest request);

    int countUserList(UserListRequest request);

    Optional<UserDetailResponse> selectAdminUserById(String userId);

    Optional<UserDetailResponse> selectTaskUserById(String userId);

    Optional<UserDetailResponse> selectGeneralUserById(String userId);

    void insertAdminUser(CmsAdminUserVO vo);

    void insertTaskUser(CmsTaskUserVO vo);

    void insertGeneralUser(CmsUserVO vo);

    void insertPassword(CmsPasswordVO vo);

    void insertPasswordHistory(CmsPwdHistVO vo);

    void updateAdminUser(@Param("userId") String userId, @Param("vo") CmsAdminUserVO vo);

    void updateTaskUser(@Param("userId") String userId, @Param("vo") CmsTaskUserVO vo);

    void updateGeneralUser(@Param("userId") String userId, @Param("vo") CmsUserVO vo);

    void updatePassword(CmsPasswordVO vo);

    void deleteAdminUser(String userId);

    void deleteTaskUser(String userId);

    void deleteGeneralUser(String userId);

    void deletePasswordByUserIdAndUserSe(@Param("userId") String userId, @Param("userSe") String userSe);
}
