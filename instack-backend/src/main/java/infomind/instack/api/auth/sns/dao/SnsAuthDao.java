package infomind.instack.api.auth.sns.dao;

import infomind.instack.api.auth.sns.entity.SnsIfVO;
import egovframework.rte.psl.dataaccess.mapper.EgovMapper;
import org.apache.ibatis.annotations.Param;
import java.util.Optional;

/**
 * SNS 연동 정보 DAO
 */
@EgovMapper("SnsAuthDao")
public interface SnsAuthDao {
    /**
     * 공급자 키로 SNS 연동 정보 조회
     */
    Optional<SnsIfVO> selectSnsIfByProviderKey(
        @Param("prvdNm") String prvdNm,
        @Param("prvdUid") String prvdUid
    );

    /**
     * SNS 연동 정보 업데이트 (로그인 시 - 토큰 및 로그인 일시)
     */
    void updateSnsIfOnLogin(SnsIfVO vo);

    /**
     * SNS 연동 정보 신규 등록
     */
    void insertSnsIf(SnsIfVO vo);
}
