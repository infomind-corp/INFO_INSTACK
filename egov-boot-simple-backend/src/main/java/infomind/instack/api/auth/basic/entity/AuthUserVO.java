package infomind.instack.api.auth.basic.entity;

import java.util.HashMap;
import java.util.Map;
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
public class AuthUserVO {

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

    public Map<String, Object> toClaims() {
      HashMap<String, Object> map = new HashMap<>();
      map.put("memberId", this.memberId);
      map.put("siteId", this.siteId);
      map.put("deptId", this.deptId);
      map.put("loginId", this.loginId);
      // map.put("memberName", this.memberName);
      // map.put("authLevel", this.authLevel);
      // map.put("email", this.email);

      return map;
    }
}
