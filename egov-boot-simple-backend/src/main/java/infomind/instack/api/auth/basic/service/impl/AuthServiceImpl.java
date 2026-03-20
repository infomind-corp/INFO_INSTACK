package infomind.instack.api.auth.basic.service.impl;

import infomind.instack.api.auth.basic.dao.AuthDao;
import infomind.instack.api.auth.basic.entity.AuthUser;
import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;
import infomind.instack.api.auth.basic.service.AuthService;
import infomind.instack.api.common.exception.BizException;
import infomind.instack.api.common.util.JwtUtil;
import infomind.instack.api.common.util.jwt.EgovJwtTokenUtil;
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
    private final JwtUtil jwtUtil;
    private final EgovJwtTokenUtil egovJwtTokenUtil;
    private final EgovPasswordEncoder egovPasswordEncoder;
    @Value("${Globals.jwt.expiration}")
    private long accessTokenExpiration;
    @Value("${Globals.jwt.refreshExpiration}")
    private long refreshTokenExpireTime;

    @Override
    public LoginResponse login(LoginRequest request) {
        AuthUser user = authDao.selectByLoginId(request.getLoginId())
                .orElseThrow(() -> new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED));

        if (!egovPasswordEncoder.checkPassword(request.getPassword(), user.getPassword())) {
            throw new BizException("아이디 또는 비밀번호가 올바르지 않습니다.", HttpStatus.UNAUTHORIZED);
        }
        if (!"Y".equals(user.getUseYn())) {
            throw new BizException("사용이 중지된 계정입니다.", HttpStatus.UNAUTHORIZED);
        }

        String accessToken = jwtUtil.generateAccessToken(user);
        String refreshToken = jwtUtil.generateRefreshToken(user);
        authDao.mergeRefreshToken(user.getMemberId(), refreshToken);

        LoginResponse response = new LoginResponse();
        response.setGrantType("Bearer");
        response.setAccessToken(accessToken);
        response.setRefreshToken(refreshToken);
        response.setAccessTokenExpiration(accessTokenExpiration);
        response.setRefreshTokenExpiriation(refreshTokenExpireTime);
        return response;
    }

    @Override
    public void logout(String memberId) {
        // RefreshToken 삭제 등 필요 시 구현
    }
}