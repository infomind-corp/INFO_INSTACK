# DATABASE
## 연관 테이블
- CMS_SITE (PK: SITE_CD) - 사이트 정보
- CMS_SITE_ACC_PERM (PK: SN, FK: SITE_CD) - 사이트별 접근 권한 (IP/도메인)

## 기능
- CMS에서 관리하는 사이트 정보 관리
- 사이트별 IP/도메인 접근 제어

---

# API 명세

## 1. 사이트 목록 조회
**GET** `/api/cms/site`

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "siteCd": "SITE001",
      "siteNm": "메인 사이트",
      "siteUrl": "https://example.com",
      "siteDesc": "메인 사이트 설명",
      "useYn": "Y",
      "crtAt": "2026-03-26 10:56:42",
      "updAt": "2026-03-26 10:56:59"
    }
  ]
}
```

---

## 2. 사이트 단건 조회
**GET** `/api/cms/site/{siteCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "siteCd": "SITE001",
    "siteNm": "메인 사이트",
    "siteUrl": "https://example.com",
    "siteDesc": "메인 사이트 설명",
    "useYn": "Y"
  }
}
```

---

## 3. 사이트 생성
**POST** `/api/cms/site`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| siteNm | String | O | 사이트명 |
| siteUrl | String | O | 사이트 URL |
| siteDesc | String | | 사이트 설명 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/site \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "siteCd": "SITE_TEST",
    "siteNm": "테스트 사이트",
    "siteUrl": "https://test.example.com",
    "useYn": "Y"
  }'
```

---

## 4. 사이트 수정
**PUT** `/api/cms/site/{siteCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Request Body
사이트 생성과 동일

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

## 5. 사이트 삭제
**DELETE** `/api/cms/site/{siteCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": null
}
```

### 주의
- 사이트와 연관된 모든 접근 권한(IP/도메인)도 함께 삭제됨

---

## 6. 사이트 접근 권한(permit) 목록 조회
**GET** `/api/cms/site/{siteCd}/permit`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": [
    {
      "sn": 1,
      "siteCd": "SITE001",
      "sitePermNm": "192.168.1.0/24",
      "sitePermKndSe": "IP",
      "crtAt": "2026-03-26 10:56:42"
    },
    {
      "sn": 2,
      "siteCd": "SITE001",
      "sitePermNm": "example.com",
      "sitePermKndSe": "DOMAIN",
      "crtAt": "2026-03-26 10:56:59"
    }
  ]
}
```

---

## 7. 사이트 접근 권한 단건 조회
**GET** `/api/cms/site/{siteCd}/permit/{sn}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| sn | Integer | O | 권한 일련번호 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "sn": 1,
    "siteCd": "SITE001",
    "sitePermNm": "192.168.1.0/24",
    "sitePermKndSe": "IP"
  }
}
```

---

## 8. 사이트 접근 권한 생성
**POST** `/api/cms/site/{siteCd}/permit`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| sitePermNm | String | O | IP 주소 또는 도메인명 |
| sitePermKndSe | String | O | 권한 유형 (IP 또는 DOMAIN) |

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

## 9. 사이트 접근 권한 수정
**PUT** `/api/cms/site/{siteCd}/permit/{sn}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| sn | Integer | O | 권한 일련번호 |

### Request Body
접근 권한 생성과 동일

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

# 주의사항

1. **sitePermKndSe** - "IP" 또는 "DOMAIN" 값만 허용
2. **IP 형식** - CIDR 표기법 지원 (예: 192.168.1.0/24)
3. **사이트 삭제 시** - 관련 접근 권한도 자동 삭제 (cascade delete)
4. **URL 형식** - https:// 또는 http://로 시작하는 유효한 URL

