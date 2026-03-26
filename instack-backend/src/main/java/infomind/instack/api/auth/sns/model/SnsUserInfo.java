package infomind.instack.api.auth.sns.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * SNS 공급자로부터 조회한 사용자 정보
 */
@Getter
@Setter
public class SnsUserInfo {
    private String id;            // 공급자 UID (sub, id, response.id 등 provider별)
    private String email;         // 이메일
    private String name;          // 사용자명
    private String picture;       // 프로필 이미지 URL

    // Kakao 응답용
    @JsonProperty("kakao_account")
    private KakaoAccount kakaoAccount;

    @Getter
    @Setter
    public static class KakaoAccount {
        private String email;
        private Profile profile;

        @Getter
        @Setter
        public static class Profile {
            private String nickname;
            private String profile_image_url;
        }
    }

    // Naver 응답용
    @JsonProperty("response")
    private NaverResponse naverResponse;

    @Getter
    @Setter
    public static class NaverResponse {
        private String id;
        private String email;
        private String name;
        private String profile_image;
    }
}
