## Controller
- ApiResponse 객체를 반환하여 API 응답을 표준화한다.

## Service
- 모든 Service 클래스는 EgovAbstractServiceImpl 상속해야 한다.

## Model
- Request 는 Controller에 요청된 값과 매핑하는 객체로 사용한다.
- Response 는 Controller에서 반환되는 객체로 사용한다.
- @Getter, @Setter 어노테이션만 사용한다.
- LocalDateTime, Date 등의 날짜 시간 타입은 String으로 매핑하여 사용한다.

## DAO
- MyBatis interface 형태로 작성한다.
- @Mapper 어노테이션을 사용하여 매핑한다.
- List가 아닌 반환 객체는 Optional<T> 형태로 반환한다. (MyBatis, JPA 모두 동일)
- DAO는 도메인 별로 하나만 작성한다.

## Mapper
- MyBatis Mapper XML은 `{domain}_{dbtype}.sql` 로 DB별 분리