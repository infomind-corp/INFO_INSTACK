package infomind.instack.api.cms.manage.service.impl;

import infomind.instack.api.cms.manage.dao.ManageDao;
import infomind.instack.api.cms.manage.entity.CmsAdminUserVO;
import infomind.instack.api.cms.manage.entity.CmsPasswordVO;
import infomind.instack.api.cms.manage.entity.CmsTaskUserVO;
import infomind.instack.api.cms.manage.entity.CmsUserVO;
import infomind.instack.api.cms.manage.model.*;
import infomind.instack.api.cms.manage.service.ManageService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.model.PageResponse;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.crypto.EgovPasswordEncoder;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ManageServiceImpl extends EgovAbstractServiceImpl implements ManageService {

    private final ManageDao manageDao;
    private final EgovPasswordEncoder egovPasswordEncoder;

    @Override
    public PageResponse<UserListResponse> list(UserListRequest request) {
        return new PageResponse<>(manageDao.selectUserList(request), manageDao.countUserList(request), request);
    }

    @Override
    public void createAdmin(CreateAdminRequest request) {
        CmsAdminUserVO vo = new CmsAdminUserVO();
        BeanUtils.copyProperties(request, vo);
        vo.setUserId(request.getLoginId());
        vo.setAdmStsSe("ACTIVE");
        manageDao.insertAdminUser(vo);

        insertPassword(request.getLoginId(), "A", request.getPwd());
    }

    @Override
    public void createEmployee(CreateEmployeeRequest request) {
        CmsTaskUserVO vo = new CmsTaskUserVO();
        BeanUtils.copyProperties(request, vo);
        vo.setUserId(request.getLoginId());
        vo.setUserStsSe("ACTIVE");
        manageDao.insertTaskUser(vo);

        insertPassword(request.getLoginId(), "E", request.getPwd());
    }

    @Override
    public void createGeneral(CreateGeneralRequest request) {
        CmsUserVO vo = new CmsUserVO();
        BeanUtils.copyProperties(request, vo);
        vo.setUserId(request.getLoginId());
        vo.setUserStsSe("ACTIVE");
        vo.setEmlCertYn("N");
        vo.setTelnoCertYn("N");
        manageDao.insertGeneralUser(vo);

        insertPassword(request.getLoginId(), "G", request.getPwd());
    }

    @Override
    public void update(String id, UpdateUserRequest request) {
        String userSe = request.getUserSe();
        if (userSe == null) {
            throw new BizException("userSe는 필수입니다.", HttpStatus.BAD_REQUEST);
        }

        switch (userSe) {
            case "A" -> {
                CmsAdminUserVO vo = new CmsAdminUserVO();
                BeanUtils.copyProperties(request, vo);
                manageDao.updateAdminUser(id, vo);
            }
            case "E" -> {
                CmsTaskUserVO vo = new CmsTaskUserVO();
                BeanUtils.copyProperties(request, vo);
                manageDao.updateTaskUser(id, vo);
            }
            case "G" -> {
                CmsUserVO vo = new CmsUserVO();
                BeanUtils.copyProperties(request, vo);
                manageDao.updateGeneralUser(id, vo);
            }
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        }

        if (request.getPwd() != null && !request.getPwd().isBlank()) {
            CmsPasswordVO pwdVO = new CmsPasswordVO();
            pwdVO.setUserId(id);
            pwdVO.setUserSe(userSe);
            pwdVO.setPwd(egovPasswordEncoder.encryptPassword(request.getPwd()));
            manageDao.updatePassword(pwdVO);
        }
    }

    @Override
    public void delete(String id, String userSe) {
        if (userSe == null) {
            throw new BizException("userSe는 필수입니다.", HttpStatus.BAD_REQUEST);
        }

        switch (userSe) {
            case "A" -> manageDao.deleteAdminUser(id);
            case "E" -> manageDao.deleteTaskUser(id);
            case "G" -> manageDao.deleteGeneralUser(id);
            default -> throw new BizException("유효하지 않은 userSe 값입니다.", HttpStatus.BAD_REQUEST);
        }

        manageDao.deletePasswordByUserIdAndUserSe(id, userSe);
    }

    private void insertPassword(String userId, String userSe, String rawPwd) {
        CmsPasswordVO pwdVO = new CmsPasswordVO();
        pwdVO.setUserId(userId);
        pwdVO.setUserSe(userSe);
        pwdVO.setPwd(egovPasswordEncoder.encryptPassword(rawPwd));
        pwdVO.setUseYn("Y");
        manageDao.insertPassword(pwdVO);
    }
}
