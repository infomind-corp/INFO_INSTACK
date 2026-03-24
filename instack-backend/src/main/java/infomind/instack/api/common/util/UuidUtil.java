package infomind.instack.api.common.util;

import java.util.UUID;

/**
 * UUID 생성 유틸리티.
 * <p>{@code generate()}는 하이픈 포함 UUID, {@code generateCompact()}는 하이픈 없는 32자리 UUID를 반환한다.
 * 파일명, 시퀀스 대체 키 등 고유 식별자가 필요한 곳에서 사용한다.</p>
 */
public class UuidUtil {

    private UuidUtil() {}

    public static String generate() {
        return UUID.randomUUID().toString();
    }

    public static String generateCompact() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}