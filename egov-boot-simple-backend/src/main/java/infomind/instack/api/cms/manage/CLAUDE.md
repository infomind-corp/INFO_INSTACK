# DATABASE
## 연관 테이블
- CMS_USER
- CMS_USER_TASK
- CMS_USER_ADMIN
- CMS_PWD

## 필드
- USER_SE : 'A'는 관리자, 'E'는 업무사용자, 'G'는 일반 사용자


# Spec
## API : /api/cms/manage
- GET : /list : 사용자 목록 조회 (페이징)
- POST : /create/admin : 관리자 사용자 생성
  - id : 필수
  - pwd : 필수
- POST : /create/employee : 업무 사용자 생성
  - id : 필수
  - pwd : 필수
- POST : /create/general : 일반 사용자 생성
  - id : 필수
  - pwd : 필수
- PUT : /update/{id} : 사용자 정보 업데이트
- DELETE : /delete/{id} : 사용자 삭제

## Request
- userId : 사용자가 입력하는 값 (ID, 필수)
- pwd : 사용자가 입력하는 값 (Password, 필수)
