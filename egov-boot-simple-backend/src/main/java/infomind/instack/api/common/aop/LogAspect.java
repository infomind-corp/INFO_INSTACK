package infomind.instack.api.common.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class LogAspect {

    @Around("execution(* infomind.instack.api..controller..*(..))")
    public Object logController(ProceedingJoinPoint pjp) throws Throwable {
        String method = pjp.getSignature().toShortString();
        log.debug("[REQ] {}", method);
        long start = System.currentTimeMillis();
        try {
            Object result = pjp.proceed();
            log.debug("[RES] {} ({}ms)", method, System.currentTimeMillis() - start);
            return result;
        } catch (Throwable t) {
            log.error("[ERR] {} - {}", method, t.getMessage());
            throw t;
        }
    }
}