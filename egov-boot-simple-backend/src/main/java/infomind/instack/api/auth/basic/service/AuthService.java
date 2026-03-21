package infomind.instack.api.auth.basic.service;

import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;

public interface AuthService {

    LoginResponse login(LoginRequest request);

  LoginResponse refresh(String refreshToken);

  void logout(String memberId);
}