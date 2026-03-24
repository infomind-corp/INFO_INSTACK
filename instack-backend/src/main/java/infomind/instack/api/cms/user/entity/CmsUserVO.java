package infomind.instack.api.cms.user.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmsUserVO extends BaseAuditVO {

    private String userId;
    private String userNm;
    private String mtelno;
    private String telno;
    private String gndrSe;
    private String eml;
    private String addr;
    private String daddr;
    private String zip;
    private String accExpYmd;
    private String emlCertYn;
    private String telnoCertYn;
    private String userStsSe;
    private String ci;
    private String di;
}
