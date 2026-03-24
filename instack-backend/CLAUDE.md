# INSTACK 프레임워크 v1.0

## 프로젝트 기본 정보

| 항목 | 내용 |
|------|------|
| 프로젝트명 | `infomind.instack.api` |
| 루트 패키지 | `src/main/java/infomind/instack/api/` |
| 유형 | Spring Boot 기반 REST API 서버 |
| 특이사항 | eGovFrame(전자정부 프레임워크) 통합 |
| Database | Oracle 11g |

## 기술 스택
- 의존성은 `pom.xml` 참고
- 현 상태 유지 (임의 추가/변경 금지)

## 패키지 구조
```
/infomind/instack/api/
├── config/          ← 전역 설정 (Security, DataSource, JPA, CORS, eGov)
├── common/          ← 공통 모듈
│   ├── exception/   ← BizException, GlobalExceptionHandler
│   ├── model/       ← ApiResponse, PageRequest
│   ├── aop/         ← LogAspect
│   ├── filter/      ← IpBlockFilter
│   └── util/        ← JwtUtil, UuidUtil, FileUtil
├── auth/            ← JWT 인증
│   └── {domain}/    ← controller / dao / entity / model / service/impl / mapper
├── cms/             ← 관리자 API (/api/cms/**)
│   └── {domain}/    ← 동일 구조
└── user/            ← 사용자 API (/api/user/**)
    └── {domain}/    ← 동일 구조
```

## Database
- INSTACK 테이블 정의: `/DATABASE_instack/` 참고

---

## 코드 컨벤션

### 공통
- Swagger 어노테이션으로 API 문서화: `@Tag`, `@Operation`, `@Parameter`, `@ApiResponse`, `@Schema`

### Controller
- `ApiResponse` 객체로 응답 표준화
- 반환값 있음: `ApiResponse.ok({data})`
- 반환값 없음: `ApiResponse.ok()`

```java
@RestController
@RequestMapping("/api/{subject}/{domain}")
@RequiredArgsConstructor
@Tag(name = "...", description = "...")
public class {Domain}Controller {

    private final {Domain}Service {domain}Service;

    @GetMapping
    @Operation(summary = "목록 조회")
    public ApiResponse<List<{Domain}Response>> list({Domain}Request request) {
        return ApiResponse.ok({domain}Service.list(request));
    }

    @PostMapping
    @Operation(summary = "등록")
    public ApiResponse<Void> insert(@Valid @RequestBody {Domain}Request request) {
        {domain}Service.insert(request);
        return ApiResponse.ok();
    }
}
```

### Service
- `EgovAbstractServiceImpl` 상속 필수
- `BeanUtils.copyProperties(src, dest)`: 필드명이 동일한 경우 사용
- 필드명이 다른 경우 setter로 직접 매핑

```java
@Service
@RequiredArgsConstructor
public class {Domain}ServiceImpl extends EgovAbstractServiceImpl implements {Domain}Service {

    private final {Domain}Dao {domain}Dao;

    @Override
    public {Domain}Response select({Domain}Request request) {
        {Domain}VO vo = new {Domain}VO();
        BeanUtils.copyProperties(request, vo);
        {Domain}VO result = {domain}Dao.select{Domain}ById(vo.getId())
                .orElseThrow(() -> new BizException("", HttpStatus.NOT_FOUND));
        {Domain}Response response = new {Domain}Response();
        BeanUtils.copyProperties(result, response);
        return response;
    }
}
```

### Model (Request / Response)
- `@Getter`, `@Setter` 어노테이션만 사용
- `LocalDateTime`, `Date` 등 날짜/시간 타입은 `String`으로 매핑
- Request: Java Bean Validation 어노테이션으로 유효성 검사 적용 (`@NotBlank`, `@NotNull` 등)

### Entity (VO)
- DB 컬럼과 매핑되는 객체
- `@Getter`, `@Setter` 사용

### DAO
- MyBatis `@Mapper` 인터페이스로 작성
- 단건 조회는 `Optional<T>` 반환 (List 제외)
- 도메인 별 DAO 하나만 작성
- 파라미터가 2개 이상인 경우 `@Param` 어노테이션 사용

```java
@EgovMapper("{Domain}Dao")
public interface {Domain}Dao {
    List<{Domain}Response> select{Domain}List({Domain}Request request);
    Optional<{Domain}Response> select{Domain}ById(String id);
    void insert{Domain}({Domain}VO vo);
    void update{Domain}(@Param("id") String id, @Param("vo") {Domain}VO vo);
    void delete{Domain}(String id);
}
```

### Mapper XML
- 파일 위치: `src/main/resources/infomind/instack/api/{domain}/mapper/{dbtype}/{domain}_{dbtype}.xml`
- DB 타입별로 파일 분리 (oracle, mysql 등)
- XML 엔티티(`&lt;`, `&gt;`) 대신 `<![CDATA[ ]]>` 사용

```xml
<select id="select{Domain}List" resultType="...">
    SELECT *
    FROM {TABLE}
    <where>
        <if test="searchKeyword != null and searchKeyword != ''">
            AND NAME LIKE <![CDATA[ '%' || #{searchKeyword} || '%' ]]>
        </if>
    </where>
</select>
```

---

## Commit
- Branch가 `master`라면 `ClaudeSession` Branch 생성 후 Checkout한다.
