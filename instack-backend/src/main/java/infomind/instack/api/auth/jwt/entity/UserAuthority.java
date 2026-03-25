package infomind.instack.api.auth.jwt.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * 사용자 권한 정보
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserAuthority {

    private String siteCd;
    private String authCd;
    private String authExpYmd;
    private String authSe;

    /**
     * 권한 만료 여부 확인
     * @return true: 만료됨, false: 유효함 (만료일자가 없으면 유효함으로 간주)
     */
    public boolean isExpired() {
        if (authExpYmd == null || authExpYmd.trim().isEmpty()) {
            return false; // 만료 일자 없으면 유효
        }

        try {
            LocalDate expDate = LocalDate.parse(authExpYmd, DateTimeFormatter.ofPattern("yyyyMMdd"));
            LocalDate today = LocalDate.now();
            return expDate.isBefore(today); // 만료일 < 오늘 = 만료됨
        } catch (Exception e) {
            return false; // 파싱 실패 시 유효한 것으로 간주
        }
    }

    /**
     * 권한 유효 여부 확인
     * @return true: 유효, false: 만료됨
     */
    public boolean isValid() {
        return !isExpired();
    }
}
