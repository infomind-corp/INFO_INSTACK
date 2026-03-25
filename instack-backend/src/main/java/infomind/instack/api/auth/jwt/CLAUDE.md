# DATABASE
## 연관 테이블
- CMS_RF_TK — Refresh Token 저장소 (PK: TK_ID)
- CMS_USER — 일반 사용자 (PK: USER_ID)
- CMS_USER_TASK — 업무 사용자 (PK: USER_ID)
- CMS_USER_ADMIN — 관리자 (PK: USER_ID)
- CMS_PWD — 비밀번호 저장소 (PK: USER_ID + USER_SE)

## 필드
- USER_SE : 'A' (관리자), 'E' (업무사용자), 'G' (일반 사용자)

---

# Spec
## API : /api/auth/jwt

| HTTP | 경로 | 설명 |
|------|------|------|
| POST | `/{userSe}/login` | 사용자 구분별 로그인 (userSe: A/E/G) |
| POST | `/refresh` | Refresh Token으로 새 Access Token 발급 |
| GET | `/logout` | Refresh Token 삭제 |

---

# 구현 구조

## 사용자 조회 로직
- userSe='A': `CMS_USER_ADMIN` 테이블에서 조회
- userSe='E': `CMS_USER_TASK` 테이블에서 조회
- userSe='G': `CMS_USER` 테이블에서 조회

## 파일 구성
```
controller/
  └── JwtAuthController      ← API 엔드포인트
service/
  ├── JwtAuthService         ← 인터페이스
  └── impl/
      └── JwtAuthServiceImpl  ← 비즈니스 로직 (userSe 분기 처리)
dao/
  └── JwtAuthDao             ← MyBatis 인터페이스
mapper/oracle/
  └── jwtAuth_oracle.xml     ← 쿼리 정의
```

## 인증 흐름
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
