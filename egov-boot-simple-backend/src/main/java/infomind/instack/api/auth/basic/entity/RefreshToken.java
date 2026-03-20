package infomind.instack.api.auth.basic.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

 import java.util.Date;

/**
 * REFRESH_TOKEN 테이블 매핑 엔티티
 */
@Getter
@Setter
@NoArgsConstructor
public class RefreshToken {

    private String memberId;
    private String token;
    private Date expiresAt;
    private Date createdAt;
}