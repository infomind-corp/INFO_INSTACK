# DATABASE
## 연관 테이블
- CMS_USER
- CMS_TASK_USER
- CMS_ADMIN_USER
- CMS_PASSWORD 

## 필드
- USER_SE : 'A'는 관리자, 'E'는 업무사용자, 'G'는 일반 사용자


# Spec
## API : /api/auth/admin-user
- GET : /list : 사용자 목록 조회
- POST : /create/admin : 관리자 사용자 생성
- POST : /create/employee : 업무 사용자 생성
- POST : /create/general : 일반 사용자 생성
- PUT : /update/{id} : 사용자 정보 업데이트
- DELETE : /delete/{id} : 사용자 삭제