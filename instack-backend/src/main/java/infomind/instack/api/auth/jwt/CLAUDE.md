# DATABASE

## 연관 테이블
- `CMS_RF_TK` — Refresh Token 저장소 (PK: TK_ID)
- `CMS_USER` — 일반 사용자 (PK: USER_ID)
- `CMS_USER_TASK` — 업무 사용자 (PK: USER_ID)
- `CMS_USER_ADMIN` — 관리자 (PK: USER_ID)
- `CMS_PWD` — 비밀번호 저장소 (PK: USER_ID + USER_SE)
- `CMS_USER_AUTH` — 사용자 권한 정보 (PK: USER_ID + AUTH_CD + USER_SE)

## 필드
- `USER_SE` : `'A'` (관리자), `'E'` (업무사용자), `'G'` (일반사용자)

---

# 클래스 구조

## Entity

### `AuthUserVO`
JWT 클레임 생성 및 SecurityContext principal로 사용되는 사용자 정보 VO (BaseAuditVO 미상속)

| 필드 | 타입 | 설명 |
|------|------|------|
| id | String | 사용자 ID |
| siteCd | String | 사이트 코드 |
| userNm | String | 사용자명 |
| eml | String | 이메일 |
| mtelno | String | 휴대전화번호 |
| gndrSe | String | 성별 구분 |
| telno | String | 전화번호 |
| addr | String | 주소 |
| daddr | String | 상세주소 |
| ci | String | CI |
| di | String | DI |
| userSe | String | 사용자 구분 (A/E/G) — 로그인 시 직접 세팅 |
| authorities | List\<UserAuthority\> | 권한 목록 (CMS_USER_AUTH 조회) |

**주요 메서드**
- `toClaims()` — Access Token에 사용. 위 필드 전체를 Map으로 반환
- `toMinimalClaims()` — Refresh Token에 사용. `id`, `siteCd`, `userSe`만 포함

### `UserAuthority`
사용자 권한 정보 (CMS_USER_AUTH 행 단위)

| 필드 | 타입 | 설명 |
|------|------|------|
| siteCd | String | 사이트 코드 |
| authCd | String | 권한 코드 |
| authExpYmd | String | 권한 만료 일자 (yyyyMMdd) |
| authSe | String | 권한 구분 |

- `isExpired()` — 만료 여부 (만료일 없으면 유효로 간주)
- `isValid()` — 유효 여부 (`!isExpired()`)

### `RefreshTokenVO extends BaseAuditVO`
Refresh Token 저장소 VO (CMS_RF_TK 매핑)

| 필드 | 타입 | 설명 |
|------|------|------|
| tkId | String | 토큰 ID (PK) |
| userId | String | 사용자 ID |
| tk | String | Refresh Token 값 |
| tkExpDt | Date | 토큰 만료 일시 |
| rkvYn | String | 폐기 여부 |
| ipAddr | String | 클라이언트 IP |
| userAgt | String | User-Agent |

## Model

### `LoginRequest`
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| loginId | String | O | 로그인 ID |
| password | String | O | 비밀번호 |

### `LoginResponse`
| 필드 | 타입 | 설명 |
|------|------|------|
| grantType | String | 토큰 타입 (`"Bearer"`) |
| accessToken | String | Access Token |
| refreshToken | String | Refresh Token |
| accessTokenExpiration | Long | Access Token 유효기간 (ms) |
| refreshTokenExpiration | Long | Refresh Token 유효기간 (ms) |

### `RefreshRequest`
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| refreshToken | String | O | Refresh Token |

## DAO (`JwtAuthDao`)

