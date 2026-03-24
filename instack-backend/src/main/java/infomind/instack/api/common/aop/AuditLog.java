package infomind.instack.api.common.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 감사 로그 기록 어노테이션.
 * <p>컨트롤러 메서드에 선언하면 {@link AuditLogAspect}가 호출자 정보(사용자 ID, IP, HTTP 메서드, URL, 인자값)를
 * 로그로 기록한다. {@code action} 속성으로 수행 동작을 명시할 수 있다.</p>
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuditLog {
    String action() default "";
}
