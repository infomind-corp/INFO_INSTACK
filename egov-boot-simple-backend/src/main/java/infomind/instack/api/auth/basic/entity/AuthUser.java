package infomind.instack.api.auth.basic.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

/**
 * MEMBER 테이블 매핑 엔티티
 */
@Getter
@Setter
@NoArgsConstructor
public class AuthUser {

    private String memberId;
    private String siteId;
    private String loginId;
    private String password;
    private String memberName;
    private String authLevel;
    private String email;
    private String useYn;
    private Date regDt;
    private Date modDt;
    private String regUser;
    private String deptId;
}
