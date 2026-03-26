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

/**
 * CMS 사용자 서비스 구현.
 * <p>관리자, 업무사용자, 일반사용자의 생성, 수정, 삭제 및 비밀번호 관리</p>
 */
@Service
@RequiredArgsConstructor
public class CmsUserServiceImpl extends EgovAbstractServiceImpl implements CmsUserService {

    private final CmsUserDao cmsUserDao;
    private final EgovPasswordEncoder egovPasswordEncoder;

    /**
     * 사용자 목록을 페이지네이션하여 조회한다.
     *
     * @param request 사용자 목록 조회 요청 (페이지, 검색 조건)
     * @return 페이지 응답 (사용자 목록, 전체 건수)
     */
    @Override
    public PageResponse<UserListResponse> list(UserListRequest request) {
        return new PageResponse<>(cmsUserDao.selectUserList(request), cmsUserDao.countUserList(request), request);
    }

    /**
     * 사용자를 단건 조회한다.
     * 사용자 구분(userSe)에 따라 해당 테이블에서 조회한다.
     *
     * @param userId 사용자 ID
     * @param userSe 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @return 사용자 상세 정보
     * @throws BizException 사용자 구분이 유효하지 않거나 사용자를 찾을 수 없는 경우
     */
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

    /**
     * 사용자를 생성한다.
     * 사용자 구분에 따라 해당 테이블에 저장하고, 비밀번호를 암호화하여 저장한다.
     *
     * @param userSe  사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @param request 사용자 생성 요청
     * @throws BizException 사용자 구분이 유효하지 않은 경우
     */
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

    /**
     * 사용자 정보를 수정한다.
     * 비밀번호가 전달되면 암호화하여 저장하고 비밀번호 이력을 기록한다.
     *
     * @param userSe  사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @param userId  수정할 사용자 ID
     * @param request 사용자 수정 요청
     * @throws BizException 사용자 구분이 유효하지 않은 경우
     */
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

    /**
     * 사용자를 삭제한다.
     * 사용자 정보와 비밀번호 정보를 함께 삭제한다.
     *
     * @param userId 삭제할 사용자 ID
     * @param userSe 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @throws BizException 사용자 구분이 유효하지 않은 경우
     */
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
