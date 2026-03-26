# DATABASE
## 연관 테이블
- CMS_COM_ORG (PK: ORG_CD) - 조직
- CMS_COM_DEPT (PK: DEPT_CD, FK: ORG_CD) - 부서

## 기능
- CMS에서 사용하는 조직/부서 정보 관리
- 조직과 부서의 계층 관계 관리

---

# API 명세

## 조직(Organization) API

### 1. 조직 목록 조회
**GET** `/api/cms/dept/org`

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| searchKeyword | String | | 검색 키워드 (조직명, 조직코드) |
| useYn | String | | 사용 여부 (Y/N) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": [
    {
      "orgCd": "ORG001",
      "orgNm": "정보통신부",
      "orgStsSe": "ACTIVE",
      "ord": 1,
      "useYn": "Y",
      "crtBy": "admin",
      "crtIp": "192.168.1.1",
      "crtPgm": "OrgServiceImpl.insert",
      "crtAt": "2026-03-26 10:00:00",
      "updBy": "admin",
      "updIp": "192.168.1.1",
      "updPgm": "OrgServiceImpl.update",
      "updAt": "2026-03-26 10:00:00"
    }
  ]
}
```

---

### 2. 조직 단건 조회
**GET** `/api/cms/dept/org/{orgCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| orgCd | String | O | 조직 코드 |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "orgCd": "ORG001",
    "orgNm": "정보통신부",
    "orgStsSe": "ACTIVE",
    "ord": 1,
    "useYn": "Y",
    "crtBy": "admin",
    "crtIp": "192.168.1.1",
    "crtPgm": "OrgServiceImpl.insert",
    "crtAt": "2026-03-26 10:00:00",
    "updBy": "admin",
    "updIp": "192.168.1.1",
    "updPgm": "OrgServiceImpl.update",
    "updAt": "2026-03-26 10:00:00"
  }
}
```

---

### 3. 조직 등록
**POST** `/api/cms/dept/org`

#### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| orgCd | String | O | 조직 코드 |
| orgNm | String | O | 조직 명 |
| orgStsSe | String | | 조직 상태 구분 |
| ord | Integer | | 순서 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

#### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/dept/org \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "orgCd": "ORG001",
    "orgNm": "정보통신부",
    "orgStsSe": "ACTIVE",
    "ord": 1,
    "useYn": "Y"
  }'
```

---

### 4. 조직 수정
**PUT** `/api/cms/dept/org/{orgCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| orgCd | String | O | 조직 코드 |

#### Request Body
조직 등록과 동일

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

---

### 5. 조직 삭제
**DELETE** `/api/cms/dept/org/{orgCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| orgCd | String | O | 조직 코드 |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

#### 주의
- 해당 조직의 모든 부서도 함께 삭제됨

---

## 부서(Department) API

### 1. 부서 목록 조회
**GET** `/api/cms/dept`

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| orgCd | String | | 조직 코드 (필터) |
| searchKeyword | String | | 검색 키워드 (부서명, 부서코드) |
| useYn | String | | 사용 여부 (Y/N) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": [
    {
      "deptCd": "DEPT001",
      "orgCd": "ORG001",
      "deptNm": "정책과",
      "ord": 1,
      "useYn": "Y",
      "crtBy": "admin",
      "crtIp": "192.168.1.1",
      "crtPgm": "DeptServiceImpl.insert",
      "crtAt": "2026-03-26 10:00:00",
      "updBy": "admin",
      "updIp": "192.168.1.1",
      "updPgm": "DeptServiceImpl.update",
      "updAt": "2026-03-26 10:00:00"
    }
  ]
}
```

---

### 2. 부서 단건 조회
**GET** `/api/cms/dept/{deptCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| deptCd | String | O | 부서 코드 |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "deptCd": "DEPT001",
    "orgCd": "ORG001",
    "deptNm": "정책과",
    "ord": 1,
    "useYn": "Y",
    "crtBy": "admin",
    "crtIp": "192.168.1.1",
    "crtPgm": "DeptServiceImpl.insert",
    "crtAt": "2026-03-26 10:00:00",
    "updBy": "admin",
    "updIp": "192.168.1.1",
    "updPgm": "DeptServiceImpl.update",
    "updAt": "2026-03-26 10:00:00"
  }
}
```

---

### 3. 조직별 부서 목록 조회
**GET** `/api/cms/dept/org/{orgCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| orgCd | String | O | 조직 코드 |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": [
    {
      "deptCd": "DEPT001",
      "orgCd": "ORG001",
      "deptNm": "정책과",
      "ord": 1,
      "useYn": "Y",
      "crtBy": "admin",
      "crtIp": "192.168.1.1",
      "crtPgm": "DeptServiceImpl.insert",
      "crtAt": "2026-03-26 10:00:00",
      "updBy": "admin",
      "updIp": "192.168.1.1",
      "updPgm": "DeptServiceImpl.update",
      "updAt": "2026-03-26 10:00:00"
    }
  ]
}
```

---

### 4. 부서 등록
**POST** `/api/cms/dept`

#### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| deptCd | String | O | 부서 코드 |
| orgCd | String | O | 조직 코드 |
| deptNm | String | O | 부서 명 |
| ord | Integer | | 순서 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

#### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/dept \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "deptCd": "DEPT001",
    "orgCd": "ORG001",
    "deptNm": "정책과",
    "ord": 1,
    "useYn": "Y"
  }'
```

---

### 5. 부서 수정
**PUT** `/api/cms/dept/{deptCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| deptCd | String | O | 부서 코드 |

#### Request Body
부서 등록과 동일

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

---

### 6. 부서 삭제
**DELETE** `/api/cms/dept/{deptCd}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| deptCd | String | O | 부서 코드 |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

---

# 주의사항

1. **조직 삭제 시 cascade 삭제** - 해당 조직의 모든 부서도 함께 삭제됨
2. **부서는 반드시 조직에 속해야 함** - 부서 생성/수정 시 유효한 조직 코드 필수
3. **useYn 기본값은 'Y'** - 등록 시 사용 여부가 미입력되면 'Y'로 설정
