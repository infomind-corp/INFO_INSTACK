package infomind.instack.api.common.aop;

import com.fasterxml.jackson.databind.ObjectMapper;
import infomind.instack.api.auth.jwt.entity.AuthUserVO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Arrays;
import java.util.List;

/**
 * 감사 로그 기록 AOP.
 * <p>{@link AuditLog} 어노테이션이 선언된 메서드 실행 전, 인증 사용자 ID / 클라이언트 IP / HTTP 요청 정보 / 메서드 인자를
 * {@code INFO} 레벨로 로깅한다. DB 감사 컬럼 처리와는 별개로 운영 감사 추적 목적으로 사용된다.</p>
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class AuditLogAspect {

    private final ObjectMapper objectMapper;

    @Before("@annotation(auditLog)")
    public void audit(JoinPoint joinPoint, AuditLog auditLog) {
        try {
            HttpServletRequest request = ((ServletRequestAttributes)
                    RequestContextHolder.currentRequestAttributes()).getRequest();

            String userId = resolveUserId();
            String httpMethod = request.getMethod();
            String url = request.getRequestURI();
            String ip = resolveClientIp(request);
            String action = auditLog.action();
            String className = joinPoint.getTarget().getClass().getSimpleName();
            String methodName = joinPoint.getSignature().getName();
            String args = serializeArgs(joinPoint.getArgs());

            log.info("[AUDIT] userId={} | {} {} | ip={} | {}.{} | action={} | args={}",
                    userId, httpMethod, url, ip, className, methodName, action, args);

        } catch (Exception e) {
            log.warn("[AUDIT] 감사 로그 기록 실패: {}", e.getMessage());
        }
    }

    private String resolveUserId() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getPrincipal() instanceof AuthUserVO authUserVO) {
            return authUserVO.getId();
        }
        return "anonymous";
    }

    private String resolveClientIp(HttpServletRequest request) {
        List<String> ipHeaders = Arrays.asList(
                "X-Forwarded-For", "X-Real-IP", "Proxy-Client-IP", "WL-Proxy-Client-IP"
        );
        for (String header : ipHeaders) {
            String ip = request.getHeader(header);
            if (ip != null && !ip.isBlank() && !"unknown".equalsIgnoreCase(ip)) {
                return ip.split(",")[0].trim();
            }
        }
        return request.getRemoteAddr();
    }

    private String serializeArgs(Object[] args) {
        try {
            if (args == null || args.length == 0) return "{}";
            if (args.length == 1) return objectMapper.writeValueAsString(args[0]);
            return objectMapper.writeValueAsString(args);
        } catch (Exception e) {
            return Arrays.toString(args);
        }
    }
}
