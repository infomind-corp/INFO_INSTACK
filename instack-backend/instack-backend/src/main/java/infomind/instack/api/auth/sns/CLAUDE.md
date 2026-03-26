# DATABASE
## 연관 테이블
- CMS_SNS_IF — SNS 연동 정보 저장소 (PK: SN)
- CMS_USER — 일반 사용자 (PK: USER_ID)
- CMS_USER_TASK — 업무 사용자 (PK: USER_ID)
- CMS_USER_ADMIN — 관리자 (PK: USER_ID)
- CMS_RF_TK — Refresh Token 저장소 (PK: TK_ID)

## 필드
- PRVD_NM : `google` / `kakao` / `naver` / `apple`
- USER_SE : 'A' (관리자), 'E' (업무사용자), 'G' (일반 사용자)
- LGN_AVL_YN : 'Y' (로그인 가능), 'N' (로그인 불가)
- USE_YN : 'Y' (활성화), 'N' (비활성화)

---

# Spec
## API : /api/auth/sns

| HTTP | 경로 | 설명 |
|------|------|------|
| POST | `/{provider}/callback` | SNS OAuth 콜백 처리 및 JWT 발급 (provider: google/kakao/naver/apple) |

## 요청 형식
```json
{
  "code": "authorization_code_from_sns",
  "state": "csrf_token",
  "userSe": "G"
}
```

## 응답 형식 (성공)
```json
{
  "grantType": "Bearer",
  "accessToken": "eyJhbGc...",
  "refreshToken": "eyJhbGc...",
  "accessTokenExpiration": 3600000,
  "refreshTokenExpiration": 7200000
}
```

---

# 구현 구조

## 인증 흐름
```
프론트 → SNS 로그인 페이지 → Authorization Code 획득
                ↓
프론트 → POST /api/auth/sns/{provider}/callback
                ↓
1. Authorization Code → SNS Access Token 교환
2. SNS Access Token → 사용자 정보 조회 (PRVD_UID, PRVD_EML)
3. CMS_SNS_IF에서 PRVD_NM + PRVD_UID로 연동 정보 조회
   - 미존재 → 403 Forbidden (연동 정보 없음)
   - LGN_AVL_YN='N' or USE_YN='N' → 401 Unauthorized
4. CMS_SNS_IF 업데이트 (ACC_TK, RF_TK, TK_EXP_DT, LST_LGN_DT, IF_IP)
5. USER_ID + USER_SE로 기존 사용자 조회 (CMS_USER_ADMIN/TASK/USER)
6. JWT 발급 (AccessToken + RefreshToken)
7. CMS_RF_TK에 RefreshToken 저장
                ↓
프론트 ← LoginResponse
```

## 파일 구성
```
auth/sns/
├── controller/
│   └── SnsAuthController            ← API 엔드포인트
├── service/
│   ├── SnsAuthService               ← 인터페이스
│   └── impl/
│       └── SnsAuthServiceImpl        ← 비즈니스 로직
├── dao/
│   └── SnsAuthDao                   ← MyBatis 인터페이스
├── entity/
│   └── SnsIfVO                      ← CMS_SNS_IF 매핑
├── model/
│   ├── SnsCallbackRequest           ← 콜백 요청
│   ├── SnsUserInfo                  ← SNS 사용자 정보
│   └── SnsTokenResponse             ← SNS 토큰 응답
└── provider/
    ├── SnsOAuthProvider             ← 인터페이스
    ├── GoogleOAuthProvider          ← Google OAuth 2.0
    ├── KakaoOAuthProvider           ← Kakao OAuth 2.0
    ├── NaverOAuthProvider           ← Naver OAuth 2.0
    └── AppleOAuthProvider           ← Apple Sign In
```

## Provider 별 구현 요점

### Google OAuth 2.0
- Token Endpoint: `https://oauth2.googleapis.com/token`
- UserInfo Endpoint: `https://www.googleapis.com/oauth2/v3/userinfo`
- 인증: Bearer Token 헤더
- 사용자 ID: `sub` 필드

### Kakao OAuth 2.0
- Token Endpoint: `https://kauth.kakao.com/oauth/token`
- UserInfo Endpoint: `https://kapi.kakao.com/v2/user/me`
- 인증: Bearer Token 헤더
- 사용자 ID: `id` 필드 (최상단)
- 사용자 정보: `kakao_account` 중첩 객체

### Naver OAuth 2.0
- Token Endpoint: `https://nid.naver.com/oauth2.0/token`
- UserInfo Endpoint: `https://openapi.naver.com/v1/nid/me`
- 인증: Bearer Token 헤더 또는 Basic Auth
- 사용자 정보: `response` 중첩 객체

### Apple Sign In
- Token Endpoint: `https://appleid.apple.com/auth/token`
- Client Secret: JWT 직접 생성 (EC/ES256 알고리즘)
- 사용자 정보: `id_token` (JWT) 페이로드에서 추출
- 서명 검증: Apple 공개키 필요 (선택사항, 현재는 생략)
- 사용자 ID: id_token의 `sub` 필드

## DAO 메서드

