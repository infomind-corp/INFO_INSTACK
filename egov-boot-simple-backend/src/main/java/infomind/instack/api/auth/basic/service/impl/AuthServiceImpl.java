package infomind.instack.api.auth.basic.service.impl;

import infomind.instack.api.auth.basic.dao.AuthDao;
import infomind.instack.api.auth.basic.dao.RefreshTokenDao;
import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.auth.basic.entity.RefreshTokenVO;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.service.AuthService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.JwtUtil;
import java.util.Date;
import lombok.RequiredArgsConstructor;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.crypto.EgovPasswordEncoder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl extends EgovAbstractServiceImpl implements AuthService {

    private final AuthDao authDao;
    private final RefreshTokenDao refreshTokenDao;
    private final EgovPasswordEncoder egovPasswordEncoder;
    private final JwtUtil jwtUtil;
    @Value("${Globals.jwt.expiration}")
    private long accessTokenExpiration;
    @Value("${Globals.jwt.refreshExpiration}")
    private long refreshTokenExpireTime;

    @Override
    public LoginResponse login(LoginRequest request) {
        AuthUserVO user = authDao.selectAuthUserByLoginId(request.getLoginId())
                .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));

        if (!egovPasswordEncoder.checkPassword(request.getPassword(), user.getPassword())) {
            throw new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED);
        }

        return makeLoginResponse(user);
    }

    @Override
    public LoginResponse refresh(String token) {

        if (!jwtUtil.isValid(token)) {
          throw new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }
        RefreshTokenVO storedToken = refreshTokenDao.selectByMemberId(jwtUtil.getMemberIdFromToken(token))
            .orElseThrow(() -> new BizException("유효하지 않은 Refresh Token입니다.", HttpStatus.UNAUTHORIZED));

        if (storedToken.getExpiresAt().before(new Date())) {
          refreshTokenDao.deleteByMemberId(storedToken.getMemberId());
          throw new BizException("만료된 Refresh Token입니다.", HttpStatus.UNAUTHORIZED);
        }

        AuthUserVO user = authDao.selectAuthUserByMemberId(storedToken.getMemberId())
            .orElseThrow(() -> new BizException("사용자를 찾을 수 없습니다.", HttpStatus.UNAUTHORIZED));

        return makeLoginResponse(user);
    }

    private LoginResponse makeLoginResponse(AuthUserVO user) {
        String accessToken = jwtUtil.generateAccessToken(user);
        String refreshToken = jwtUtil.generateRefreshToken(user);

        RefreshTokenVO refreshTokenVO = new RefreshTokenVO();
        refreshTokenVO.setMemberId(user.getMemberId());
        refreshTokenVO.setToken(refreshToken);
        refreshTokenVO.setCreatedAt(new Date());
        refreshTokenVO.setExpiresAt(new Date(System.currentTimeMillis() + refreshTokenExpireTime));
        refreshTokenDao.merge(refreshTokenVO);

        LoginResponse response = new LoginResponse();
        response.setGrantType("Bearer");
        response.setAccessToken(accessToken);
        response.setRefreshToken(refreshToken);
        response.setAccessTokenExpiration(accessTokenExpiration);
        response.setRefreshTokenExpiration(refreshTokenExpireTime);
        return response;
    }

    @Override
    public void logout(String memberId) {
        // RefreshToken 삭제 등 필요 시 구현
        authDao.selectAuthUserByMemberId(memberId)
            .ifPresent(user -> refreshTokenDao.deleteByMemberId(user.getMemberId()));
    }
}