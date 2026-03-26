# DATABASE
## 연관 테이블
- CMS_COM_CODE (PK: UP_CD + CD)

## 기능
- CMS 및 사용자 페이지에서 사용하는 공통 코드 관리
- 계층적 코드 구조 (상위/하위 코드)

---

# API 명세

## 1. 하위 코드 목록 조회
**GET** `/api/cms/code/top/{upCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upCd | String | O | 상위 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": [
    {
      "upCd": "STATUS",
      "cd": "ACTIVE",
      "cdNm": "활성",
      "useYn": "Y",
      "cdOrd": 1
    }
  ]
}
```

---

## 2. 코드 단건 조회
**GET** `/api/cms/code/{upCd}/{cd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upCd | String | O | 상위 코드 (최상위는 "0") |
| cd | String | O | 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "upCd": "0",
    "cd": "STATUS",
    "cdNm": "상태",
    "useYn": "Y",
    "cdOrd": 1,
    "refCd1": null,
    "refNum1": null,
    "cdRmk": "상태 코드"
  }
}
```

---

## 3. 최상위 코드 생성
**POST** `/api/cms/code/top`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| cd | String | O | 코드 |
| cdNm | String | O | 코드명 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |
| cdOrd | Integer | | 순서 |
| refCd1~5 | String | | 참조 코드 (선택사항) |
| refNum1~5 | Number | | 참조 숫자 (선택사항) |
| cdRmk | String | | 비고 |

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
curl -X POST http://localhost:8080/api/cms/code/top \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "cd": "TEST_CODE",
    "cdNm": "테스트 코드",
    "useYn": "Y",
    "cdOrd": 1
  }'
```

---

## 4. 하위 코드 생성
**POST** `/api/cms/code/{upCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upCd | String | O | 상위 코드 |

### Request Body
상위 코드 생성과 동일

### Response (200 OK)
상위 코드 생성과 동일

---

## 5. 코드 수정
**PUT** `/api/cms/code/{upCd}/{cd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upCd | String | O | 상위 코드 (최상위는 "0") |
| cd | String | O | 코드 |

### Request Body
상위 코드 생성과 동일 (모든 필드)

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

## 6. 코드 삭제
**DELETE** `/api/cms/code/{upCd}/{cd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upCd | String | O | 상위 코드 (최상위는 "0") |
| cd | String | O | 코드 |

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
- 해당 코드의 모든 하위 코드도 함께 삭제됨

---

# 주의사항

1. **최상위 코드의 경우** `upCd=0` 사용
2. **DELETE 시 cascade 삭제** - 하위 코드도 모두 삭제
3. **refCd, refNum** - 선택사항으로 추가 정보 저장 가능
