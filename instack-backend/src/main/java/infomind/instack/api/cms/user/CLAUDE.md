# DATABASE
## 연관 테이블
- CMS_USER (PK: USER_ID) - 일반 사용자
- CMS_USER_TASK (PK: USER_ID) - 업무 사용자
- CMS_USER_ADMIN (PK: USER_ID) - 관리자
- CMS_PWD (PK: USER_ID + USER_SE) - 비밀번호 저장소
- CMS_USER_AUTH (PK: USER_ID + AUTH_CD + USER_SE) - 사용자 권한 정보

## 기능
- CMS 사용자(관리자, 업무사용자, 일반사용자) 관리
- 사용자 생성, 수정, 삭제
- 사용자별 인증 정보 관리

---

# API 명세

## 1. 사용자 목록 조회
**GET** `/api/cms/user/list`

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| page | Integer | | 페이지 번호 (기본값: 1) |
| size | Integer | | 페이지 크기 (기본값: 10) |
| searchKeyword | String | | 검색 키워드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": {
    "list": [
      {
        "id": "admin",
        "userNm": "홍길동",
        "eml": "admin@example.com",
        "mtelno": "01012345678",
        "gndrSe": "M",
        "userSe": "A",
        "userStsSe": "ACTIVE"
      }
    ],
    "total": 1,
    "page": 1,
    "size": 10
  }
}
```

---

## 2. 사용자 단건 조회
**GET** `/api/cms/user/{userSe}/{userId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userSe | String | O | 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자) |
| userId | String | O | 사용자 ID |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "id": "admin",
    "userNm": "홍길동",
    "eml": "admin@example.com",
    "mtelno": "01012345678",
    "gndrSe": "M",
    "userSe": "A",
    "telno": "0212345678",
    "addr": "서울시 강남구",
    "daddr": "테헤란로",
    "userStsSe": "ACTIVE",
    "crtAt": "2026-03-26 10:56:42",
    "updAt": "2026-03-26 10:56:59"
  }
}
```

### Error Responses
- **404 Not Found** - 사용자가 없음

---

## 3. 사용자 생성
**POST** `/api/cms/user/{userSe}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userSe | String | O | 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자) |

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| userId | String | O | 사용자 ID |
| pwd | String | O | 비밀번호 |
| userNm | String | | 사용자명 |
| eml | String | | 이메일 (이메일 형식 검증) |
| mtelno | String | | 휴대폰번호 |
| gndrSe | String | | 성별 (M=남, F=여) |
| telno | String | | 일반전화 |
| addr | String | | 주소 |
| daddr | String | | 상세주소 |
| zip | String | | 우편번호 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

### Error Responses
- **400 Bad Request** - 유효하지 않은 userSe 또는 필수 필드 누락
- **400 Bad Request** - 이메일 형식 오류

### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/user/A \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "testuser",
    "pwd": "TestPass1234!",
    "userNm": "테스트 사용자",
    "eml": "test@example.com",
    "mtelno": "01012345678",
    "gndrSe": "M"
  }'
```

### 주의
- **pwd** 필드명 사용 (password X)
- **userId** 필드명 사용 (id X)

---

## 4. 사용자 정보 수정
**PUT** `/api/cms/user/{userSe}/{userId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userSe | String | O | 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자) |
| userId | String | O | 사용자 ID |

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| userNm | String | | 사용자명 |
| eml | String | | 이메일 |
| mtelno | String | | 휴대폰번호 |
| gndrSe | String | | 성별 |
| telno | String | | 일반전화 |
| addr | String | | 주소 |
| daddr | String | | 상세주소 |
| zip | String | | 우편번호 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

### Error Responses
- **404 Not Found** - 사용자가 없음

### 주의
- **pwd 변경 불가** - 수정 API에서는 비밀번호 변경 불가

---

## 5. 사용자 삭제
**DELETE** `/api/cms/user/{userSe}/{userId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| userSe | String | O | 사용자 구분 (A=관리자, E=업무사용자, G=일반사용자) |
| userId | String | O | 사용자 ID |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

### Error Responses
- **404 Not Found** - 사용자가 없음

---

# 주의사항

1. **userSe 값**
   - A: 관리자 (CMS_USER_ADMIN 테이블)
   - E: 업무사용자 (CMS_USER_TASK 테이블)
   - G: 일반사용자 (CMS_USER 테이블)

2. **필드명**
   - `userId` 사용 (id X)
   - `pwd` 사용 (password X)

3. **비밀번호**
   - 생성 시에만 설정 가능
   - 수정 API에서는 변경 불가

4. **이메일**
   - 유효한 이메일 형식 검증
   - 선택사항이지만 제공 시 형식 검증

5. **사용자 상태**
   - userStsSe: "ACTIVE" (활성) 또는 "INACTIVE" (비활성)
