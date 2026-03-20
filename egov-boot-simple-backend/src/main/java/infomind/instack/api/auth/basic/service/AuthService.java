package infomind.instack.api.auth.basic.service;

import infomind.instack.api.auth.basic.model.LoginRequest;
import infomind.instack.api.auth.basic.model.LoginResponse;

public interface AuthService {

    LoginResponse login(LoginRequest request);

    void logout(String memberId);
}