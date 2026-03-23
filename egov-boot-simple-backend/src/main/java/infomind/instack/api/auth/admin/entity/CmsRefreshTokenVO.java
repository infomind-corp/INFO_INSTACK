package infomind.instack.api.auth.admin.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * CMS_REFRESH_TOKEN 테이블 매핑 엔티티
 */
@Getter
@Setter
public class CmsRefreshTokenVO {

    private String tkId;
    private String userId;
    private String tk;
    private Date expDt;
    private String rkvYn;
}
