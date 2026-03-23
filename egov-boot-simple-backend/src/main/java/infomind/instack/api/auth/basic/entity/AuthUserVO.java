package infomind.instack.api.auth.basic.entity;

import java.util.HashMap;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class AuthUserVO {

    private String id;
    private String userNm;
    private String eml;
    private String mtelno;
    private String gndrSe;
    private String telno;
    private String addr;
    private String daddr;
    private String deptCd;
    private String orgCd;
    private String ci;
    private String di;
    private String userSe;

    public Map<String, Object> toClaims() {
      HashMap<String, Object> map = new HashMap<>();
      map.put("id", this.id);
      map.put("userNm", this.userNm);
      map.put("eml", this.eml);
      map.put("mtelno", this.mtelno);
      map.put("gndrSe", this.gndrSe);
      map.put("telno", this.telno);
      map.put("addr", this.addr);
      map.put("daddr", this.daddr);
      map.put("deptCd", this.deptCd);
      map.put("orgCd", this.orgCd);
      map.put("ci", this.ci);
      map.put("di", this.di);
      map.put("userSe", this.userSe);

      return map;
    }
}
