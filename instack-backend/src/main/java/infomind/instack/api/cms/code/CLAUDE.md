# DATABASE
## 연관 테이블
- CMS_COM_CODE

## 기능
- CMS 및 사용자 페이지에서 사용하는 공통 코드 관리

# Spec
## API : /api/cms/code
- GET : /top : 최상위 코드 조회
- GET : /top/{upCd} : 대상 코드의 하위 코드 목록 조회
- GET : /{upCd}/{cd} : 대상 코드 단일 조회
- POST : /top : 최상위 코드 생성
- POST : /{upCd} : 대상 코드의 하위 코드 생성
- PUT : /{upCd}/{cd} : 대상 코드 정보 수정
- DELETE : /{upCd}/{cd} : 대상 코드 삭제 -> 하위 코드도 함께 삭제

## Request field
- upCd : 상위 코드
- cd : 대상 코드 -> 하위 코드의 상위코드
- cdNm : 사용자가 입력하는 값 (사이트 코드, 필수)

## DB field
