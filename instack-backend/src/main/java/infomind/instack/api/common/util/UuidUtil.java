package infomind.instack.api.common.util;

import java.util.UUID;

public class UuidUtil {

    private UuidUtil() {}

    public static String generate() {
        return UUID.randomUUID().toString();
    }

    public static String generateCompact() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}