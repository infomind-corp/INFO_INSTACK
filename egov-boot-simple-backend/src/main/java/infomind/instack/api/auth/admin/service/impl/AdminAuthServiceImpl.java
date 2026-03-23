package infomind.instack.api.auth.admin.service.impl;

import infomind.instack.api.auth.admin.dao.AdminAuthDao;
import infomind.instack.api.auth.admin.entity.CmsRefreshTokenVO;
import infomind.instack.api.auth.admin.service.AdminAuthService;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.model.RefreshRequest;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.JwtUtil;
import infomind.instack.api.common.util.UuidUtil;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.crypto.EgovPasswordEncoder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
@RequiredArgsConstructor
public class AdminAuthServiceImpl extends EgovAbstractServiceImpl implements AdminAuthService {

    private final AdminAuthDao adminAuthDao;
    private final EgovPasswordEncoder egovPasswordEncoder;
    private final JwtUtil jwtUtil;

    @Value("${Globals.jwt.expiration}")
    private long accessTokenExpiration;

    @Value("${Globals.jwt.refreshExpiration}")
    private long refreshTokenExpireTime;

    @Override
    public LoginResponse login(LoginRequest request) {
        AuthUserVO authUserVO = adminAuthDao.selectAdminUserByAdmId(request.getLoginId())
                .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));

        String pwd = adminAuthDao.selectPasswordByAdmId(request.getLoginId())
                .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));

        if (!egovPasswordEncoder.checkPassword(request.getPassword(), pwd)) {
            throw new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED);
        }

        return makeLoginResponse(authUserVO);
    }

    @Override
    public LoginResponse refresh(RefreshRequest request) {
        if (!jwtUtil.isValid(request.getRefreshToken())) {
            throw new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }

        String admId = jwtUtil.getIdFromToken(request.getRefreshToken());
        CmsRefreshTokenVO storedToken = adminAuthDao.selectRefreshTokenByUserId(admId)
                .orElseThrow(() -> new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED));

        if (storedToken.getExpDt().before(new Date())) {
            adminAuthDao.deleteRefreshTokenByUserId(admId);
            throw new BizException("만료된 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }

        AuthUserVO authUserVO = adminAuthDao.selectAdminUserByAdmId(admId)
                .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.UNAUTHORIZED));

        return makeLoginResponse(authUserVO);
    }

    @Override
    public void logout(String admId) {
        adminAuthDao.deleteRefreshTokenByUserId(admId);
    }

    private LoginResponse makeLoginResponse(AuthUserVO authUserVO) {
        String accessToken = jwtUtil.generateAccessToken(authUserVO);
        String refreshToken = jwtUtil.generateRefreshToken(authUserVO);

        adminAuthDao.deleteRefreshTokenByUserId(authUserVO.getId());

        CmsRefreshTokenVO refreshTokenVO = new CmsRefreshTokenVO();
        refreshTokenVO.setTkId(UuidUtil.generateCompact());
        refreshTokenVO.setUserId(authUserVO.getId());
        refreshTokenVO.setTk(refreshToken);
        refreshTokenVO.setExpDt(new Date(System.currentTimeMillis() + refreshTokenExpireTime));
        refreshTokenVO.setRkvYn("N");
        adminAuthDao.insertRefreshToken(refreshTokenVO);

        LoginResponse loginResponse = new LoginResponse();
        loginResponse.setGrantType("Bearer");
        loginResponse.setAccessToken(accessToken);
        loginResponse.setRefreshToken(refreshToken);
        loginResponse.setAccessTokenExpiration(accessTokenExpiration);
        loginResponse.setRefreshTokenExpiration(refreshTokenExpireTime);
        return loginResponse;
    }
}
