# DATABASE
## 연관 테이블
- CMS_POP_GRP (PK: SITE_CD, POP_GRP_ID, LANG_SE) - 팝업 그룹
- CMS_POP (PK: SITE_CD, POP_GRP_ID, POP_ID, LANG_SE, FK: CMS_POP_GRP) - 팝업

## 기능
- 사이트별 다국어 팝업 그룹 및 팝업 관리
- 게시 기간(pubStYmd/pubEndYmd) 및 시간(pubStHr/pubEndHr) 기반 게시 스케줄
- 팝업 위치/크기 설정 (popW, popH, wPstn, hPstn)
- 팝업 그룹 삭제 시 CMS_POP 먼저 삭제 후 CMS_POP_GRP 삭제 (FK 순서)

---

# API 명세

## 팝업 그룹 API

### 1. 팝업 그룹 목록 조회
**GET** `/api/cms/site/{siteCd}/popup-group`

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | | 언어 구분 (미지정 시 전 언어 조회) |

### Response (200 OK)
```json
{
  "success": true,
  "data": [
    {
      "siteCd": "SITE001",
      "popGrpId": "POP_MAIN",
      "langSe": "ko",
      "popGrpNm": "메인 팝업 그룹",
      "useYn": "Y",
      "popGrpOrd": 1,
      "crtAt": "2026-03-26 10:30:00",
      "updAt": "2026-03-26 10:30:00"
    }
  ]
}
```

---

### 2. 팝업 그룹 단건 조회
**GET** `/api/cms/site/{siteCd}/popup-group/{popGrpId}?langSe={langSe}`

---

### 3. 팝업 그룹 등록
**POST** `/api/cms/site/{siteCd}/popup-group`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| popGrpId | String | O | 팝업 그룹 아이디 |
| langSe | String | O | 언어 구분 |
| popGrpNm | String | O | 팝업 그룹 명 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |
| popGrpOrd | Integer | | 정렬 순서 |

---

### 4. 팝업 그룹 수정
**PUT** `/api/cms/site/{siteCd}/popup-group/{popGrpId}`

Request body의 langSe로 수정 대상 언어 지정 (필수)

---

### 5. 팝업 그룹 삭제
**DELETE** `/api/cms/site/{siteCd}/popup-group/{popGrpId}?langSe={langSe}`

langSe 미지정 시 전 언어 삭제. 연관 팝업(CMS_POP)도 cascade 삭제.

---

## 팝업 API

### 6. 팝업 목록 조회
**GET** `/api/cms/site/{siteCd}/popup`

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| popGrpId | String | | 팝업 그룹 아이디 (미지정 시 전 그룹 조회) |
| langSe | String | | 언어 구분 (미지정 시 전 언어 조회) |

---

### 7. 팝업 단건 조회
**GET** `/api/cms/site/{siteCd}/popup/{popId}?langSe={langSe}`

---

### 8. 팝업 등록
**POST** `/api/cms/site/{siteCd}/popup`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| popGrpId | String | O | 팝업 그룹 아이디 |
| popId | String | O | 팝업 아이디 |
| langSe | String | O | 언어 구분 |
| popNm | String | O | 팝업 명 |
| popTtl | String | | 팝업 제목 |
| popDesc | String | | 팝업 내용 |
| pubStYmd | String | | 게시 시작 일자 (YYYYMMDD) |
| pubEndYmd | String | | 게시 종료 일자 (YYYYMMDD) |
| pubStHr | String | | 게시 시작 시간 (HHMM) |
| pubEndHr | String | | 게시 종료 시간 (HHMM) |
| popPubSe | String | | 오늘 하루동안 그만보기 여부 구분 |
| pubYn | String | | 게시 여부 (Y/N, 기본값: N) |
| rmk | String | | 비고 |
| addUrl | String | | 추가 URL |
| urlTgtSe | String | | URL 타겟 (_self, _blank) |
| popW | BigDecimal | | 팝업 가로 (픽셀) |
| wPstn | BigDecimal | | 가로 위치 (픽셀) |
| popH | BigDecimal | | 팝업 세로 (픽셀) |
| hPstn | BigDecimal | | 세로 위치 (픽셀) |
| afileId | String | | 첨부파일 아이디 |

---

### 9. 팝업 수정
**PUT** `/api/cms/site/{siteCd}/popup/{popId}`

Request body의 langSe로 수정 대상 언어 지정 (필수)

---

### 10. 팝업 삭제
**DELETE** `/api/cms/site/{siteCd}/popup/{popId}?langSe={langSe}`

langSe 미지정 시 전 언어 삭제.

---

# 주의사항

1. **복합 PK** - (SITE_CD, POP_GRP_ID, LANG_SE) 조합이 팝업 그룹의 유일 식별자
2. **삭제 순서** - CMS_POP → CMS_POP_GRP 순서로 삭제 (FK 제약 조건)
3. **langSe 없이 삭제** - 해당 팝업 그룹/팝업의 전 언어 레코드 일괄 삭제
4. **useYn 기본값** - null 시 'Y'로 자동 설정
5. **pubYn 기본값** - null 시 'N'으로 자동 설정
