# INSTACK 프레임워크 v1.0

## 프로젝트 기본 정보

| 항목 | 내용 |
|------|------|
| 프로젝트명 | `infomind.instack.api` |
| 루트 패키지 | `src/main/java/infomind/instack/api/` |
| 유형 | Spring Boot 기반 REST API 서버 |
| 특이사항 | eGovFrame(전자정부 프레임워크) 통합 |

## 기술 스택
- pom.xml 참고
- 현 상태 유지

## 패키지 구조 규칙
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
│   └── {domain}/    ← controller / dao / entity / model / repository / service/impl / mapper
├── cms/             ← 관리자 API (/api/cms/**)
│   └── {domain}/    ← 동일 구조
└── user/            ← 사용자 API (/api/user/**)
    └── {domain}/    ← controller / dao / entity / model / repository / service/impl / mapper
```

## Database
- INSTACK 프레임워크에 사용되는 테이블 내용은 `/DATABASE_instack/` 내의 파일을 참고한다.

## Code Convention
.editorconfig 참조

## Post Process
- 아래 사항은 AI 작업이 완료된 후 진행한다.
1. Branch가 Master라면 `ClaudeSession` Branch 생성 후에 Checkout 한다.
2. AI작업결과물만 Commit한다.