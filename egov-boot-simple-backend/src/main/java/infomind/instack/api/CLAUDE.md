## Controller
- ApiResponse 객체를 반환하여 API 응답을 표준화한다.
```java
@RestController
@RequestMapping("/api/{subject}/{domain}")
@RequiredArgsConstructor
public class {domain}Controller {

    private final {domain}Service {domain}Service;

    // GET 요청은 반환값이 있는 경우 ApiResponse.ok({data}) 형태로 반환한다.
    @GetMapping("/{action}")
    public ApiResponse<{action}Response> {action}(@RequestBody {action}Request request) {
        return ApiResponse.ok({domain}Service.{action}(request));
    }
    
    // POST, PUT, DELETE 등은 반환값이 없는 경우 ApiResponse.ok() 형태로 반환한다.
    @PostMapping("/{action}")
    public ApiResponse<{action}Response> {action}(@RequestBody {action}Request request) {
        {domain}Service.{action}(request)
        return ApiResponse.ok();
    }
}
```

## Service
- 모든 Service 클래스는 EgovAbstractServiceImpl 상속해야 한다.

```java
@Service
@RequiredArgsConstructor
public class {domain}ServiceImpl extends EgovAbstractServiceImpl implements {domain}Service {

    private final {domain}Dao {domain}Dao;

    @Override
    public {domain}Response {action}({action}Request {action}Request) {
        {domain}VO {domain}VO = new {domain}VO();
        // 동일하지 않은 경우 setter로 직접 매핑한다.
        BeanUtils.copyProperties({action}Request, {domain}VO);      // request와 VO의 각 필드명이 동일한 경우 BeanUtils로 복사한다.
        {domain}VO {domain}VO = {domain}Dao.select{domain}By{domain}VO({domain}VO)
                .orElseThrow(() -> new BizException("", {HTTP_STATUS}));
        BeanUtils.copyProperties({domain}VO, new {domain}Response());
        
                
        return {domain}Response;
    }
}
```

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