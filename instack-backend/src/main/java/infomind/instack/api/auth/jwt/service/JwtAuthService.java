package infomind.instack.api.auth.jwt.service;

import infomind.instack.api.auth.jwt.model.LoginRequest;
import infomind.instack.api.auth.jwt.model.LoginResponse;
import infomind.instack.api.auth.jwt.model.RefreshRequest;

/**
 * 통합 JWT 인증 서비스 인터페이스
 * <p>사용자 구분(userSe)에 따라 각 테이블에서 사용자를 조회하여 JWT 토큰 발급</p>
 */
public interface JwtAuthService {

    /**
     * 사용자 구분별 로그인
     * @param userSe 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자)
     * @param request 로그인 요청 (loginId, password)
     * @return JWT 토큰 응답
     */
    LoginResponse login(String userSe, LoginRequest request);

    /**
     * Refresh Token으로 새 Access Token 발급
     * @param request Refresh Token 요청
     * @return 새로운 JWT 토큰 응답
     */
    LoginResponse refresh(RefreshRequest request);

    /**
     * 로그아웃 (Refresh Token 삭제)
     * @param userId 사용자 ID
     */
    void logout(String userId);
}
