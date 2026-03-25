# DATABASE
## 연관 테이블
- CMS_COM_MENU
- CMS_COM_AUTH_MENU
- CMS_COM_AUTH

## 기능
- CMS 및 사용자 페이지에서 사용하는 공통 코드 관리

# Spec
## API : /api/cms/menu
- GET : / : 하위 메뉴 목록 조회 (upMenuCd 쿼리 파라미터)
- GET : /{menuCd} : 대상 메뉴 상세 조회
- POST : / : 메뉴 생성
- PUT : /{menuCd} : 메뉴 정보 수정
- DELETE : /{menuCd} : 대상 메뉴 삭제 -> 하위 메뉴도 함께 삭제

## Request field
- upMenuCd : 상위 메뉴 (필수 아님. 빈 값으로 들어 갈 수 있음)
- menuCd : 대상 메뉴 (필수)
- menuNm : 메뉴 명 (필수)

## DB field
