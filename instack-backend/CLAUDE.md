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
├── config/
│   └── security/        ← SecurityConfig, WebMvcConfig, CustomAuthenticationPrincipalResolver
├── common/
│   ├── model/           ← ApiResponse, PageRequest, PageResponse
│   ├── exception/       ← BizException, GlobalExceptionHandler
│   ├── entity/          ← BaseAuditVO (공통 감사 VO)
│   ├── aop/             ← AuditAspect, AuditLog, AuditLogAspect
│   ├── filter/          ← AuthenticationFilter, HTMLTagFilter, IpBlockFilter
│   └── util/            ← AuditHolder, JwtUtil, UuidUtil, FileUtil
│                          └── jwt/ ← EgovJwtTokenUtil, JwtAuthenticationFilter
├── auth/
│   ├── admin/           ← controller / service/impl / dao / entity / model
│   └── basic/           ← entity / model (LoginRequest, LoginResponse, RefreshRequest)
├── cms/                 ← 관리자 API (/api/cms/**)
│   └── {domain}/        ← controller / service/impl / dao / entity / model
└── user/                ← 사용자 API (/api/user/**)
    └── {domain}/        ← 동일 구조
```

## Database
- INSTACK 테이블 정의: `/DATABASE_instack/` 참고

---

## 코드 컨벤션

### 공통
- Swagger 어노테이션으로 API 문서화: `@Tag`, `@Operation`, `@Parameter`, `@ApiResponse`, `@Schema`
- Javadoc 형식의 주석 사용
  - Service - 클래스 및 메서드 단위로 설명 주석 작성
  - Request/Response - 필드 단위로 설명 주석 작성
  - Configuration, Aspect, Filter 등 - 클래스 및 주요 메서드에 설명 주석 작성

### Controller

```java
@RestController
@RequestMapping("/api/{subject}/{domain}")
@RequiredArgsConstructor
@Tag(name = "...", description = "...")
public class {Domain}Controller {

    private final {Domain}Service {domain}Service;

    @AuditLog(action = "목록 조회")
    @GetMapping
    @Operation(summary = "목록 조회")
    public ApiResponse<List<{Domain}Response>> list({Domain}Request request) {
        return ApiResponse.ok({domain}Service.list(request));
    }

    @AuditLog(action = "등록")
    @PostMapping
    @Operation(summary = "등록")
    public ApiResponse<Void> insert(@Valid @RequestBody {Domain}Request request) {
        {domain}Service.insert(request);
        return ApiResponse.ok();
    }
}
```

- `ApiResponse.ok({data})`: 반환값 있음
- `ApiResponse.ok()`: 반환값 없음

### Service
- `EgovAbstractServiceImpl` 상속 필수
- `BeanUtils.copyProperties(src, dest)`: 필드명이 동일한 경우 사용
- 필드명이 다른 경우 setter로 직접 매핑
- 다중 쿼리가 포함된 `@Override` 메서드는 `@Transactional` 적용

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
- 페이지 목록 응답 시 `PageResponse<T>` 사용

### Entity (VO)
- DB 컬럼과 매핑되는 객체
- `@Getter`, `@Setter` 사용
- 감사 컬럼(CRT_AT, CRT_BY, CRT_IP, CRT_PGM, UPD_AT, UPD_BY, UPD_IP, UPD_PGM) 포함 시 `BaseAuditVO` 상속
  - `BaseAuditVO`는 추상 클래스이며, 생성자에서 `AuditHolder`를 통해 BY/IP/PGM 자동 주입
  - AT 컬럼은 SQL에서 `SYSDATE`로 처리

### DAO
- MyBatis `@EgovMapper` 인터페이스로 작성
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
- 파일 위치: `src/main/resources/infomind/instack/api/{subject}/{domain}/mapper/oracle/{domain}_oracle.xml`
- DB 타입별로 파일 분리 (oracle, mysql 등)
- XML 엔티티(`&lt;`, `&gt;`) 대신 `<![CDATA[ ]]>` 사용
- 감사 컬럼 INSERT/UPDATE 시 `auditFragment` 사용 (위치: `common/mapper/oracle/audit_oracle.xml`)
  - **일반 엔티티**: `auditFragment.insertColumns`, `auditFragment.insertValues` 사용
  - **히스토리/로그 테이블**: `auditFragment.insertColumnsForHistory`, `auditFragment.insertValuesForHistory` 사용 (UPD 컬럼 제외)

```xml
<!-- INSERT 예시 (일반 엔티티) -->
<insert id="insert{Domain}" parameterType="...">
    INSERT INTO {TABLE} (
        ID,
        NAME,
        <include refid="auditFragment.insertColumns"/>
    ) VALUES (
        #{id},
        #{name},
        <include refid="auditFragment.insertValues"/>
    )
</insert>

<!-- INSERT 예시 (히스토리/로그 테이블 - UPD 컬럼 없음) -->
<insert id="insert{Domain}History" parameterType="...">
    INSERT INTO {HISTORY_TABLE} (
        ID,
        VALUE,
        <include refid="auditFragment.insertColumnsForHistory"/>
    ) VALUES (
        #{id},
        #{value},
        <include refid="auditFragment.insertValuesForHistory"/>
    )
</insert>

<!-- UPDATE 예시 (@Param("vo") 패턴) -->
<update id="update{Domain}">
    UPDATE {TABLE}
    SET NAME   = #{vo.name},
        <include refid="auditFragment.updateSet"/>
    WHERE ID = #{id}
</update>

<!-- 목록 조회 예시 -->
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

### 감사(Audit) 자동화 구조
- `AuditAspect`: `*.service.impl.*` 메서드 실행 시 AuditHolder에 감사 정보 자동 등록
  - `crtBy`/`updBy`: SecurityContext의 로그인 사용자 ID
  - `crtIp`/`updIp`: 요청 클라이언트 IP (X-Forwarded-For 우선)
  - `crtPgm`/`updPgm`: `{ServiceClass}.{method}` 형식
- `BaseAuditVO` 상속 VO 생성 시 생성자에서 자동 채워짐 → 코드에서 별도 세팅 불필요

### 예외 처리
- `BizException(message)`: HTTP 400 응답
- `BizException(message, HttpStatus)`: 지정 HTTP 상태로 응답
- `GlobalExceptionHandler`가 `ApiResponse` 형태로 일괄 변환
