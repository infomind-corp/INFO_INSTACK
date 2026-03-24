package infomind.instack.api.common.aop;

import infomind.instack.api.auth.basic.entity.AuthUserVO;
import infomind.instack.api.common.util.AuditHolder;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 감사 컬럼 자동 채움 AOP.
 * <p>{@code *.service.impl.*} 메서드 진입 시 인증 사용자 ID, 클라이언트 IP, 서비스 메서드명을 수집하여
 * {@link infomind.instack.api.common.util.AuditHolder}에 저장한다.
 * 이후 {@link infomind.instack.api.common.entity.BaseAuditVO} 생성 시 이 값이 자동으로 감사 필드에 바인딩된다.</p>
 */
@Aspect
@Component
public class AuditAspect {

    @Around("execution(* infomind.instack.api.*.*.service.impl.*.*(..))")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        AuditHolder.set(new AuditHolder.Audit(resolveBy(), resolveIp(), resolvePgm(pjp)));
        try {
            return pjp.proceed();
        } finally {
            AuditHolder.clear();
        }
    }

    private String resolveBy() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getPrincipal() instanceof AuthUserVO user) {
            return user.getId();
        }
        return "SYSTEM";
    }

    private String resolveIp() {
        RequestAttributes attrs = RequestContextHolder.getRequestAttributes();
        if (attrs instanceof ServletRequestAttributes sra) {
            HttpServletRequest req = sra.getRequest();
            String[] headers = {"X-Forwarded-For", "X-Real-IP", "Proxy-Client-IP", "WL-Proxy-Client-IP"};
            for (String header : headers) {
                String ip = req.getHeader(header);
                if (ip != null && !ip.isBlank() && !"unknown".equalsIgnoreCase(ip)) {
                    return ip.split(",")[0].trim();
                }
            }
            return req.getRemoteAddr();
        }
        return "SYSTEM";
    }

    private String resolvePgm(ProceedingJoinPoint pjp) {
        String simpleName = pjp.getTarget().getClass().getSimpleName();
        if (simpleName.endsWith("Impl")) {
            simpleName = simpleName.substring(0, simpleName.length() - 4);
        }
        return simpleName + "." + pjp.getSignature().getName();
    }
}
