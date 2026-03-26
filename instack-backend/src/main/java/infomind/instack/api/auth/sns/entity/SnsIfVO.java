package infomind.instack.api.auth.sns.entity;

import infomind.instack.api.common.entity.BaseAuditVO;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 * CMS_SNS_IF 테이블 매핑 VO
 * SNS 연동 정보 저장소
 */
@Getter
@Setter
public class SnsIfVO extends BaseAuditVO {
    private Long sn;              // 일련번호 (PK)
    private String userId;        // 사용자 아이디
    private String userSe;        // 사용자 구분 (A/E/G)
    private String prvdNm;        // 공급자명 (google/kakao/naver/apple)
    private String prvdUid;       // 공급자 UID
    private String prvdEml;       // 공급자 이메일
    private String ifDesc;        // 추가 정보
    private String accTk;         // Access Token (암호화)
    private String rfTk;          // Refresh Token (암호화)
    private Date tkExpDt;         // 토큰 만료 일시
    private String mainLgnYn;     // 주요 로그인 방식 여부 (Y/N)
    private String lgnAvlYn;      // 로그인 가능 여부 (Y/N)
    private Date lstLgnDt;        // 최종 로그인 일시
    private String useYn;         // 활성화 여부 (Y/N)
    private Date ifFstDt;         // 연동 최초 일시
    private Date ifEndDt;         // 연동 종료 일시
    private String ifIp;          // 연동 아이피
}
