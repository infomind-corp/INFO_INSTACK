package infomind.instack.api.common.util.jwt;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.ResponseCode;
import egovframework.com.cmm.service.ResultVO;

/**
 * JWT 인증 실패 진입점 (eGov 레거시).
 * <p>인증되지 않은 요청이 보호된 리소스에 접근할 때 {@code 401 Unauthorized}와 eGov {@code ResultVO} 형식의 오류 응답을 반환한다.</p>
 */
@Component
public class JwtAuthenticationEntryPoint implements AuthenticationEntryPoint {


    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {

        ResultVO resultVO = new ResultVO();
        resultVO.setResultCode(ResponseCode.AUTH_ERROR.getCode());
        resultVO.setResultMessage(ResponseCode.AUTH_ERROR.getMessage());
        ObjectMapper mapper = new ObjectMapper();

        //Convert object to JSON string
        String jsonInString = mapper.writeValueAsString(resultVO);



        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        response.setContentType(MediaType.APPLICATION_JSON.toString());
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(jsonInString);

    }
}