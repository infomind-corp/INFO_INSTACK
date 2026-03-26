# DATABASE
## 연관 테이블
- CMS_CTT (PK: SITE_CD + CTT_ID + LANG_SE)
- CMS_CTT_SEO (PK: SEO_SN, FK: SITE_CD + CTT_ID + LANG_SE)

## 기능
- 사이트별 다국어 컨텐츠 관리
- 게시 기간(pubStYmd/pubStHhmm ~ pubEndYmd/pubEndHhmm) 기반 게시 제어
- 컨텐츠 본문은 puck editor JSON 형식(cttDesc)
- SEO 메타 정보(metaTtl, metaDesc) 선택적 관리

---

# API 명세

## 1. 컨텐츠 목록 조회
**GET** `/api/cms/site/{siteCd}/content`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | | 언어 구분 |
| useYn | String | | 사용 여부 (Y/N) |
| pubYn | String | | 게시 여부 (Y/N) |
| keyword | String | | 컨텐츠 명 키워드 검색 |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "siteCd": "SITE001",
      "cttId": "CTT_MAIN_BANNER",
      "langSe": "ko",
      "cttNm": "메인 배너",
      "cttDesc": "{...puck editor JSON...}",
      "useYn": "Y",
      "pubYn": "Y",
      "pubStYmd": "20260101",
      "pubStHhmm": "0900",
      "pubEndYmd": "20261231",
      "pubEndHhmm": "1800",
      "cttRmk": null,
      "seoSn": 1,
      "metaTtl": "메인 배너 - 사이트명",
      "metaDesc": "메인 배너 설명",
      "crtAt": "2026-03-26 10:30:45",
      "updAt": "2026-03-26 10:30:45"
    }
  ]
}
```

---

## 2. 컨텐츠 단건 조회
**GET** `/api/cms/site/{siteCd}/content/{cttId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| cttId | String | O | 컨텐츠 아이디 |

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | | 언어 구분 |

### Response (200 OK)
목록 조회 단건과 동일 구조

### Response (404 Not Found)
```json
{
  "success": false,
  "code": "NOT_FOUND",
  "message": "컨텐츠를 찾을 수 없습니다."
}
```

---

## 3. 컨텐츠 등록
**POST** `/api/cms/site/{siteCd}/content`

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| cttId | String | O | 컨텐츠 아이디 |
| langSe | String | O | 언어 구분 |
| cttNm | String | O | 컨텐츠 명 |
| cttDesc | String | | 컨텐츠 내용 (puck editor JSON) |
| useYn | String | | 사용 여부 (Y/N) |
| pubYn | String | | 게시 여부 (Y/N) |
| pubStYmd | String | | 게시 시작 일자 (YYYYMMDD) |
| pubStHhmm | String | | 게시 시작 시분 (HHmm) |
| pubEndYmd | String | | 게시 종료 일자 (YYYYMMDD) |
| pubEndHhmm | String | | 게시 종료 시분 (HHmm) |
| cttRmk | String | | 비고 |
| metaTtl | String | | SEO 메타 제목 (입력 시 CMS_CTT_SEO 함께 등록) |
| metaDesc | String | | SEO 메타 설명 (입력 시 CMS_CTT_SEO 함께 등록) |

### Response (200 OK)
```json
{ "success": true, "code": "SUCCESS", "message": null, "data": null }
```

### 테스트
```bash
curl -X POST http://localhost:8080/api/cms/site/SITE001/content \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "cttId": "CTT_MAIN_BANNER",
    "langSe": "ko",
    "cttNm": "메인 배너",
    "useYn": "Y",
    "pubYn": "Y",
    "metaTtl": "메인 배너 - 사이트명"
  }'
```

---

## 4. 컨텐츠 수정
**PUT** `/api/cms/site/{siteCd}/content/{cttId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| cttId | String | O | 컨텐츠 아이디 |

### Request Body
등록과 동일 (langSe 필수)

### 비고
- SEO 필드(metaTtl/metaDesc) 입력 시: 기존 SEO 레코드가 있으면 UPDATE, 없으면 INSERT (upsert)
- SEO 필드 미입력 시: SEO 테이블 변경 없음

---

## 5. 컨텐츠 삭제
**DELETE** `/api/cms/site/{siteCd}/content/{cttId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| cttId | String | O | 컨텐츠 아이디 |

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| langSe | String | | 언어 구분 (미지정 시 전 언어 삭제) |

### 주의
- CMS_CTT_SEO 먼저 삭제 후 CMS_CTT 삭제 (FK 제약 순서)

---

# 주의사항

1. **복합 PK** - SITE_CD + CTT_ID + LANG_SE 조합이 유일 식별자
2. **SEO 처리** - metaTtl 또는 metaDesc 중 하나라도 값이 있으면 CMS_CTT_SEO 처리
3. **삭제 순서** - SEO(CMS_CTT_SEO) → 본문(CMS_CTT) 순으로 삭제
4. **langSe 없이 삭제** - 해당 사이트/컨텐츠의 전 언어 레코드 일괄 삭제
