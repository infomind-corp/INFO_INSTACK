# DATABASE
## 연관 테이블
- CMS_COM_MENU (PK: MENU_CD)
- CMS_COM_AUTH_MENU - 권한별 메뉴 매핑
- CMS_COM_AUTH - 권한 정보

## 기능
- CMS 및 사용자 페이지의 메뉴 관리
- 계층적 메뉴 구조 (상위/하위 메뉴)
- 권한별 메뉴 접근 제어

---

# API 명세

## 1. 메뉴 목록 조회
**GET** `/api/cms/menu`

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| upMenuCd | String | | 상위 메뉴 코드 (미지정 시 최상위 메뉴만 조회) |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "menuCd": "CMS00000000",
      "upMenuCd": null,
      "menuNm": "대시보드",
      "menuLvl": 1,
      "menuOrd": 0,
      "prgmNm": "대시보드",
      "prgmPath": "/cms/dashboard",
      "qryUseYn": "Y",
      "newUseYn": "Y",
      "saveUseYn": "Y",
      "delUseYn": "Y",
      "outpUseYn": "Y",
      "crtAt": "2026-03-26 10:56:42",
      "updAt": "2026-03-26 10:56:59"
    }
  ]
}
```

---

## 2. 메뉴 단건 조회
**GET** `/api/cms/menu/{menuCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| menuCd | String | O | 메뉴 코드 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "data": {
    "menuCd": "CMS00000000",
    "upMenuCd": null,
    "menuNm": "대시보드",
    "menuLvl": 1,
    "menuOrd": 0,
    "prgmNm": "대시보드",
    "prgmPath": "/cms/dashboard",
    "qryUseYn": "Y",
    "newUseYn": "Y",
    "saveUseYn": "Y",
    "delUseYn": "Y"
  }
}
```

---

## 3. 메뉴 생성
**POST** `/api/cms/menu`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| menuCd | String | O | 메뉴 코드 |
| menuNm | String | O | 메뉴명 |
| upMenuCd | String | | 상위 메뉴 코드 |
| menuOrd | Integer | | 순서 (기본값: 0) |
| prgmNm | String | | 프로그램명 |
| prgmPath | String | | 프로그램 경로 |
| qryUseYn | String | | 조회 권한 (Y/N) |
| newUseYn | String | | 신규 권한 (Y/N) |
| saveUseYn | String | | 저장 권한 (Y/N) |
| delUseYn | String | | 삭제 권한 (Y/N) |
| outpUseYn | String | | 출력 권한 (Y/N) |
| urlTgtSe | String | | URL 대상 구분 |
| urlAddr | String | | URL 주소 |
| param1~5 | String | | 추가 파라미터 |
| menuRmk | String | | 메뉴 비고 |
| prvUseYn | String | | 미리보기 권한 (Y/N) |

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
curl -X POST http://localhost:8080/api/cms/menu \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "menuCd": "CMS99999999",
    "menuNm": "테스트 메뉴",
    "menuOrd": 10,
    "prgmNm": "테스트 프로그램",
    "prgmPath": "/cms/test"
  }'
```

---

## 4. 메뉴 수정
**PUT** `/api/cms/menu/{menuCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| menuCd | String | O | 메뉴 코드 |

### Request Body
메뉴 생성과 동일

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

## 5. 메뉴 삭제
**DELETE** `/api/cms/menu/{menuCd}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| menuCd | String | O | 메뉴 코드 |

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
- 해당 메뉴의 모든 하위 메뉴도 함께 삭제됨

---

# 주의사항

1. **menuLvl** - 메뉴 깊이 (자동 계산)
2. **upMenuCd** - null일 경우 최상위 메뉴
3. **권한 필드** (qryUseYn, newUseYn 등) - 권한별로 사용 가능한 기능 지정
4. **DELETE 시 cascade 삭제** - 하위 메뉴도 모두 삭제
