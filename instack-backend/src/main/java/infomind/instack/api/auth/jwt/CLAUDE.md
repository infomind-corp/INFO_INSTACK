# DATABASE
## 연관 테이블
- CMS_RF_TK
- CMS_USER
- CMS_USER_TASK
- CMS_USER_ADMIN
- CMS_PWD

## 필드
- USER_SE : 'A'는 관리자, 'E'는 업무사용자, 'G'는 일반 사용자


# Spec
## API : /api/auth/jwt
- POST : {userSe}/login
- POST : /refresh
- GET : /logout
