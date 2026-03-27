# DATABASE
## 연관 테이블
- CMS_BRD (PK: SITE_CD, BRD_ID, BRD_SE) - 게시판 기본 정보
- CMS_BRD_AUTH (PK: BRD_ID, BRD_SE, SITE_CD, FK: CMS_BRD) - 게시판 권한 정보

## 기능
- 사이트별 게시판 관리 (생성/수정/삭제)
- 게시판별 쓰기/조회/댓글 권한 코드 관리
- brdId는 사이트(siteCd) 내에서 유니크하게 관리 (URL 식별자로 사용)
- 게시판 삭제 시 CMS_BRD_AUTH 먼저 삭제 후 CMS_BRD 삭제 (FK 순서)

---

# API 명세

## 1. 게시판 목록 조회
**GET** `/api/cms/site/{siteCd}/board`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Query Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| brdSe | String | | 게시판 구분 코드 (미지정 시 전체 조회) |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": [
    {
      "siteCd": "SITE001",
      "brdId": "NOTICE",
      "brdSe": "BBS",
      "brdNm": "공지사항",
      "brdDesc": "공지사항 게시판입니다",
      "ord": 1,
      "useYn": "Y",
      "lgnUserUseYn": "N",
      "wrtrPsnQryYn": "N",
      "pwdUseYn": "N",
      "fileUseYn": "Y",
      "cmtUseYn": "Y",
      "wrtAuthCd": "AUTH_USER",
      "qryAuthCd": "AUTH_ALL",
      "cmtAuthCd": "AUTH_USER",
      "crtAt": "2026-03-26 10:30:00",
      "updAt": "2026-03-26 10:30:00"
    }
  ]
}
```

---

## 2. 게시판 단건 조회
**GET** `/api/cms/site/{siteCd}/board/{brdId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| brdId | String | O | 게시판 ID |

### Response (200 OK)
```json
{
  "success": true,
  "code": "SUCCESS",
  "message": null,
  "data": {
    "siteCd": "SITE001",
    "brdId": "NOTICE",
    "brdSe": "BBS",
    "brdNm": "공지사항",
    "brdDesc": "공지사항 게시판입니다",
    "ord": 1,
    "useYn": "Y",
    "lgnUserUseYn": "N",
    "wrtrPsnQryYn": "N",
    "pwdUseYn": "N",
    "fileUseYn": "Y",
    "cmtUseYn": "Y",
    "wrtAuthCd": "AUTH_USER",
    "qryAuthCd": "AUTH_ALL",
    "cmtAuthCd": "AUTH_USER",
    "crtAt": "2026-03-26 10:30:00",
    "updAt": "2026-03-26 10:30:00"
  }
}
```

---

## 3. 게시판 등록
**POST** `/api/cms/site/{siteCd}/board`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |

### Request Body
| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| brdId | String | O | 게시판 ID |
| brdSe | String | O | 게시판 구분 코드 |
| brdNm | String | O | 게시판 명 |
| brdDesc | String | | 게시판 설명 |
| ord | Integer | | 정렬 순서 |
| useYn | String | | 사용 여부 (Y/N, 기본값: Y) |
| lgnUserUseYn | String | | 로그인 사용자만 사용 여부 (Y/N, 기본값: N) |
| wrtrPsnQryYn | String | | 작성자 개인글 조회 여부 (Y/N, 기본값: N) |
| pwdUseYn | String | | 비밀번호 사용 여부 (Y/N, 기본값: N) |
| fileUseYn | String | | 파일 사용 여부 (Y/N, 기본값: N) |
| cmtUseYn | String | | 댓글 사용 여부 (Y/N, 기본값: N) |
| wrtAuthCd | String | | 쓰기 권한 코드 |
| qryAuthCd | String | | 조회 권한 코드 |
| cmtAuthCd | String | | 댓글 권한 코드 |

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
curl -X POST http://localhost:8080/api/cms/site/SITE001/board \
  -H "Authorization: Bearer {token}" \
  -H "Content-Type: application/json" \
  -d '{
    "brdId": "NOTICE",
    "brdSe": "BBS",
    "brdNm": "공지사항",
    "brdDesc": "공지사항 게시판입니다",
    "ord": 1,
    "useYn": "Y",
    "fileUseYn": "Y",
    "cmtUseYn": "Y",
    "wrtAuthCd": "AUTH_USER",
    "qryAuthCd": "AUTH_ALL",
    "cmtAuthCd": "AUTH_USER"
  }'
```

---

## 4. 게시판 수정
**PUT** `/api/cms/site/{siteCd}/board/{brdId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| brdId | String | O | 게시판 ID |

### Request Body
게시판 등록과 동일 (brdId, brdSe 포함)

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

## 5. 게시판 삭제
**DELETE** `/api/cms/site/{siteCd}/board/{brdId}`

### Path Parameters
| 파라미터 | 타입 | 필수 | 설명 |
|---------|------|------|------|
| siteCd | String | O | 사이트 코드 |
| brdId | String | O | 게시판 ID |

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
- 게시판 권한 정보(CMS_BRD_AUTH)도 함께 삭제됨 (cascade delete)

---

# 주의사항

1. **brdId 유일성** - siteCd 내에서 brdId는 유니크해야 함 (URL 식별자로 사용)
2. **Y/N 기본값** - useYn은 null 시 'Y', 나머지 플래그는 'N'으로 자동 설정
3. **삭제 순서** - CMS_BRD_AUTH → CMS_BRD 순서로 삭제 (FK 제약 조건)
4. **권한 코드** - wrtAuthCd, qryAuthCd, cmtAuthCd는 공통 코드 테이블 참조
5. **LEFT JOIN** - 권한 레코드(CMS_BRD_AUTH)가 없어도 게시판 조회 가능
