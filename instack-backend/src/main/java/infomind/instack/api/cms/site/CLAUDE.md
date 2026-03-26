# DATABASE
## 연관 테이블
- CMS_SITE
- CMS_SITE_ACC_PERM


# Spec
## API : /api/cms/site
- GET : / : CMS 사이트 목록 조회
- GET : /{siteCd} : CMS 사이트 단건 조회
- GET : /{siteCd}/permit : CMS 사이트와 연관된 IP 목록 조회
- GET : /{siteCd}/permit/{sn} : CMS 사이트와 연관된 IP 단건 조회
- POST : / : CMS 사이트 생성
  - siteCd : 필수
  - siteNm : 필수
- PUT : /{siteCd} : CMS 사이트 정보 수정
- PUT : /{siteCd}/permit/{sn} : CMS 사이트와 연관된 IP 정보 수정
- DELETE : /{siteCd} : CMS 사이트 삭제 -> 연관된 IP도 함께 삭제

## Request field
- siteCd : 사용자가 입력하는 값 (사이트 코드, 필수)
- siteNm : 사용자가 입력하는 값 (사이트 이름, 필수)
- siteUrl : 사용자가 입력하는 값 (사이트 URL, 필수)

- sn : CMS_SITE_ACC_PERM 테이블의 PK (AUTO_INCREMENT)
- sitePermNm : 사용자가 입력하는 값 (사이트 IP 혹은 도메인명, 필수)
- sitePermKndSe : 사용자가 입력하는 값 (사이트 IP 혹은 도메인명 구분, 'IP' 또는 'DOMAIN', 필수)