| 메서드 | 설명 |
|---|---|
| `selectSnsIfByProviderKey(prvdNm, prvdUid)` | PRVD_NM + PRVD_UID로 연동 정보 조회 |
| `updateSnsIfOnLogin(SnsIfVO)` | 로그인 시 토큰 및 로그인 일시 업데이트 |
| `insertSnsIf(SnsIfVO)` | 신규 연동 정보 등록 (선택사항) |

## Service 메서드

| 메서드 | 설명 |
|---|---|
| `handleCallback(provider, request)` | SNS OAuth 콜백 처리 및 JWT 발급 |

## JWT 토큰 발급 (JwtAuthDao 재사용)
- JwtUtil을 통해 AccessToken / RefreshToken 생성
- 기존 사용자의 RefreshToken을 DB에서 삭제 (단일 세션 정책)
- 새 RefreshToken을 CMS_RF_TK에 저장
- LoginResponse 반환 (Bearer, AccessToken, RefreshToken, 만료시간)

---

# application.properties 설정

```properties
# Google
Sns.google.clientId=YOUR_CLIENT_ID
Sns.google.clientSecret=YOUR_CLIENT_SECRET
Sns.google.callbackUrl=http://localhost:3000/login/google/callback

# Kakao
Sns.kakao.clientId=YOUR_CLIENT_ID
Sns.kakao.callbackUrl=http://localhost:3000/login/kakao/callback

# Naver
Sns.naver.clientId=YOUR_CLIENT_ID
Sns.naver.clientSecret=YOUR_CLIENT_SECRET
Sns.naver.callbackUrl=http://localhost:3000/login/naver/callback

# Apple
Sns.apple.clientId=YOUR_SERVICE_ID
Sns.apple.teamId=YOUR_TEAM_ID
Sns.apple.keyId=YOUR_KEY_ID
Sns.apple.privateKey=YOUR_PRIVATE_KEY_PKCS8
Sns.apple.callbackUrl=http://localhost:3000/login/apple/callback
```

---

# 에러 처리

| HTTP | 상황 | 메시지 |
|------|------|--------|
| 400 | provider 미지원 | 지원하지 않는 SNS 공급자: {provider} |
| 400 | 토큰 교환 실패 | {provider} 토큰 교환 실패 |
| 400 | 사용자 정보 조회 실패 | {provider} 사용자 정보 조회 실패 |
| 401 | 로그인 불가 계정 | 로그인이 비허용된 계정입니다 |
| 401 | 사용자 미존재 | 사용자 정보가 없습니다 |
| 403 | 연동 정보 없음 | 연동 정보가 없습니다. 관리자에게 문의하세요. |

---

# 주요 설계 결정

## OAuth2 Client 라이브러리 미사용
- pom.xml에 `spring-boot-starter-oauth2-client` 없음
- RestTemplate을 직접 사용하여 각 Provider API 호출
- 간결한 구현과 명시적인 흐름 관리

## JwtUtil + JwtAuthDao 재사용
- 기존 JWT 발급 로직과 동일한 메커니즘 활용
- RefreshToken 저장/관리 일관성 유지
- `JwtAuthServiceImpl.makeLoginResponse` 로직 복제 (private 메서드이므로)

## 사용자 조회 재사용
- JwtAuthDao의 `selectAdminUserByUserId`, `selectTaskUserByUserId`, `selectUserByUserId` 재사용
- USER_SE에 따른 분기 처리 (A/E/G)
- 권한 정보 포함 조회 (LEFT JOIN CMS_USER_AUTH)

---

# 테스트 가이드

## 1. CMS_SNS_IF 테스트 레코드 생성
```sql
INSERT INTO INS_APP.CMS_SNS_IF (
    SN, USER_ID, USER_SE, PRVD_NM, PRVD_UID, PRVD_EML,
    LGN_AVL_YN, USE_YN, CRT_BY, CRT_IP, CRT_PGM, CRT_AT,
    UPD_BY, UPD_IP, UPD_PGM, UPD_AT
) VALUES (
    1, 'test_user', 'G', 'google', 'google_uid_12345', 'test@gmail.com',
    'Y', 'Y', 'ADMIN', '127.0.0.1', 'INSERT_TEST', SYSDATE,
    'ADMIN', '127.0.0.1', 'INSERT_TEST', SYSDATE
);
```

## 2. 각 Provider별 테스트
- Google: https://console.cloud.google.com/ 에서 OAuth 2.0 클라이언트 생성
- Kakao: https://developers.kakao.com/ 에서 앱 생성
- Naver: https://developers.naver.com/ 에서 앱 생성
- Apple: https://developer.apple.com/ 에서 Sign In with Apple 설정

## 3. API 테스트
```bash
curl -X POST http://localhost:8080/api/auth/sns/google/callback \
  -H "Content-Type: application/json" \
  -d '{
    "code": "authorization_code_from_google",
    "state": "csrf_token",
    "userSe": "G"
  }'
```

## 4. Swagger UI 확인
- http://localhost:8080/swagger-ui.html
- `/api/auth/sns/{provider}/callback` 엔드포인트 확인
