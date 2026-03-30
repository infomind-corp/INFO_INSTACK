# DATABASE
## 연관 테이블
- CMS_BNR_GRP (PK: BNR_GRP_ID, SITE_CD, LANG_SE) - 배너 그룹 기본 정보
- CMS_BNR (PK: BNR_ID, BNR_GRP_ID, SITE_CD, LANG_SE, FK: CMS_BNR_GRP) - 배너 정보

## 기능
- 사이트별 다국어 배너 그룹 관리 (생성/수정/삭제)
- 배너 그룹별 배너 관리 (생성/수정/삭제)
- 게시 기간(pubStYmd/pubStHr ~ pubEndYmd/pubEndHr) 기반 게시 제어
- 배너 그룹 삭제 시 CMS_BNR 먼저 삭제 후 CMS_BNR_GRP 삭제 (FK 순서)

---

# API 명세

## 배너 그룹 API

### 1. 배너 그룹 목록 조회
**GET** `/api/cms/site/{siteCd}/banner-grp`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | | 언어 구분 |
| useYn | String | | 사용 여부 (Y/N) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "bnrGrpId": "GRP_MAIN",
      "siteCd": "SITE001",
      "langSe": "ko",
      "bnrGrpNm": "메인 배너 그룹",
      "bnrGrpDesc": "메인 페이지 배너 그룹입니다",
      "useYn": "Y",
      "sort": 1,
      "crtAt": "2026-03-26 10:30:00",
      "updAt": "2026-03-26 10:30:00"
    }
  ]
}
```

---

### 2. 배너 그룹 단건 조회
**GET** `/api/cms/site/{siteCd}/banner-grp/{bnrGrpId}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| bnrGrpId | String | O | 배너 그룹 아이디 |

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | O | 언어 구분 |

#### Response (200 OK)
목록 조회 단건과 동일 구조

#### Response (404 Not Found)
```json
{
  "success": false,
  "code": "NOT_FOUND",
  "message": "배너 그룹을 찾을 수 없습니다."
}
```

---

### 3. 배너 그룹 등록
**POST** `/api/cms/site/{siteCd}/banner-grp`

#### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| bnrGrpId | String | O | 배너 그룹 아이디 |
| langSe | String | O | 언어 구분 |
| bnrGrpNm | String | O | 배너 그룹 명 |
| bnrGrpDesc | String | | 배너 그룹 내용 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |
| sort | Integer | | 정렬 순서 |

#### Response (200 OK)
```json
{ "success": true, "code": "SUCCESS", "message": null, "data": null }
```

#### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/site/SITE001/banner-grp \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "bnrGrpId": "GRP_MAIN",
    "langSe": "ko",
    "bnrGrpNm": "메인 배너 그룹",
    "useYn": "Y",
    "sort": 1
  }'
```

---

### 4. 배너 그룹 수정
**PUT** `/api/cms/site/{siteCd}/banner-grp/{bnrGrpId}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| bnrGrpId | String | O | 배너 그룹 아이디 |

#### Request Body
등록과 동일 (langSe 필수)

---

### 5. 배너 그룹 삭제
**DELETE** `/api/cms/site/{siteCd}/banner-grp/{bnrGrpId}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| bnrGrpId | String | O | 배너 그룹 아이디 |

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | O | 언어 구분 |

#### 주의
- 그룹에 속한 배너(CMS_BNR)도 함께 삭제됨

---

## 배너 API

### 1. 배너 목록 조회
**GET** `/api/cms/site/{siteCd}/banner`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| bnrGrpId | String | | 배너 그룹 아이디 |
| langSe | String | | 언어 구분 |
| useYn | String | | 사용 여부 (Y/N) |

#### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "bnrId": "BNR_001",
      "bnrGrpId": "GRP_MAIN",
      "siteCd": "SITE001",
      "langSe": "ko",
      "bnrNm": "메인 배너 1",
      "bnrDesc": "배너 설명",
      "afileId": null,
      "ord": 1,
      "pubStYmd": "20260101",
      "pubStHr": "0900",
      "pubEndYmd": "20261231",
      "pubEndHr": "1800",
      "useYn": "Y",
      "bnrSe": "_self",
      "bnrSzSe": "FULL",
      "bnrUrl": "https://example.com",
      "delYn": "N",
      "bnrRmk": null,
      "crtAt": "2026-03-26 10:30:00",
      "updAt": "2026-03-26 10:30:00"
    }
  ]
}
```

---

### 2. 배너 단건 조회
**GET** `/api/cms/site/{siteCd}/banner/{bnrId}`

#### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| bnrId | String | O | 배너 아이디 |

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| bnrGrpId | String | O | 배너 그룹 아이디 |
| langSe | String | O | 언어 구분 |

#### Response (200 OK)
목록 조회 단건과 동일 구조

#### Response (404 Not Found)
```json
{
  "success": false,
  "code": "NOT_FOUND",
  "message": "배너를 찾을 수 없습니다."
}
```

---

### 3. 배너 등록
**POST** `/api/cms/site/{siteCd}/banner`

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| bnrGrpId | String | O | 배너 그룹 아이디 |

#### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| bnrId | String | O | 배너 아이디 |
| langSe | String | O | 언어 구분 |
| bnrNm | String | O | 배너 명 |
| bnrDesc | String | | 배너 내용 |
| afileId | String | | 첨부파일 아이디 |
| ord | Integer | | 순서 |
| pubStYmd | String | | 게시 시작 일자 (YYYYMMDD) |
| pubStHr | String | | 게시 시작 시간 (HH24mm) |
| pubEndYmd | String | | 게시 종료 일자 (YYYYMMDD) |
| pubEndHr | String | | 게시 종료 시간 (HH24mm) |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |
| bnrSe | String | | 배너 구분 (_self 등) |
| bnrSzSe | String | | 배너 크기 구분 |
| bnrUrl | String | | 배너 URL |
| delYn | String | | 삭제 여부 (Y/N, 기본값: N) |
| bnrRmk | String | | 비고 |

#### 테스트
```bash
curl -X POST "http://localhost:8080/api/cms/site/SITE001/banner?bnrGrpId=GRP_MAIN" \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "bnrId": "BNR_001",
    "langSe": "ko",
    "bnrNm": "메인 배너 1",
    "useYn": "Y",
    "bnrUrl": "https://example.com",
    "ord": 1
  }'
```

---

### 4. 배너 수정
**PUT** `/api/cms/site/{siteCd}/banner/{bnrId}`

#### Request Body
등록과 동일 (bnrGrpId, langSe 필수)

---

### 5. 배너 삭제
**DELETE** `/api/cms/site/{siteCd}/banner/{bnrId}`

#### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| bnrGrpId | String | O | 배너 그룹 아이디 |
| langSe | String | O | 언어 구분 |

---

# 주의사항

1. **복합 PK** - CMS_BNR_GRP: BNR_GRP_ID + SITE_CD + LANG_SE, CMS_BNR: BNR_ID + BNR_GRP_ID + SITE_CD + LANG_SE
2. **삭제 순서** - 배너(CMS_BNR) → 배너 그룹(CMS_BNR_GRP) 순으로 삭제 (FK 제약 조건)
3. **Y/N 기본값** - useYn은 null 시 'Y', delYn은 null 시 'N'으로 자동 설정
4. **langSe 필수** - 단건 조회/수정/삭제 시 PK 구성 요소이므로 langSe 필수
5. **배너 등록 시 bnrGrpId** - RequestParam으로 전달 (body가 아닌 URL 파라미터)
6. **배너 수정 시 bnrGrpId, langSe** - Request body에 포함하여 전달
