package infomind.instack.api.common.util;

/**
 * 감사 정보 ThreadLocal 홀더.
 * <p>{@link infomind.instack.api.common.aop.AuditAspect}가 수집한 감사 정보(작성자 ID, 클라이언트 IP, 프로그램명)를
 * 요청 스레드 내에서 공유하기 위한 저장소. 요청 처리 완료 후 반드시 {@code clear()}로 정리된다.</p>
 */
public class AuditHolder {

    public record Audit(String by, String ip, String pgm) {
        static final Audit SYSTEM = new Audit("SYSTEM", "SYSTEM", "SYSTEM");
    }

    private static final ThreadLocal<Audit> holder = new ThreadLocal<>();

    public static void set(Audit audit) { holder.set(audit); }
    public static Audit get() { return holder.get() != null ? holder.get() : Audit.SYSTEM; }
    public static void clear() { holder.remove(); }
}
