package infomind.instack.api.auth.jwt.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AuthUserVO {

    private String id;
    private String siteCd;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String ci;
    private String di;
    private String userSe;
    private List<UserAuthority> authorities;

    public Map<String, Object> toClaims() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", this.id);
        map.put("siteCd", this.siteCd);
        map.put("userNm", this.userNm);
        map.put("eml", this.eml);
        map.put("mtelno", this.mtelno);
        map.put("gndrSe", this.gndrSe);
        map.put("telno", this.telno);
        map.put("addr", this.addr);
        map.put("daddr", this.daddr);
        map.put("ci", this.ci);
        map.put("di", this.di);
        map.put("userSe", this.userSe);
        map.put("authorities", this.authorities);
        return map;
    }

    public Map<String, Object> toMinimalClaims() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", this.id);
        map.put("siteCd", this.siteCd);
        map.put("userSe", this.userSe);
        return map;
    }
}
