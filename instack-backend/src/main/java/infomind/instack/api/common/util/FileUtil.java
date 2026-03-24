package infomind.instack.api.common.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 파일 처리 유틸리티.
 * <p>파일 확장자 추출, UUID 기반 저장 파일명 생성, 디렉터리 자동 생성 후 파일 저장 기능을 제공한다.</p>
 */
public class FileUtil {

    private FileUtil() {}

    public static String getExtension(String filename) {
        if (filename == null || !filename.contains(".")) return "";
        return filename.substring(filename.lastIndexOf('.') + 1).toLowerCase();
    }

    public static String buildSaveName(String originalFilename) {
        return UuidUtil.generateCompact() + "." + getExtension(originalFilename);
    }

    public static Path save(MultipartFile file, String uploadDir) throws IOException {
        Path dir = Paths.get(uploadDir);
        if (!Files.exists(dir)) {
            Files.createDirectories(dir);
        }
        String saveName = buildSaveName(file.getOriginalFilename());
        Path target = dir.resolve(saveName);
        file.transferTo(target);
        return target;
    }
}