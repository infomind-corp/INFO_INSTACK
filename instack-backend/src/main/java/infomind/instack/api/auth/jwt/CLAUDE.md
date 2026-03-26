# DATABASE
## 연관 테이블
- CMS_RF_TK — Refresh Token 저장소 (PK: TK_ID)
- CMS_USER — 일반 사용자 (PK: USER_ID)
- CMS_USER_TASK — 업무 사용자 (PK: USER_ID)
- CMS_USER_ADMIN — 관리자 (PK: USER_ID)
- CMS_PWD — 비밀번호 저장소 (PK: USER_ID + USER_SE)
- CMS_USER_AUTH - 사용자 권한 정보 (PK: USER_ID + AUTH_CD + USER_SE)

## 필드
- USER_SE : 'A' (관리자), 'E' (업무사용자), 'G' (일반 사용자)

---

# API 명세

## 1. 로그인
**POST** `/api/auth/jwt/{userSe}/login`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 | 값 |
|---------|------|------|------|-----|
| userSe | String | O | 사용자 구분 | A=관리자, E=업무사용자, G=일반사용자 |

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
    "accessToken": "eyJhbGciOiJIUzM4NCJ9...",
    "refreshToken": "eyJhbGciOiJIUzM4NCJ9...",
    "userInfo": {
      "id": "admin",
      "userNm": "홍길동",
      "eml": "admin@example.com",
      "gndrSe": "M",
      "telno": "0212345678",
      "userSe": "A",
      "mtelno": "01012345678",
      "addr": "서울시",
      "daddr": "강남구"
    }
  }
}
```

### Error Responses
- **400 Bad Request** - 유효하지 않은 userSe
- **401 Unauthorized** - 아이디 또는 비밀번호 불일치

### 테스트
```bash
curl -X POST http://localhost:8080/api/auth/jwt/A/login \
  -H "Content-Type: application/json" \
  -d '{"loginId":"admin","password":"info4787@@"}'
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
    "accessToken": "새로운_access_token",
    "refreshToken": "새로운_refresh_token"
  }
}
```

### Error Responses
- **401 Unauthorized** - 유효하지 않거나 만료된 Refresh Token

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

1. POST `/{userSe}/login` → loginId/password 전달
2. `JwtAuthServiceImpl.login(userSe, request)`
   - userSe 검증 (A/E/G 외 값 → 400 Bad Request)
   - userSe별 테이블에서 사용자 조회 (미존재 → 401 Unauthorized)
   - CMS_PWD에서 비밀번호 조회 (USER_ID + USER_SE 복합 조건)
   - 비밀번호 검증 (불일치 → 401 Unauthorized)
3. JWT 토큰 생성 (AccessToken + RefreshToken)
4. Refresh Token 저장 (CMS_RF_TK)

## JWT 클레임 구성
- `id`: 사용자 ID
- `userSe`: A/E/G (Spring Security role로 사용)
- `userNm`, `eml`, `mtelno`, `gndrSe`, `telno`, `addr`, `daddr`, `ci`, `di`
- `authCd` : 권한 코드 (CMS_USER_AUTH에서 조회하여 콤마로 구분된 문자열로 저장)
- `siteCd` : 사이트 코드 (CMS_USER에서 조회하여 저장)
- `authExpYmd` : 권한 만료 일자 (CMS_USER_AUTH에서 조회하여 저장)
- `authSe` : 권한 구분 (CMS_USER_AUTH에서 조회하여 저장)
