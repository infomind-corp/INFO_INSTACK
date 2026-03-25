# DATABASE
## 연관 테이블
- CMS_COM_MENU
- CMS_COM_AUTH_MENU
- CMS_COM_AUTH

## 기능
- CMS 및 사용자 페이지에서 사용하는 공통 코드 관리

# Spec
## API : /api/cms/menu
- GET : /top : 최상위 메뉴 조회
- GET : /top/{upMenuCd} : 대상 메뉴의 하위 메뉴 목록 조회
- GET : /{upMenuCd}/{menuCd} : 대상 메뉴 단일 조회
- POST : /top : 최상위 메뉴 생성
- POST : /{upMenuCd} : 대상 메뉴의 하위 메뉴 생성
- PUT : /{upMenuCd}/{menuCd} : 대상 메뉴 정보 수정
- DELETE : /{upMenuCd}/{menuCd} : 대상 메뉴 삭제 -> 하위 메뉴도 함께 삭제

## Request field
- upMenuCd : 상위 메뉴
- menuCd : 대상 메뉴 -> 하위 메뉴의 상위메뉴
- menuNm : 메뉴 명 (사용자 입력, 필수)

## DB field
