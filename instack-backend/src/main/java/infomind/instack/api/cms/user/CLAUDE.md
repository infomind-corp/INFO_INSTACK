# DATABASE
## 연관 테이블
- CMS_USER
- CMS_USER_TASK
- CMS_USER_ADMIN
- CMS_PWD


# Spec
## API : /api/cms/user
- GET : /list : 사용자 목록 조회 (페이징)
- GET : /{userSe}/{userId} : 사용자 단건 조회
- POST : /{userSe} : 사용자 생성
  - id : 필수
  - pwd : 필수
- PUT : /{userSe}/{userId} : 사용자 정보 업데이트
- DELETE : /{userSe}/{userId} : 사용자 삭제

## Request
- userSe : 사용자가 입력하는 값 ('A'는 관리자, 'E'는 업무사용자, 'G'는 일반 사용자)
- userId : 사용자가 입력하는 값 (ID, 필수)
- pwd : 사용자가 입력하는 값 (Password, 필수)
