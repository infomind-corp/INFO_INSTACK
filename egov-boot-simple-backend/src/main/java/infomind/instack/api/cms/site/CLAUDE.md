# DATABASE
## 연관 테이블
- CMS_SITE
- CMS_SITE_IP


# Spec
## API : /api/cms/site
- GET : / : CMS 사이트 목록 조회
- GET : /{siteCd} : CMS 사이트 단건 조회
- GET : /{siteCd}/ip : CMS 사이트와 연관된 IP 목록 조회
- GET : /{siteCd}/ip/{sn} : CMS 사이트와 연관된 IP 단건 조회
- POST : / : CMS 사이트 생성
  - siteCd : 필수
  - siteNm : 필수
- PUT : /{siteCd} : CMS 사이트 정보 수정
- PUT : /{siteCd}/ip/{sn} : CMS 사이트와 연관된 IP 정보 수정
- DELETE : /{siteCd} : CMS 사이트 삭제 -> 연관된 IP도 함께 삭제

## Request field
- siteCd : 사용자가 입력하는 값 (사이트 코드, 필수)
- siteNm : 사용자가 입력하는 값 (사이트 이름, 필수)
- permIp : 사용자가 입력하는 값 (사이트 IP, 필수)

## DB field
### CMS_SITE
- CRT_BY : 사용자 객체(AuthUserVO)의 id
- UPD_BY : 사용자 객체(AuthUserVO)의 id
- CRT_AT : CMS 사이트 IP 생성 일시 (자동 생성)
- UPD_AT : CMS 사이트 IP 수정 일시 (자동 생성)

### CMS_SITE_IP
- SN : CMS 사이트 IP의 고유 번호 (AUTO_INCREMENT)
- CRT_BY : 사용자 객체(AuthUserVO)의 id
- UPD_BY : 사용자 객체(AuthUserVO)의 id
- CRT_AT : CMS 사이트 IP 생성 일시 (자동 생성)
- UPD_AT : CMS 사이트 IP 수정 일시 (자동 생성)