```java
Optional<AuthUserVO> selectAdminUserByUserId(String userId);           // CMS_USER_ADMIN
Optional<AuthUserVO> selectTaskUserByUserId(String userId);            // CMS_USER_TASK
Optional<AuthUserVO> selectUserByUserId(String userId);                // CMS_USER
Optional<String>     selectPasswordByUserId(String userId, String userSe); // CMS_PWD
Optional<RefreshTokenVO> selectRefreshTokenByUserId(String userId);    // CMS_RF_TK
void insertRefreshToken(RefreshTokenVO vo);                            // CMS_RF_TK
void deleteRefreshTokenByUserId(String userId);                        // CMS_RF_TK
```

## Mapper XML
`src/main/resources/infomind/instack/api/auth/jwt/mapper/oracle/jwt_auth_oracle.xml`

---

# API 명세

## 1. 로그인
**POST** `/api/auth/jwt/{userSe}/login`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userSe | String | O | 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자) |

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| loginId | String | O | 로그인 ID |
| password | String | O | 비밀번호 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": {
    "grantType": "Bearer",
    "accessToken": "eyJhbGciOiJIUzM4NCJ9...",
    "refreshToken": "eyJhbGciOiJIUzM4NCJ9...",
    "accessTokenExpiration": 3600000,
    "refreshTokenExpiration": 604800000
  }
}
```

### Error Responses
- **400 Bad Request** — 유효하지 않은 userSe
- **401 Unauthorized** — 아이디 또는 비밀번호 불일치

### 테스트
```bash
curl -X POST http://localhost:8080/api/auth/jwt/A/login \
  -H "Content-Type: application/json" \
  -d '{"loginId":"admin","password":"****"}'
```

---

## 2. 토큰 갱신
**POST** `/api/auth/jwt/refresh`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| refreshToken | String | O | Refresh Token |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": {
    "grantType": "Bearer",
    "accessToken": "새로운_access_token",
    "refreshToken": "새로운_refresh_token",
    "accessTokenExpiration": 3600000,
    "refreshTokenExpiration": 604800000
  }
}
```

### Error Responses
- **401 Unauthorized** — 유효하지 않거나 만료된 Refresh Token

---

## 3. 로그아웃
**GET** `/api/auth/jwt/logout`

### Headers
| 헤더 | 값 |
|------|-----|
| Authorization | Bearer {accessToken} |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

---

# 인증 흐름

1. **POST** `/{userSe}/login` → loginId/password 전달
2. `JwtAuthServiceImpl.login(userSe, request)`
   - `userSe` 검증 (A/E/G 외 값 → 400 Bad Request)
   - `userSe`별 테이블에서 사용자 조회 (미존재 → 401 Unauthorized)
   - `CMS_PWD`에서 비밀번호 조회 (USER_ID + USER_SE 복합 조건)
   - `EgovPasswordEncoder`로 비밀번호 검증 (불일치 → 401 Unauthorized)
   - `authUserVO.setUserSe(userSe)` 직접 세팅 (DB 조회 값에 없음)
3. `makeLoginResponse(authUserVO)` — Access Token + Refresh Token 생성 후 CMS_RF_TK에 저장

---

# JWT 클레임 구성

## Access Token — `AuthUserVO.toClaims()`
| 클레임 | 타입 | 설명 |
|--------|------|------|
| id | String | 사용자 ID |
| siteCd | String | 사이트 코드 |
| userNm | String | 사용자명 |
| eml | String | 이메일 |
| mtelno | String | 휴대전화번호 |
| gndrSe | String | 성별 구분 |
| telno | String | 전화번호 |
| addr | String | 주소 |
| daddr | String | 상세주소 |
| ci | String | CI |
| di | String | DI |
| userSe | String | 사용자 구분 (A/E/G) — Spring Security role로 사용 |
| authorities | List\<UserAuthority\> | 권한 목록 (`siteCd`, `authCd`, `authExpYmd`, `authSe`) |

## Refresh Token — `AuthUserVO.toMinimalClaims()`
| 클레임 | 타입 | 설명 |
|--------|------|------|
| id | String | 사용자 ID |
| siteCd | String | 사이트 코드 |
| userSe | String | 사용자 구분 |
