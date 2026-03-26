package infomind.instack.api.cms.user.service.impl;

import infomind.instack.api.cms.user.dao.CmsUserDao;
import infomind.instack.api.cms.user.entity.CmsAdminUserVO;
import infomind.instack.api.cms.user.entity.CmsPasswordVO;
import infomind.instack.api.cms.user.entity.CmsPwdHistVO;
import infomind.instack.api.cms.user.entity.CmsTaskUserVO;
import infomind.instack.api.cms.user.entity.CmsUserVO;
import infomind.instack.api.cms.user.model.*;
import infomind.instack.api.cms.user.service.CmsUserService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.model.PageResponse;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.crypto.EgovPasswordEncoder;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
@RequiredArgsConstructor
public class CmsUserServiceImpl extends EgovAbstractServiceImpl implements CmsUserService {

    private final CmsUserDao cmsUserDao;
    private final EgovPasswordEncoder egovPasswordEncoder;

    @Override
    public PageResponse<UserListResponse> list(UserListRequest request) {
        return new PageResponse<>(cmsUserDao.selectUserList(request), cmsUserDao.countUserList(request), request);
    }

    @Override
    public UserDetailResponse detail(String userId, String userSe) {
        return switch (userSe) {
            case "A" -> cmsUserDao.selectAdminUserById(userId)
                    .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
            case "E" -> cmsUserDao.selectTaskUserById(userId)
                    .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
            case "G" -> cmsUserDao.selectGeneralUserById(userId)
                    .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.NOT_FOUND));
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        };
    }

    @Override
    public void create(String userSe, CreateUserRequest request) {
        switch (userSe) {
            case "A" -> {
                CmsAdminUserVO vo = new CmsAdminUserVO();
                BeanUtils.copyProperties(request, vo);
                vo.setUserId(request.getUserId());
                vo.setAdmStsSe("ACTIVE");

                cmsUserDao.insertAdminUser(vo);
            }
            case "E" -> {
                CmsTaskUserVO vo = new CmsTaskUserVO();
                BeanUtils.copyProperties(request, vo);
                vo.setUserId(request.getUserId());
                vo.setUserStsSe("ACTIVE");

                cmsUserDao.insertTaskUser(vo);
            }
            case "G" -> {
                CmsUserVO vo = new CmsUserVO();
                BeanUtils.copyProperties(request, vo);
                vo.setUserId(request.getUserId());
                vo.setUserStsSe("ACTIVE");
                vo.setEmlCertYn("N");
                vo.setTelnoCertYn("N");

                cmsUserDao.insertGeneralUser(vo);
            }
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        }

        insertPassword(request.getUserId(), userSe, request.getPwd());
    }

    @Override
    public void update(String userSe, String userId, UpdateUserRequest request) {
        switch (userSe) {
            case "A" -> {
                CmsAdminUserVO vo = new CmsAdminUserVO();
                BeanUtils.copyProperties(request, vo);

                cmsUserDao.updateAdminUser(userId, vo);
            }
            case "E" -> {
                CmsTaskUserVO vo = new CmsTaskUserVO();
                BeanUtils.copyProperties(request, vo);

                cmsUserDao.updateTaskUser(userId, vo);
            }
            case "G" -> {
                CmsUserVO vo = new CmsUserVO();
                BeanUtils.copyProperties(request, vo);

                cmsUserDao.updateGeneralUser(userId, vo);
            }
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        }

        if (request.getPwd() != null && !request.getPwd().isBlank()) {
            String encryptedPwd = egovPasswordEncoder.encryptPassword(request.getPwd());
            CmsPasswordVO pwdVO = new CmsPasswordVO();
            pwdVO.setUserId(userId);
            pwdVO.setUserSe(userSe);
            pwdVO.setPwd(encryptedPwd);
            cmsUserDao.updatePassword(pwdVO);
            insertPasswordHistory(userId, userSe, encryptedPwd);
        }
    }

    @Override
    public void delete(String userId, String userSe) {
        switch (userSe) {
            case "A" -> cmsUserDao.deleteAdminUser(userId);
            case "E" -> cmsUserDao.deleteTaskUser(userId);
            case "G" -> cmsUserDao.deleteGeneralUser(userId);
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        }

        cmsUserDao.deletePasswordByUserIdAndUserSe(userId, userSe);
    }

    private void insertPassword(String userId, String userSe, String rawPwd) {
        String encryptedPwd = egovPasswordEncoder.encryptPassword(rawPwd);
        CmsPasswordVO pwdVO = new CmsPasswordVO();
        pwdVO.setUserId(userId);
        pwdVO.setUserSe(userSe);
        pwdVO.setPwd(encryptedPwd);
        pwdVO.setUseYn("Y");
        cmsUserDao.insertPassword(pwdVO);
        insertPasswordHistory(userId, userSe, encryptedPwd);
    }

    @Transactional
    private void insertPasswordHistory(String userId, String userSe, String encryptedPwd) {
        CmsPwdHistVO histVO = new CmsPwdHistVO();
        histVO.setPwd(encryptedPwd);
        histVO.setUserSe(userSe);
        histVO.setPwdChgYmd(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")));
        histVO.setChgUserId(userId);
        histVO.setChgUserSe(userSe);
        cmsUserDao.insertPasswordHistory(histVO);
    }
}
