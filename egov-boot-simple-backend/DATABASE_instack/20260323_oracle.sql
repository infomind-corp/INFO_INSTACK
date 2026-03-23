-- ============================================================
-- Oracle DDL - INS_APP Schema
-- Converted from CUBRID DDL
-- ============================================================

-- [00.시스템]01.일반 사용자
CREATE TABLE "INS_APP"."CMS_USER" (
                                      "USER_ID"       VARCHAR2(100)  NOT NULL,
                                      "USER_NM"       VARCHAR2(100)  NULL,
                                      "MTELNO"        VARCHAR2(20)   NULL,
                                      "TELNO"         VARCHAR2(20)   NULL,
                                      "GNDR_SE"       VARCHAR2(20)   NULL,
                                      "EML"           VARCHAR2(100)  NULL,
                                      "ADDR"          VARCHAR2(255)  NULL,
                                      "DADDR"         VARCHAR2(255)  NULL,
                                      "ZIP"           VARCHAR2(10)   NULL,
                                      "ACC_EXP_YMD"   DATE           NULL,
                                      "EML_CERT_YN"   VARCHAR2(1)    NULL,
                                      "TELNO_CERT_YN" VARCHAR2(1)    NULL,
                                      "LST_LGN_DT"    TIMESTAMP      NULL,
                                      "LST_LGN_IP"    VARCHAR2(40)   NULL,
                                      "WD_DT"         DATE           NULL,
                                      "USER_STS_SE"   VARCHAR2(20)   NULL,
                                      "CI"            VARCHAR2(100)  NULL,
                                      "DI"            VARCHAR2(100)  NULL,
                                      "CRT_AT"        DATE           NOT NULL,
                                      "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                      "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                      "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                      "UPD_AT"        DATE           NOT NULL,
                                      "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                      "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                      "UPD_PGM"       VARCHAR2(100)  NOT NULL,
                                      CONSTRAINT "PK_CMS_USER" PRIMARY KEY ("USER_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_USER"             IS '[00.시스템]01.일반 사용자';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."USER_ID"       IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."USER_NM"       IS '사용자 명';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."MTELNO"        IS '휴대전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."TELNO"         IS '전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."GNDR_SE"       IS '성별 구분';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."EML"           IS '이메일';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."ADDR"          IS '주소';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."DADDR"         IS '상세주소';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."ZIP"           IS '우편번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."ACC_EXP_YMD"   IS '접근 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."EML_CERT_YN"   IS '이메일 인증 여부';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."TELNO_CERT_YN" IS '전화번호 인증 여부';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."LST_LGN_DT"    IS '최종 로그인 일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."LST_LGN_IP"    IS '최종 로그인 IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."WD_DT"         IS '탈퇴 일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."USER_STS_SE"   IS '공통 코드로 관리';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."CI"            IS 'CI';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."DI"            IS 'DI';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."CRT_AT"        IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."CRT_BY"        IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."CRT_IP"        IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."CRT_PGM"       IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."UPD_AT"        IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."UPD_BY"        IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."UPD_IP"        IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER"."UPD_PGM"       IS '수정프로그램';


-- [00.시스템]02.업무 사용자
CREATE TABLE "INS_APP"."CMS_TASK_USER" (
                                           "TASK_USER_ID"  VARCHAR2(100)  NOT NULL,
                                           "USER_NM"       VARCHAR2(100)  NULL,
                                           "GNDR_SE"       VARCHAR2(20)   NULL,
                                           "MTELNO"        VARCHAR2(20)   NULL,
                                           "EML"           VARCHAR2(100)  NULL,
                                           "TELNO"         VARCHAR2(20)   NULL,
                                           "ADDR"          VARCHAR2(255)  NULL,
                                           "DADDR"         VARCHAR2(255)  NULL,
                                           "AUTH_EXP_YMD"  VARCHAR2(8)    NULL,
                                           "AUTH_GRNT_YMD" VARCHAR2(8)    NULL,
                                           "AUTH_RVK_SE"   VARCHAR2(20)   NULL,
                                           "USER_STS_SE"   VARCHAR2(20)   NULL,
                                           "DEPT_CD"       VARCHAR2(20)   NULL,
                                           "ORG_CD"        VARCHAR2(20)   NULL,
                                           "CI"            VARCHAR2(100)  NULL,
                                           "DI"            VARCHAR2(100)  NULL,
                                           "CRT_AT"        DATE           NOT NULL,
                                           "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                           "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                           "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                           "UPD_AT"        DATE           NOT NULL,
                                           "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                           "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                           "UPD_PGM"       VARCHAR2(100)  NOT NULL,
                                           CONSTRAINT "PK_CMS_TASK_USER" PRIMARY KEY ("TASK_USER_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_TASK_USER"                IS '[00.시스템]02.업무 사용자';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."TASK_USER_ID"  IS '업무사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."USER_NM"       IS '사용자 명';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."GNDR_SE"       IS '성별 구분';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."MTELNO"        IS '휴대전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."EML"           IS '이메일';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."TELNO"         IS '전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."ADDR"          IS '주소';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."DADDR"         IS '상세주소';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."AUTH_EXP_YMD"  IS '권한 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."AUTH_GRNT_YMD" IS '권한 부여 일자';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."AUTH_RVK_SE"   IS '권한 부여일 초과, 만료일 초과';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."USER_STS_SE"   IS '활성화, 비활성화';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."DEPT_CD"       IS '부서 코드';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."ORG_CD"        IS '조직 코드';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."CI"            IS 'CI';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."DI"            IS 'DI';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."CRT_AT"        IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."CRT_BY"        IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."CRT_IP"        IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."CRT_PGM"       IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."UPD_AT"        IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."UPD_BY"        IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."UPD_IP"        IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_TASK_USER"."UPD_PGM"       IS '수정프로그램';


-- [00.시스템]03.관리자 사용자
CREATE TABLE "INS_APP"."CMS_ADMIN_USER" (
                                            "ADM_ID"        VARCHAR2(100)  NOT NULL,
                                            "USER_NM"       VARCHAR2(100)  NULL,
                                            "EML"           VARCHAR2(100)  NULL,
                                            "MTELNO"        VARCHAR2(20)   NULL,
                                            "GNDR_SE"       VARCHAR2(20)   NULL,
                                            "TELNO"         VARCHAR2(20)   NULL,
                                            "ADDR"          VARCHAR2(255)  NULL,
                                            "DADDR"         VARCHAR2(255)  NULL,
                                            "AUTH_EXP_YMD"  VARCHAR2(8)    NULL,
                                            "AUTH_GRNT_YMD" VARCHAR2(8)    NULL,
                                            "AUTH_RVK_SE"   VARCHAR2(20)   NULL,
                                            "ADM_STS_SE"    VARCHAR2(20)   NULL,
                                            "DEPT_CD"       VARCHAR2(20)   NULL,
                                            "ORG_CD"        VARCHAR2(20)   NULL,
                                            "CI"            VARCHAR2(100)  NULL,
                                            "DI"            VARCHAR2(100)  NULL,
                                            "CRT_AT"        DATE           NOT NULL,
                                            "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                            "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                            "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                            "UPD_AT"        DATE           NOT NULL,
                                            "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                            "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                            "UPD_PGM"       VARCHAR2(100)  NOT NULL,
                                            CONSTRAINT "PK_CMS_ADMIN_USER" PRIMARY KEY ("ADM_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_ADMIN_USER"                IS '[00.시스템]03.관리자 사용자';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."ADM_ID"        IS '관리자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."USER_NM"       IS '사용자 명';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."EML"           IS '이메일';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."MTELNO"        IS '휴대전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."GNDR_SE"       IS '성별 구분';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."TELNO"         IS '전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."ADDR"          IS '주소';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."DADDR"         IS '상세주소';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."AUTH_EXP_YMD"  IS '권한 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."AUTH_GRNT_YMD" IS '권한 부여 일자';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."AUTH_RVK_SE"   IS '권한 부여일 초과, 만료일 초과';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."ADM_STS_SE"    IS '공통코드| 활성화vs비활성화';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."DEPT_CD"       IS '부서 코드';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."ORG_CD"        IS '조직 코드';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."CI"            IS 'CI';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."DI"            IS 'DI';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."CRT_AT"        IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."CRT_BY"        IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."CRT_IP"        IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."CRT_PGM"       IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."UPD_AT"        IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."UPD_BY"        IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."UPD_IP"        IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_ADMIN_USER"."UPD_PGM"       IS '수정프로그램';


-- [00.시스템]04.비밀번호
CREATE TABLE "INS_APP"."CMS_PASSWORD" (
                                          "USER_ID"       VARCHAR2(100)  NOT NULL,
                                          "USER_SE"       VARCHAR2(20)   NOT NULL,
                                          "PWD"           VARCHAR2(100)  NOT NULL,
                                          "USE_YN"        VARCHAR2(1)    NOT NULL,
                                          "PWD_FAIL_CNT"  NUMBER(10)     NULL,
                                          "PWD_CHG_YMD"   DATE           NULL,
                                          "PWD_CHG_SE"    VARCHAR2(20)   NULL,
                                          "PWD_EXP_YMD"   DATE           NULL,
                                          "CRT_AT"        DATE           NOT NULL,
                                          "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                          "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                          "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                          "UPD_AT"        DATE           NOT NULL,
                                          "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                          "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                          "UPD_PGM"       VARCHAR2(100)  NOT NULL,
                                          CONSTRAINT "PK_CMS_PASSWORD" PRIMARY KEY ("USER_ID", "USER_SE")
);

COMMENT ON TABLE  "INS_APP"."CMS_PASSWORD"               IS '[00.시스템]04.비밀번호';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."USER_ID"      IS '업무사용자, 사용자, 관리자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."USER_SE"      IS '관리자, 사용자, 업무사용자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."PWD"          IS '비밀번호';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."USE_YN"       IS '사용여부';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."PWD_FAIL_CNT" IS '비밀번호 실패 횟수';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."PWD_CHG_YMD"  IS '비밀번호 변경 일자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."PWD_CHG_SE"   IS '관리자,만료,단순';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."PWD_EXP_YMD"  IS '비밀번호 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."CRT_AT"       IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."CRT_BY"       IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."CRT_IP"       IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."CRT_PGM"      IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."UPD_AT"       IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."UPD_BY"       IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."UPD_IP"       IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD"."UPD_PGM"      IS '수정프로그램';


-- [00.시스템]05.비밀번호 히스토리
CREATE TABLE "INS_APP"."CMS_PASSWORD_HISTORY" (
                                                  "SN"           NUMBER(20)     NOT NULL,
                                                  "PWD"          VARCHAR2(100)  NOT NULL,
                                                  "PWD_CHG_YMD"  TIMESTAMP      NOT NULL,
                                                  "PWD_CHG_SE"   VARCHAR2(20)   NULL,
                                                  "CHG_USER_ID"  VARCHAR2(100)  NOT NULL,
                                                  "USER_SE"      VARCHAR2(20)   NOT NULL,
                                                  "CHG_USER_IP"  VARCHAR2(40)   NULL,
                                                  "EXP_TMG"      TIMESTAMP      NULL,
                                                  "CRT_AT"       TIMESTAMP      NOT NULL,
                                                  "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                                  "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                                  "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                                  CONSTRAINT "PK_CMS_PASSWORD_HISTORY" PRIMARY KEY ("SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_PASSWORD_HISTORY"              IS '[00.시스템]05.비밀번호 히스토리';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."SN"          IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."PWD"         IS '비밀번호';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."PWD_CHG_YMD" IS '비밀번호 변경 일자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."PWD_CHG_SE"  IS '비밀번호 변경 구분';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CHG_USER_ID" IS '업무사용자, 사용자, 관리자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."USER_SE"     IS '관리자, 사용자, 업무사용자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CHG_USER_IP" IS '변경 사용자 아이피';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."EXP_TMG"     IS '만료 시기';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CRT_AT"      IS '등록 일시';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CRT_BY"      IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CRT_IP"      IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PASSWORD_HISTORY"."CRT_PGM"     IS '등록프로그램';


-- [00.시스템]06.갱신 토큰
CREATE TABLE "INS_APP"."CMS_REFRESH_TOKEN" (
                                               "TK_ID"    VARCHAR2(100)  NOT NULL,
                                               "USER_ID"  VARCHAR2(100)  NOT NULL,
                                               "TK"       VARCHAR2(100)  NOT NULL,
                                               "EXP_DT"   DATE           NOT NULL,
                                               "RVK_YN"   VARCHAR2(1)    NOT NULL,
                                               "IP_ADDR"  VARCHAR2(40)   NULL,
                                               "USER_AGT" VARCHAR2(100)  NULL,
                                               "CRT_AT"   DATE           NOT NULL,
                                               "CRT_BY"   VARCHAR2(100)  NOT NULL,
                                               "CRT_IP"   VARCHAR2(40)   NOT NULL,
                                               "CRT_PGM"  VARCHAR2(100)  NOT NULL,
                                               "UPD_AT"   DATE           NOT NULL,
                                               "UPD_BY"   VARCHAR2(100)  NOT NULL,
                                               "UPD_IP"   VARCHAR2(40)   NOT NULL,
                                               "UPD_PGM"  VARCHAR2(100)  NOT NULL,
                                               CONSTRAINT "PK_CMS_REFRESH_TOKEN" PRIMARY KEY ("TK_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_REFRESH_TOKEN"           IS '[00.시스템]06.갱신 토큰';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."TK_ID"   IS '토큰 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."USER_ID" IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."TK"      IS 'TOKEN';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."EXP_DT"  IS 'EXPIRES_AT';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."RVK_YN"  IS 'REVOKED_YN';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."IP_ADDR" IS '아이피 주소';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."USER_AGT" IS 'USER_AGENT';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."CRT_AT"  IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."CRT_BY"  IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."CRT_IP"  IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."CRT_PGM" IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."UPD_AT"  IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."UPD_BY"  IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."UPD_IP"  IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_REFRESH_TOKEN"."UPD_PGM" IS '수정프로그램';


-- [00.시스템]07.사용자 SNS 연동
-- 주의: CUBRID 원본에 <데이터 타입 없음> 컬럼은 VARCHAR2(100)으로 처리
CREATE TABLE "INS_APP"."CMS_USER_SNS_INTERFACE" (
                                                    "SN"          NUMBER(15)     NOT NULL,
                                                    "USER_ID"     VARCHAR2(100)  NOT NULL,
                                                    "USER_SE"     VARCHAR2(20)   NOT NULL,
                                                    "PRVD"        VARCHAR2(100)  NOT NULL,
                                                    "PRVD_UID"    VARCHAR2(50)   NULL,
                                                    "PRVD_EML"    VARCHAR2(100)  NULL,
                                                    "IF_DESC"     VARCHAR2(4000) NULL,
                                                    "ACC_TK"      VARCHAR2(100)  NULL,
                                                    "RF_TK"       VARCHAR2(100)  NULL,
                                                    "TK_EXP_DT"   DATE           NULL,
                                                    "MAIN_LGN_YN" VARCHAR2(1)    NULL,
                                                    "LGN_AVL_YN"  VARCHAR2(1)    NULL,
                                                    "LST_LGN_DT"  TIMESTAMP      NULL,
                                                    "IF_STS_SE"   VARCHAR2(20)   NULL,
                                                    "IF_FST_TMG"  TIMESTAMP      NULL,
                                                    "IF_END_TMG"  TIMESTAMP      NULL,
                                                    "IF_IP"       VARCHAR2(40)   NULL,
                                                    CONSTRAINT "PK_CMS_USER_SNS_INTERFACE" PRIMARY KEY ("SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_USER_SNS_INTERFACE"              IS '[00.시스템]07.사용자 SNS 연동';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."SN"          IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."USER_ID"     IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."USER_SE"     IS '사용자 구분';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."PRVD"        IS 'provider (구글, 카카오, 네이버, 애플)';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."PRVD_UID"    IS '공급자 UID';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."PRVD_EML"    IS '공급자 이메일';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."IF_DESC"     IS '추가 컬럼';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."ACC_TK"      IS '암호화';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."RF_TK"       IS '암호화';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."TK_EXP_DT"   IS '토큰 만료 일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."MAIN_LGN_YN" IS '주요 로그인 방식으로 사용하는지';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."LGN_AVL_YN"  IS '로그인 가능, 불가능';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."LST_LGN_DT"  IS '최종 로그인 일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."IF_STS_SE"   IS '활성화, 비활성화';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."IF_FST_TMG"  IS '연동 최초 시기';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."IF_END_TMG"  IS '연동 종료 시기';
COMMENT ON COLUMN "INS_APP"."CMS_USER_SNS_INTERFACE"."IF_IP"       IS '연동 아이피';


-- [00.시스템]08.사용자 권한
CREATE TABLE "INS_APP"."CMS_USER_AUTH" (
                                           "USER_ID"       VARCHAR2(100)  NOT NULL,
                                           "AUTH_CD"       VARCHAR2(20)   NOT NULL,
                                           "AUTH_EXP_YMD"  VARCHAR2(8)    NULL,
                                           "AUTH_GRNT_YMD" VARCHAR2(8)    NULL,
                                           "AUTH_SE"       VARCHAR2(20)   NULL,
                                           "CRT_AT"        DATE           NOT NULL,
                                           "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                           "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                           "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                           "UPD_AT"        DATE           NOT NULL,
                                           "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                           "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                           "UPD_PGM"       VARCHAR2(100)  NOT NULL,
                                           CONSTRAINT "PK_CMS_USER_AUTH" PRIMARY KEY ("USER_ID", "AUTH_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_USER_AUTH"                IS '[00.시스템]08.사용자 권한';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."USER_ID"       IS '업무사용자, 관리자, 일반사용자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."AUTH_CD"       IS '권한 테이블';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."AUTH_EXP_YMD"  IS '권한 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."AUTH_GRNT_YMD" IS '권한 부여 일자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."AUTH_SE"       IS '전체,부서,개인';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."CRT_AT"        IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."CRT_BY"        IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."CRT_IP"        IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."CRT_PGM"       IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."UPD_AT"        IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."UPD_BY"        IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."UPD_IP"        IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH"."UPD_PGM"       IS '수정프로그램';


-- [00.시스템]09.사용자 권한 로그
CREATE TABLE "INS_APP"."CMS_USER_AUTH_LOG" (
                                               "LOG_DT"        DATE           NULL,
                                               "LOG_RSN"       VARCHAR2(4000) NULL,
                                               "USER_ID"       VARCHAR2(100)  NOT NULL,
                                               "AUTH_CD"       VARCHAR2(20)   NOT NULL,
                                               "AUTH_EXP_YMD"  VARCHAR2(8)    NULL,
                                               "AUTH_GRNT_YMD" VARCHAR2(8)    NULL,
                                               "AUTH_SE"       VARCHAR2(20)   NULL,
                                               "CRT_AT"        DATE           NOT NULL,
                                               "CRT_BY"        VARCHAR2(100)  NOT NULL,
                                               "CRT_IP"        VARCHAR2(40)   NOT NULL,
                                               "CRT_PGM"       VARCHAR2(100)  NOT NULL,
                                               "UPD_AT"        DATE           NOT NULL,
                                               "UPD_BY"        VARCHAR2(100)  NOT NULL,
                                               "UPD_IP"        VARCHAR2(40)   NOT NULL,
                                               "UPD_PGM"       VARCHAR2(100)  NOT NULL
);

COMMENT ON TABLE  "INS_APP"."CMS_USER_AUTH_LOG"                IS '[00.시스템]09.사용자 권한 로그';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."LOG_DT"        IS '로그 일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."LOG_RSN"       IS '로그 사유';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."USER_ID"       IS '업무사용자, 관리자, 일반사용자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."AUTH_CD"       IS '권한 테이블';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."AUTH_EXP_YMD"  IS '권한 만료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."AUTH_GRNT_YMD" IS '권한 부여 일자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."AUTH_SE"       IS '전체,부서,개인';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."CRT_AT"        IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."CRT_BY"        IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."CRT_IP"        IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."CRT_PGM"       IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."UPD_AT"        IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."UPD_BY"        IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."UPD_IP"        IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_AUTH_LOG"."UPD_PGM"       IS '수정프로그램';


-- [00.시스템]10.사용자 인증
CREATE TABLE "INS_APP"."CMS_USER_CERT" (
                                           "SN"      NUMBER(15)     NOT NULL,
                                           "CERT_ID" VARCHAR2(100)  NOT NULL,
                                           "MTELNO"  VARCHAR2(20)   NULL,
                                           "EML"     VARCHAR2(1)    NULL,
                                           "CERT_SE" VARCHAR2(20)   NULL,
                                           "CERT_NO" VARCHAR2(100)  NOT NULL,
                                           "CRT_AT"  DATE           NOT NULL,
                                           "CRT_BY"  VARCHAR2(100)  NOT NULL,
                                           "CRT_IP"  VARCHAR2(40)   NOT NULL,
                                           "CRT_PGM" VARCHAR2(100)  NOT NULL,
                                           "UPD_AT"  DATE           NOT NULL,
                                           "UPD_BY"  VARCHAR2(100)  NOT NULL,
                                           "UPD_IP"  VARCHAR2(40)   NOT NULL,
                                           "UPD_PGM" VARCHAR2(100)  NOT NULL,
                                           CONSTRAINT "PK_CMS_USER_CERT" PRIMARY KEY ("SN", "CERT_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_USER_CERT"          IS '[00.시스템]10.사용자 인증';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."SN"      IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CERT_ID" IS '인증 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."MTELNO"  IS '휴대전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."EML"     IS '이메일';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CERT_SE" IS '이메일,휴대전화번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CERT_NO" IS '인증 번호';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CRT_AT"  IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CRT_BY"  IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CRT_IP"  IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."CRT_PGM" IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."UPD_AT"  IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."UPD_BY"  IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."UPD_IP"  IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_USER_CERT"."UPD_PGM" IS '수정프로그램';


-- [00.시스템]11.개인정보 조회 이력 로그
CREATE TABLE "INS_APP"."CMS_PRIVACY_SEARCH_LOG" (
                                                    "SN"          NUMBER(15)     NOT NULL,
                                                    "SITE_SE"     VARCHAR2(20)   NULL,
                                                    "SITE_CD"     VARCHAR2(20)   NULL,
                                                    "ACC_USER_ID" VARCHAR2(100)  NULL,
                                                    "ACC_USER_NM" VARCHAR2(100)  NULL,
                                                    "TGT_USER_ID" VARCHAR2(100)  NULL,
                                                    "TGT_USER_NM" VARCHAR2(100)  NULL,
                                                    "QRY_RSN"     VARCHAR2(4000) NULL,
                                                    "QRY_PATH"    VARCHAR2(1000) NULL,
                                                    "ACC_IP"      VARCHAR2(40)   NULL,
                                                    "USER_AGT"    VARCHAR2(100)  NULL,
                                                    "EXP_DT"      DATE           NULL,
                                                    "CRT_AT"      DATE           NULL,
                                                    CONSTRAINT "PK_CMS_PRIVACY_SEARCH_LOG" PRIMARY KEY ("SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_PRIVACY_SEARCH_LOG"              IS '[00.시스템]11.개인정보 조회 이력 로그';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."SN"          IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."SITE_SE"     IS 'CMS| 사용자';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."SITE_CD"     IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."ACC_USER_ID" IS '접근 사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."ACC_USER_NM" IS '삭제돼도 보존';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."TGT_USER_ID" IS '타겟 사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."TGT_USER_NM" IS '타겟 사용자 이름';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."QRY_RSN"     IS '본인확인, 회원정보 확인';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."QRY_PATH"    IS 'URL';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."ACC_IP"      IS '접근 아이피';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."USER_AGT"    IS '사용자 에이전트';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."EXP_DT"      IS '법적 보관 만료기한';
COMMENT ON COLUMN "INS_APP"."CMS_PRIVACY_SEARCH_LOG"."CRT_AT"      IS '등록 일시';


-- [00.시스템]12.사용자 전환 로그인 로그
CREATE TABLE "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG" (
                                                       "COL"     NUMBER(15)     NOT NULL,
                                                       "TGT_ID"  VARCHAR2(100)  NULL,
                                                       "USER_SE" VARCHAR2(20)   NULL,
                                                       "USER_ID" VARCHAR2(100)  NULL,
                                                       "USE_DT"  DATE           NULL,
                                                       "USE_IP"  VARCHAR2(40)   NULL,
                                                       CONSTRAINT "PK_CMS_SWITCH_USER_LOGIN_LOG" PRIMARY KEY ("COL")
);

COMMENT ON TABLE  "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"         IS '[00.시스템]12.사용자 전환 로그인 로그';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."COL"    IS 'SN';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."TGT_ID" IS '타겟 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."USER_SE" IS '사용자 구분';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."USER_ID" IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."USE_DT" IS '사용 일시';
COMMENT ON COLUMN "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"."USE_IP" IS '사용 아이피';


-- [00.시스템]98.푸시 토큰
-- 주의: <데이터 타입 없음> 컬럼은 적절한 타입으로 처리
CREATE TABLE "INS_APP"."CMS_PUSH_TOKEN" (
                                            "SN"              NUMBER(15)     NOT NULL,
                                            "SITE_CD"         VARCHAR2(20)   NOT NULL,
                                            "USER_ID"         VARCHAR2(100)  NOT NULL,
                                            "USER_SE"         VARCHAR2(20)   NULL,
                                            "DVC_ID"          VARCHAR2(100)  NULL,
                                            "DVC_NM"          VARCHAR2(100)  NULL,
                                            "DVC_SE"          VARCHAR2(20)   NOT NULL,
                                            "OS_VER"          VARCHAR2(50)   NULL,
                                            "APP_VER"         VARCHAR2(50)   NULL,
                                            "PUSH_CH"         VARCHAR2(20)   NULL,
                                            "PUSH_TK"         VARCHAR2(100)  NOT NULL,
                                            "_"               VARCHAR2(100)  NULL,
                                            "USE_YN"          VARCHAR2(1)    NULL,
                                            "PUSH_AGR_YN"     VARCHAR2(1)    NULL,
                                            "LST_PUSH_USE_TMG" TIMESTAMP     NULL,
                                            "TK_EXP_TMG"      TIMESTAMP      NULL,
                                            "CRT_AT"          DATE           NOT NULL,
                                            "CRT_BY"          VARCHAR2(100)  NOT NULL,
                                            "CRT_IP"          VARCHAR2(40)   NOT NULL,
                                            "CRT_PGM"         VARCHAR2(100)  NOT NULL,
                                            "UPD_AT"          DATE           NOT NULL,
                                            "UPD_BY"          VARCHAR2(100)  NOT NULL,
                                            "UPD_IP"          VARCHAR2(40)   NOT NULL,
                                            "UPD_PGM"         VARCHAR2(100)  NOT NULL,
                                            CONSTRAINT "PK_CMS_PUSH_TOKEN" PRIMARY KEY ("SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_PUSH_TOKEN"                   IS '[00.시스템]98.푸시 토큰';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."SN"              IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."SITE_CD"         IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."USER_ID"         IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."USER_SE"         IS '사용자 구분';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."DVC_ID"          IS '장치 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."DVC_NM"          IS '장치 명';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."DVC_SE"          IS 'ios,android';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."OS_VER"          IS '운영체제 버전';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."APP_VER"         IS '앱 버전';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."PUSH_CH"         IS 'fcm | apns | web_push';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."PUSH_TK"         IS '푸시 토큰';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."_"               IS 'apns 암호화';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."USE_YN"          IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."PUSH_AGR_YN"     IS '푸시 동의 여부';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."LST_PUSH_USE_TMG" IS '최종 푸시 사용 시기';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."TK_EXP_TMG"      IS '토큰 만료 시기';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."CRT_AT"          IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."CRT_BY"          IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."CRT_IP"          IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."CRT_PGM"         IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."UPD_AT"          IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."UPD_BY"          IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."UPD_IP"          IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN"."UPD_PGM"         IS '수정프로그램';


-- [00.시스템]99.푸시 토큰 이력
CREATE TABLE "INS_APP"."CMS_PUSH_TOKEN_LOG" (
                                                "SN"         NUMBER(15)     NOT NULL,
                                                "SITE_CD"    VARCHAR2(20)   NULL,
                                                "USER_ID"    VARCHAR2(100)  NULL,
                                                "DVC_ID"     VARCHAR2(100)  NULL,
                                                "PUSH_CH"    VARCHAR2(20)   NULL,
                                                "TK_KND_SE"  VARCHAR2(20)   NOT NULL,
                                                "RSLT_CD"    VARCHAR2(20)   NULL,
                                                "RSLT_MSG"   VARCHAR2(4000) NULL,
                                                "CRT_AT"     DATE           NOT NULL,
                                                "CRT_BY"     VARCHAR2(100)  NOT NULL,
                                                "CRT_IP"     VARCHAR2(40)   NOT NULL,
                                                "CRT_PGM"    VARCHAR2(100)  NOT NULL,
                                                "UPD_AT"     DATE           NOT NULL,
                                                "UPD_BY"     VARCHAR2(100)  NOT NULL,
                                                "UPD_IP"     VARCHAR2(40)   NOT NULL,
                                                "UPD_PGM"    VARCHAR2(100)  NOT NULL,
                                                CONSTRAINT "PK_CMS_PUSH_TOKEN_LOG" PRIMARY KEY ("SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_PUSH_TOKEN_LOG"            IS '[00.시스템]99.푸시 토큰 이력';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."SN"       IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."SITE_CD"  IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."USER_ID"  IS '사용자 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."DVC_ID"   IS '장치 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."PUSH_CH"  IS '푸시 채널';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."TK_KND_SE" IS '등록,갱신,삭제,발송성공,발송실패,토큰만료';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."RSLT_CD"  IS '결과 코드';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."RSLT_MSG" IS '결과 메시지';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_PUSH_TOKEN_LOG"."UPD_PGM"  IS '수정프로그램';


-- [01.공통]01.코드
CREATE TABLE "INS_APP"."CMS_COMMON_CODE" (
                                             "CD"      VARCHAR2(20)    NOT NULL,
                                             "CD_NM"   VARCHAR2(200)   NULL,
                                             "CD_LVL"  NUMBER(10)      NULL,
                                             "UP_CD"   VARCHAR2(20)    NULL,
                                             "USE_YN"  VARCHAR2(1)     NULL,
                                             "ORD"     NUMBER(10)      NULL,
                                             "REF_CD1" VARCHAR2(20)    NULL,
                                             "REF_CD2" VARCHAR2(20)    NULL,
                                             "REF_CD3" VARCHAR2(20)    NULL,
                                             "REF_CD4" VARCHAR2(20)    NULL,
                                             "REF_CD5" VARCHAR2(20)    NULL,
                                             "REF_NUM1" NUMBER(10,4)   NULL,
                                             "REF_NUM2" NUMBER(10,4)   NULL,
                                             "REF_NUM3" NUMBER(10,4)   NULL,
                                             "REF_NUM4" NUMBER(10,4)   NULL,
                                             "REF_NUM5" NUMBER(10,4)   NULL,
                                             "RMK"     VARCHAR2(4000)  NULL,
                                             "CRT_AT"  DATE            NOT NULL,
                                             "CRT_BY"  VARCHAR2(100)   NOT NULL,
                                             "CRT_IP"  VARCHAR2(40)    NOT NULL,
                                             "CRT_PGM" VARCHAR2(100)   NOT NULL,
                                             "UPD_AT"  DATE            NOT NULL,
                                             "UPD_BY"  VARCHAR2(100)   NOT NULL,
                                             "UPD_IP"  VARCHAR2(40)    NOT NULL,
                                             "UPD_PGM" VARCHAR2(100)   NOT NULL,
                                             CONSTRAINT "PK_CMS_COMMON_CODE" PRIMARY KEY ("CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_CODE"           IS '[01.공통]01.코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CD"       IS '여기서는 관리코드로 등록을 해야하나요? 도메인';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CD_NM"    IS '코드 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CD_LVL"   IS '코드 레벨';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."UP_CD"    IS '상위 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."USE_YN"   IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."ORD"      IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_CD1"  IS '참조 코드1';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_CD2"  IS '참조 코드2';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_CD3"  IS '참조 코드3';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_CD4"  IS '참조 코드4';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_CD5"  IS '참조 코드5';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_NUM1" IS '참조 숫자1';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_NUM2" IS '참조 숫자2';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_NUM3" IS '참조 숫자3';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_NUM4" IS '참조 숫자4';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."REF_NUM5" IS '참조 숫자5';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."RMK"      IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_CODE"."UPD_PGM"  IS '수정프로그램';


-- [01.공통]02.메뉴
CREATE TABLE "INS_APP"."CMS_COMMON_MENU" (
                                             "MENU_CD"      VARCHAR2(20)   NOT NULL,
                                             "PRGM_NM"      VARCHAR2(300)  NULL,
                                             "PRGM_PATH"    VARCHAR2(400)  NULL,
                                             "MENU_LVL"     NUMBER(10)     NULL,
                                             "UP_MENU_CD"   VARCHAR2(20)   NULL,
                                             "MENU_NM"      VARCHAR2(100)  NULL,
                                             "ORD"          NUMBER(10)     NULL,
                                             "QRY_USE_YN"   VARCHAR2(1)    NULL,
                                             "NEW_USE_YN"   VARCHAR2(1)    NULL,
                                             "SAVE_USE_YN"  VARCHAR2(1)    NULL,
                                             "DEL_USE_YN"   VARCHAR2(1)    NULL,
                                             "OUTP_USE_YN"  VARCHAR2(1)    NULL,
                                             "URL_MTHD_SE"  VARCHAR2(20)   NULL,
                                             "URL_ADDR"     VARCHAR2(255)  NULL,
                                             "PARAM1"       VARCHAR2(100)  NULL,
                                             "PARAM2"       VARCHAR2(100)  NULL,
                                             "PARAM3"       VARCHAR2(100)  NULL,
                                             "PARAM_4"      VARCHAR2(100)  NULL,
                                             "PARAM_5"      VARCHAR2(100)  NULL,
                                             "RMK"          VARCHAR2(4000) NULL,
                                             "PRV_USE_YN"   VARCHAR2(1)    NULL,
                                             "CRT_AT"       DATE           NOT NULL,
                                             "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                             "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                             "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                             "UPD_AT"       DATE           NOT NULL,
                                             "UPD_BY"       VARCHAR2(100)  NOT NULL,
                                             "UPD_IP"       VARCHAR2(40)   NOT NULL,
                                             "UPD_PGM"      VARCHAR2(100)  NOT NULL,
                                             CONSTRAINT "PK_CMS_COMMON_MENU" PRIMARY KEY ("MENU_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_MENU"              IS '[01.공통]02.메뉴';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."MENU_CD"    IS '메뉴 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PRGM_NM"    IS '소스 파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PRGM_PATH"  IS '소스 경로';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."MENU_LVL"   IS '1레벨, 2레벨';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."UP_MENU_CD" IS '상위 메뉴 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."MENU_NM"    IS '메뉴 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."ORD"        IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."QRY_USE_YN" IS 'CMS 메뉴는 이렇게 관리??';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."NEW_USE_YN"  IS '신규 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."SAVE_USE_YN" IS '저장 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."DEL_USE_YN"  IS '삭제 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."OUTP_USE_YN" IS '출력 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."URL_MTHD_SE" IS '내부/ 새창';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."URL_ADDR"    IS '외부 URL 사용하는 경우';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PARAM1"      IS '매뉴 오픈 시 사용될 수 있을 듯';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PARAM2"      IS '파라미터2';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PARAM3"      IS '파라미터3';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PARAM_4"     IS '파라미터4';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PARAM_5"     IS '파라미터5';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."RMK"         IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."PRV_USE_YN"  IS '개인정보 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."CRT_AT"      IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."CRT_BY"      IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."CRT_IP"      IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."CRT_PGM"     IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."UPD_AT"      IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."UPD_BY"      IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."UPD_IP"      IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_MENU"."UPD_PGM"     IS '수정프로그램';


-- [01.공통]03.조직
CREATE TABLE "INS_APP"."CMS_COMMON_ORG" (
                                            "ORG_CD"     VARCHAR2(20)  NOT NULL,
                                            "ORG_NM"     VARCHAR2(30)  NULL,
                                            "ORG_STS_SE" VARCHAR2(20)  NULL,
                                            "ORD"        NUMBER(10)    NULL,
                                            "USE_YN"     VARCHAR2(1)   NULL,
                                            "CRT_AT"     DATE          NOT NULL,
                                            "CRT_BY"     VARCHAR2(100) NOT NULL,
                                            "CRT_IP"     VARCHAR2(40)  NOT NULL,
                                            "CRT_PGM"    VARCHAR2(100) NOT NULL,
                                            "UPD_AT"     DATE          NOT NULL,
                                            "UPD_BY"     VARCHAR2(100) NOT NULL,
                                            "UPD_IP"     VARCHAR2(40)  NOT NULL,
                                            "UPD_PGM"    VARCHAR2(100) NOT NULL,
                                            CONSTRAINT "PK_CMS_COMMON_ORG" PRIMARY KEY ("ORG_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_ORG"             IS '[01.공통]03.조직';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."ORG_CD"    IS '조직 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."ORG_NM"    IS '조직 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."ORG_STS_SE" IS '조직 상태 구분';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."ORD"       IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."USE_YN"    IS '사용여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."CRT_AT"    IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."CRT_BY"    IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."CRT_IP"    IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."CRT_PGM"   IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."UPD_AT"    IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."UPD_BY"    IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."UPD_IP"    IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_ORG"."UPD_PGM"   IS '수정프로그램';


-- [01.공통]04.부서
CREATE TABLE "INS_APP"."CMS_COMMON_DEPT" (
                                             "DEPT_CD" VARCHAR2(20)  NOT NULL,
                                             "ORG_CD"  VARCHAR2(20)  NOT NULL,
                                             "DEPT_NM" VARCHAR2(50)  NULL,
                                             "ORD"     NUMBER(10)    NULL,
                                             "USE_YN"  VARCHAR2(1)   NULL,
                                             "CRT_AT"  DATE          NOT NULL,
                                             "CRT_BY"  VARCHAR2(100) NOT NULL,
                                             "CRT_IP"  VARCHAR2(40)  NOT NULL,
                                             "CRT_PGM" VARCHAR2(100) NOT NULL,
                                             "UPD_AT"  DATE          NOT NULL,
                                             "UPD_BY"  VARCHAR2(100) NOT NULL,
                                             "UPD_IP"  VARCHAR2(40)  NOT NULL,
                                             "UPD_PGM" VARCHAR2(100) NOT NULL,
                                             CONSTRAINT "PK_CMS_COMMON_DEPT" PRIMARY KEY ("DEPT_CD", "ORG_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_DEPT"         IS '[01.공통]04.부서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."DEPT_CD" IS '부서 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."ORG_CD"  IS '조직 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."DEPT_NM" IS '부서 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."ORD"     IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."USE_YN"  IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."CRT_AT"  IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."CRT_BY"  IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."CRT_IP"  IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."CRT_PGM" IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."UPD_AT"  IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."UPD_BY"  IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."UPD_IP"  IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_DEPT"."UPD_PGM" IS '수정프로그램';


-- [01.공통]05.권한
CREATE TABLE "INS_APP"."CMS_COMMON_AUTH" (
                                             "AUTH_CD"      VARCHAR2(20)   NOT NULL,
                                             "MENU_CD"      VARCHAR2(20)   NULL,
                                             "AUTH_NM"      VARCHAR2(100)  NULL,
                                             "AUTH_SE"      VARCHAR2(20)   NULL,
                                             "AUTH_ORG_CD"  VARCHAR2(20)   NULL,
                                             "AUTH_DEPT_CD" VARCHAR2(20)   NULL,
                                             "AUTH_LVL"     NUMBER(10)     NULL,
                                             "ORD"          NUMBER(10)     NULL,
                                             "USE_YN"       VARCHAR2(1)    NULL,
                                             "DESC"         VARCHAR2(4000) NULL,
                                             "RMK"          VARCHAR2(4000) NULL,
                                             "CRT_AT"       DATE           NOT NULL,
                                             "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                             "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                             "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                             "UPD_AT"       DATE           NOT NULL,
                                             "UPD_BY"       VARCHAR2(100)  NOT NULL,
                                             "UPD_IP"       VARCHAR2(40)   NOT NULL,
                                             "UPD_PGM"      VARCHAR2(100)  NOT NULL,
                                             CONSTRAINT "PK_CMS_COMMON_AUTH" PRIMARY KEY ("AUTH_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_AUTH"              IS '[01.공통]05.권한';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_CD"    IS '권한 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."MENU_CD"    IS '메뉴 1레벨(공통관리, 업무단위등)';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_NM"    IS '권한 명';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_SE"    IS '전체권한,부서권한,개인권한';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_ORG_CD"  IS '조직관리(ORG_CD)';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_DEPT_CD" IS '부서관리(DEPT_CD)';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."AUTH_LVL"   IS '1,2,3,4,5 가 편한가요..';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."ORD"        IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."USE_YN"     IS '사용여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."DESC"       IS '내용';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."RMK"        IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."CRT_AT"     IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."CRT_BY"     IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."CRT_IP"     IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."CRT_PGM"    IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."UPD_AT"     IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."UPD_BY"     IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."UPD_IP"     IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH"."UPD_PGM"    IS '수정프로그램';


-- [01.공통]06.권한별 메뉴
CREATE TABLE "INS_APP"."CMS_COMMON_AUTH_MENU" (
                                                  "MENU_CD" VARCHAR2(20)  NOT NULL,
                                                  "AUTH_CD" VARCHAR2(20)  NOT NULL,
                                                  "AUTH_SE" VARCHAR2(20)  NULL,
                                                  "USE_YN"  VARCHAR2(1)   NULL,
                                                  "QRY_YN"  VARCHAR2(1)   NULL,
                                                  "SAVE_YN" VARCHAR2(1)   NULL,
                                                  "DEL_YN"  VARCHAR2(1)   NULL,
                                                  "NEW_YN"  VARCHAR2(1)   NULL,
                                                  "EXL_YN"  VARCHAR2(1)   NULL,
                                                  "OUTP_YN" VARCHAR2(1)   NULL,
                                                  "CRT_AT"  DATE          NOT NULL,
                                                  "CRT_BY"  VARCHAR2(100) NOT NULL,
                                                  "CRT_IP"  VARCHAR2(40)  NOT NULL,
                                                  "CRT_PGM" VARCHAR2(100) NOT NULL,
                                                  "UPD_AT"  DATE          NOT NULL,
                                                  "UPD_BY"  VARCHAR2(100) NOT NULL,
                                                  "UPD_IP"  VARCHAR2(40)  NOT NULL,
                                                  "UPD_PGM" VARCHAR2(100) NOT NULL,
                                                  CONSTRAINT "PK_CMS_COMMON_AUTH_MENU" PRIMARY KEY ("MENU_CD", "AUTH_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_COMMON_AUTH_MENU"          IS '[01.공통]06.권한별 메뉴';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."MENU_CD" IS '메뉴 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."AUTH_CD" IS '권한 코드';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."AUTH_SE" IS '개인/부서/전체';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."USE_YN"  IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."QRY_YN"  IS '조회 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."SAVE_YN" IS '저장 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."DEL_YN"  IS '삭제 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."NEW_YN"  IS '신규 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."EXL_YN"  IS '엑셀 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."OUTP_YN" IS '출력 여부';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."CRT_AT"  IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."CRT_BY"  IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."CRT_IP"  IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."CRT_PGM" IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."UPD_AT"  IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."UPD_BY"  IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."UPD_IP"  IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_COMMON_AUTH_MENU"."UPD_PGM" IS '수정프로그램';


-- [03.사이트]01.사이트
CREATE TABLE "INS_APP"."CMS_SITE" (
                                      "SITE_CD"   VARCHAR2(20)   NOT NULL,
                                      "SITE_NM"   VARCHAR2(100)  NULL,
                                      "SITE_DESC" VARCHAR2(4000) NULL,
                                      "USE_YN"    VARCHAR2(1)    NULL,
                                      "CRT_AT"    DATE           NOT NULL,
                                      "CRT_BY"    VARCHAR2(100)  NOT NULL,
                                      "CRT_IP"    VARCHAR2(40)   NOT NULL,
                                      "CRT_PGM"   VARCHAR2(100)  NOT NULL,
                                      "UPD_AT"    DATE           NOT NULL,
                                      "UPD_BY"    VARCHAR2(100)  NOT NULL,
                                      "UPD_IP"    VARCHAR2(40)   NOT NULL,
                                      "UPD_PGM"   VARCHAR2(100)  NOT NULL,
                                      CONSTRAINT "PK_CMS_SITE" PRIMARY KEY ("SITE_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_SITE"           IS '[03.사이트]01.사이트';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."SITE_CD"   IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."SITE_NM"   IS '사이트 명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."SITE_DESC" IS '사이트 설명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."USE_YN"    IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."CRT_AT"    IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."CRT_BY"    IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."CRT_IP"    IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."CRT_PGM"   IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."UPD_AT"    IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."UPD_BY"    IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."UPD_IP"    IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE"."UPD_PGM"   IS '수정프로그램';


-- [03.사이트]02.사이트 아이피
CREATE TABLE "INS_APP"."CMS_SITE_IP" (
                                         "SITE_CD"     VARCHAR2(20)  NOT NULL,
                                         "SN"          VARCHAR2(20)  NOT NULL,
                                         "USE_YN"      VARCHAR2(1)   NULL,
                                         "DESC"        VARCHAR2(4000) NULL,
                                         "PERM_IP"     VARCHAR2(40)  NULL,
                                         "USE_ST_YMD"  VARCHAR2(8)   NULL,
                                         "USE_END_YMD" VARCHAR2(8)   NULL,
                                         "CRT_AT"      DATE          NOT NULL,
                                         "CRT_BY"      VARCHAR2(100) NOT NULL,
                                         "CRT_IP"      VARCHAR2(40)  NOT NULL,
                                         "CRT_PGM"     VARCHAR2(100) NOT NULL,
                                         "UPD_AT"      DATE          NOT NULL,
                                         "UPD_BY"      VARCHAR2(100) NOT NULL,
                                         "UPD_IP"      VARCHAR2(40)  NOT NULL,
                                         "UPD_PGM"     VARCHAR2(100) NOT NULL,
                                         CONSTRAINT "PK_CMS_SITE_IP" PRIMARY KEY ("SITE_CD", "SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_SITE_IP"              IS '[03.사이트]02.사이트 아이피';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."SITE_CD"    IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."SN"         IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."USE_YN"     IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."DESC"       IS '내용';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."PERM_IP"    IS '허용 아이피';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."USE_ST_YMD"  IS '사용 시작 일자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."USE_END_YMD" IS '사용 종료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."CRT_AT"     IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."CRT_BY"     IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."CRT_IP"     IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."CRT_PGM"    IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."UPD_AT"     IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."UPD_BY"     IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."UPD_IP"     IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_IP"."UPD_PGM"    IS '수정프로그램';


-- [03.사이트]03.사이트 메뉴
CREATE TABLE "INS_APP"."CMS_SITE_MENU" (
                                           "SITE_CD"      VARCHAR2(20)   NOT NULL,
                                           "MENU_CD"      VARCHAR2(20)   NOT NULL,
                                           "MENU_LVL"     NUMBER(10)     NULL,
                                           "UP_MENU_CD"   VARCHAR2(20)   NULL,
                                           "PRGM_PATH"    VARCHAR2(400)  NULL,
                                           "MENU_NM"      VARCHAR2(100)  NULL,
                                           "MENU_SE"      VARCHAR2(20)   NULL,
                                           "BRD_ID"       VARCHAR2(100)  NULL,
                                           "CTT_ID"       VARCHAR2(100)  NULL,
                                           "ORD"          NUMBER(10)     NULL,
                                           "LGN_USE_YN"   VARCHAR2(1)    NULL,
                                           "MENU_ENG_NM"  VARCHAR2(100)  NULL,
                                           "MENU_JPN_NM"  VARCHAR2(100)  NULL,
                                           "MENU_CHS_NM"  VARCHAR2(100)  NULL,
                                           "MENU__NM3"    VARCHAR2(100)  NULL,
                                           "URL_MTHD_SE"  VARCHAR2(20)   NULL,
                                           "URL_ADDR"     VARCHAR2(255)  NULL,
                                           "PARAM1"       VARCHAR2(100)  NULL,
                                           "PARAM2"       VARCHAR2(100)  NULL,
                                           "PARAM3"       VARCHAR2(100)  NULL,
                                           "PARAM4"       VARCHAR2(100)  NULL,
                                           "PARAM5"       VARCHAR2(100)  NULL,
                                           "PRV_USE_YN"   VARCHAR2(1)    NULL,
                                           "PRGM_TYPE_SE" VARCHAR2(20)   NULL,
                                           "CRT_AT"       DATE           NOT NULL,
                                           "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                           "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                           "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                           "UPD_AT"       DATE           NOT NULL,
                                           "UPD_BY"       VARCHAR2(100)  NOT NULL,
                                           "UPD_IP"       VARCHAR2(40)   NOT NULL,
                                           "UPD_PGM"      VARCHAR2(100)  NOT NULL,
                                           CONSTRAINT "PK_CMS_SITE_MENU" PRIMARY KEY ("SITE_CD", "MENU_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_SITE_MENU"              IS '[03.사이트]03.사이트 메뉴';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."SITE_CD"    IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_CD"    IS 'CMS+1레벨2+2레벨3+3레벨3 으로 생성';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_LVL"   IS '메뉴 레벨';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."UP_MENU_CD" IS '상위 메뉴 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PRGM_PATH"  IS '소스코드 경로';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_NM"    IS '메뉴명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_SE"    IS '팝업/일반/탭/게시판/컨텐츠';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."BRD_ID"     IS '게시판 관리의 코드를 입력해서 연결?';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."CTT_ID"     IS '컨텐츠 연결';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."ORD"        IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."LGN_USE_YN" IS '로그인 해야만 사용 가능';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_ENG_NM" IS '메뉴 영어 명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_JPN_NM" IS '메뉴 일어 명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU_CHS_NM" IS '메뉴 중문(간체) 명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."MENU__NM3"   IS '메뉴 중문(일어) 명';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."URL_MTHD_SE" IS '내부/ 새창';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."URL_ADDR"    IS '외부 URL 사용하는 경우';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PARAM1"      IS '파라미터1';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PARAM2"      IS '파라미터2';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PARAM3"      IS '파라미터3';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PARAM4"      IS '파라미터4';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PARAM5"      IS '파라미터5';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PRV_USE_YN"  IS '로그 관리 용이?';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."PRGM_TYPE_SE" IS '조회/저장/출력 등 관리?';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."CRT_AT"      IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."CRT_BY"      IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."CRT_IP"      IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."CRT_PGM"     IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."UPD_AT"      IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."UPD_BY"      IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."UPD_IP"      IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_MENU"."UPD_PGM"     IS '수정프로그램';


-- [03.사이트]04.사이트 방문 이력
CREATE TABLE "INS_APP"."CMS_SITE_VISIT_HISTORY" (
                                                    "SITE_CD"  VARCHAR2(20)   NOT NULL,
                                                    "MENU_CD"  VARCHAR2(20)   NOT NULL,
                                                    "SN"       NUMBER(15)     NULL,
                                                    "IP"       VARCHAR2(40)   NULL,
                                                    "VST_YMD"  DATE           NULL,
                                                    "OS"       VARCHAR2(100)  NULL,
                                                    "BRWS"     VARCHAR2(100)  NULL,
                                                    "USER_AGT" VARCHAR2(300)  NULL,
                                                    "TGT_BRWS" VARCHAR2(10)   NULL,
                                                    "PSTN"     VARCHAR2(100)  NULL,
                                                    "BRD_ID"   VARCHAR2(100)  NULL,
                                                    "CTT_ID"   VARCHAR2(100)  NULL,
                                                    "SITE_URL" VARCHAR2(1000) NULL,
                                                    "REF_URL"  VARCHAR2(1000) NULL,
                                                    "MENU_SE"  VARCHAR2(20)   NULL,
                                                    "EQP_SE"   VARCHAR2(20)   NULL,
                                                    "CRT_AT"   DATE           NOT NULL,
                                                    "CRT_BY"   VARCHAR2(100)  NOT NULL,
                                                    "CRT_IP"   VARCHAR2(40)   NOT NULL,
                                                    "CRT_PGM"  VARCHAR2(100)  NOT NULL,
                                                    "UPD_AT"   DATE           NOT NULL,
                                                    "UPD_BY"   VARCHAR2(100)  NOT NULL,
                                                    "UPD_IP"   VARCHAR2(40)   NOT NULL,
                                                    "UPD_PGM"  VARCHAR2(100)  NOT NULL,
                                                    CONSTRAINT "PK_CMS_SITE_VISIT_HISTORY" PRIMARY KEY ("SITE_CD", "MENU_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_SITE_VISIT_HISTORY"          IS '[03.사이트]04.사이트 방문 이력';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."SITE_CD"  IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."MENU_CD"  IS '메뉴 코드';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."SN"       IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."IP"       IS '아이피';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."VST_YMD"  IS '방문 일자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."OS"       IS 'Windows';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."BRWS"     IS 'Chrome-90.0.4430.212';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."USER_AGT" IS '사용자 에이전트';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."TGT_BRWS" IS 'CHROME|SAFARI';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."PSTN"     IS 'ko';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."BRD_ID"   IS '게시판 관리의 코드를 입력해서 연결?';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."CTT_ID"   IS '컨텐츠 연결';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."SITE_URL" IS '사이트 URL';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."REF_URL"  IS '이전 방문';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."MENU_SE"  IS '메뉴 구분';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."EQP_SE"   IS 'pc/?';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_SITE_VISIT_HISTORY"."UPD_PGM"  IS '수정프로그램';


-- [03.사이트]05.배너 그룹
CREATE TABLE "INS_APP"."CMS_BANNER_GROUP" (
                                              "BNR_GRP_ID"   VARCHAR2(100)  NOT NULL,
                                              "SITE_CD"      VARCHAR2(20)   NOT NULL,
                                              "BNR_GRP_NM"   VARCHAR2(100)  NULL,
                                              "BNR_GRP_DESC" VARCHAR2(4000) NULL,
                                              "USE_YN"       VARCHAR2(1)    NULL,
                                              "SORT"         NUMBER(10)     NULL,
                                              "CRT_AT"       DATE           NOT NULL,
                                              "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                              "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                              "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                              "UPD_AT"       DATE           NOT NULL,
                                              "UPD_BY"       VARCHAR2(100)  NOT NULL,
                                              "UPD_IP"       VARCHAR2(40)   NOT NULL,
                                              "UPD_PGM"      VARCHAR2(100)  NOT NULL,
                                              CONSTRAINT "PK_CMS_BANNER_GROUP" PRIMARY KEY ("BNR_GRP_ID", "SITE_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_BANNER_GROUP"               IS '[03.사이트]05.배너 그룹';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."BNR_GRP_ID"  IS '배너 그룹 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."SITE_CD"     IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."BNR_GRP_NM"  IS '배너 그룹 명';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."BNR_GRP_DESC" IS '배너 그룹 내용';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."USE_YN"      IS '사용여부';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."SORT"        IS '정렬';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."CRT_AT"      IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."CRT_BY"      IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."CRT_IP"      IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."CRT_PGM"     IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."UPD_AT"      IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."UPD_BY"      IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."UPD_IP"      IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER_GROUP"."UPD_PGM"     IS '수정프로그램';


-- [03.사이트]06.배너
-- 주의: CUBRID BLOB -> Oracle BLOB 유지
CREATE TABLE "INS_APP"."CMS_BANNER" (
                                        "BNR_ID"       VARCHAR2(100)  NOT NULL,
                                        "BNR_GRP_ID"   VARCHAR2(100)  NOT NULL,
                                        "SITE_CD"      VARCHAR2(20)   NOT NULL,
                                        "BNR_NM"       VARCHAR2(100)  NULL,
                                        "BNR_DESC"     VARCHAR2(4000) NULL,
                                        "BNR_FILE_NM"  VARCHAR2(300)  NULL,
                                        "BNR_FILE_PATH" VARCHAR2(400) NULL,
                                        "SORT"         NUMBER(10)     NULL,
                                        "PUB_ST_DAY"   VARCHAR2(8)    NULL,
                                        "PUB_ST_HR"    VARCHAR2(4)    NULL,
                                        "PUB_END_DAY"  VARCHAR2(8)    NULL,
                                        "PUB_END_HR"   VARCHAR2(4)    NULL,
                                        "USE_YN"       VARCHAR2(1)    NULL,
                                        "BNR_SE"       VARCHAR2(20)   NULL,
                                        "BNR_SZ_SE"    VARCHAR2(20)   NULL,
                                        "BNR_URL"      VARCHAR2(1000) NULL,
                                        "DEL_YN"       VARCHAR2(1)    NULL,
                                        "RMK"          BLOB           NULL,
                                        "CRT_AT"       DATE           NOT NULL,
                                        "CRT_BY"       VARCHAR2(100)  NOT NULL,
                                        "CRT_IP"       VARCHAR2(40)   NOT NULL,
                                        "CRT_PGM"      VARCHAR2(100)  NOT NULL,
                                        "UPD_AT"       DATE           NOT NULL,
                                        "UPD_BY"       VARCHAR2(100)  NOT NULL,
                                        "UPD_IP"       VARCHAR2(40)   NOT NULL,
                                        "UPD_PGM"      VARCHAR2(100)  NOT NULL,
                                        CONSTRAINT "PK_CMS_BANNER" PRIMARY KEY ("BNR_ID", "BNR_GRP_ID", "SITE_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_BANNER"              IS '[03.사이트]06.배너';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_ID"     IS '배너 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_GRP_ID"  IS '배너 그룹 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."SITE_CD"    IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_NM"     IS '배너 명';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_DESC"   IS '배너 내용';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_FILE_NM" IS '배너 파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_FILE_PATH" IS '배너 파일 경로';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."SORT"       IS '정렬';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."PUB_ST_DAY" IS '게시 시작 일';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."PUB_ST_HR"  IS '게시 시작 시간';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."PUB_END_DAY" IS '게시 종료 일';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."PUB_END_HR"  IS '게시 종료 시간';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."USE_YN"     IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_SE"     IS '_self';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_SZ_SE"  IS '배너 크기 구분';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."BNR_URL"    IS '배너 URL';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."DEL_YN"     IS '삭제 여부';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."RMK"        IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."CRT_AT"     IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."CRT_BY"     IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."CRT_IP"     IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."CRT_PGM"    IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."UPD_AT"     IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."UPD_BY"     IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."UPD_IP"     IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BANNER"."UPD_PGM"    IS '수정프로그램';


-- [03.사이트]07.컨텐츠 - puck editor 사용
CREATE TABLE "INS_APP"."CMS_CONTENT" (
                                         "SITE_CD"  VARCHAR2(20)    NOT NULL,
                                         "CTT_ID"   VARCHAR2(100)   NOT NULL,
                                         "CTT_NM"   VARCHAR2(300)   NULL,
                                         "CTT_DESC" VARCHAR2(4000) NULL,
                                         "FILE_NM"  VARCHAR2(300)   NULL,
                                         "FILE_PATH" VARCHAR2(400)  NULL,
                                         "USE_YN"   VARCHAR2(1)     NULL,
                                         "PUB_YN"   VARCHAR2(1)     NULL,
                                         "RMK"      VARCHAR2(4000)  NULL,
                                         "CRT_AT"   DATE            NOT NULL,
                                         "CRT_BY"   VARCHAR2(100)   NOT NULL,
                                         "CRT_IP"   VARCHAR2(40)    NOT NULL,
                                         "CRT_PGM"  VARCHAR2(100)   NOT NULL,
                                         "UPD_AT"   DATE            NOT NULL,
                                         "UPD_BY"   VARCHAR2(100)   NOT NULL,
                                         "UPD_IP"   VARCHAR2(40)    NOT NULL,
                                         "UPD_PGM"  VARCHAR2(100)   NOT NULL,
                                         CONSTRAINT "PK_CMS_CONTENT" PRIMARY KEY ("SITE_CD", "CTT_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_CONTENT"          IS '[03.사이트]07.컨텐츠 - puck editor 사용';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."SITE_CD"  IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CTT_ID"   IS '컨텐츠 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CTT_NM"   IS '컨텐츠 명';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CTT_DESC" IS '컨텐츠 내용';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."FILE_NM"  IS '파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."FILE_PATH" IS '파일 경로';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."USE_YN"   IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."PUB_YN"   IS '중간저장 등의 이슈가 있을 수 있음.';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."RMK"      IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT"."UPD_PGM"  IS '수정프로그램';


-- [03.사이트]08.컨텐츠 SEO
CREATE TABLE "INS_APP"."CMS_CONTENT_SEO" (
                                             "SN"      NUMBER(15)     NOT NULL,
                                             "SITE_CD" VARCHAR2(20)   NOT NULL,
                                             "CTT_ID"  VARCHAR2(100)  NOT NULL,
                                             "_TTL"    VARCHAR2(300)  NULL,
                                             "_DESC"   VARCHAR2(4000) NULL,
                                             "COL2"    VARCHAR2(4000) NULL,
                                             CONSTRAINT "PK_CMS_CONTENT_SEO" PRIMARY KEY ("SN", "SITE_CD", "CTT_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_CONTENT_SEO"         IS '[03.사이트]08.컨텐츠 SEO';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."SN"     IS '일련번호';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."SITE_CD" IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."CTT_ID"  IS '컨텐츠 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."_TTL"    IS 'meta 제목';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."_DESC"   IS 'meta 설명';
COMMENT ON COLUMN "INS_APP"."CMS_CONTENT_SEO"."COL2"    IS '키워드';


-- [03.사이트]09.팝업
CREATE TABLE "INS_APP"."CMS_POPUP" (
                                       "SITE_CD"     VARCHAR2(20)   NOT NULL,
                                       "POP_GRP_ID"  VARCHAR2(100)  NOT NULL,
                                       "POP_ID"      VARCHAR2(100)  NOT NULL,
                                       "POP_NM"      VARCHAR2(100)  NULL,
                                       "TTL"         VARCHAR2(300)  NULL,
                                       "DESC"        VARCHAR2(4000) NULL,
                                       "FILE_NM"     VARCHAR2(300)  NULL,
                                       "FILE_PATH"   VARCHAR2(400)  NULL,
                                       "PUB_ST_DAY"  DATE           NULL,
                                       "PUB_END_DAY" DATE           NULL,
                                       "PUB_ST_HR"   VARCHAR2(4)    NULL,
                                       "PUB_END_HR"  VARCHAR2(4)    NULL,
                                       "PUB_SE"      VARCHAR2(20)   NULL,
                                       "PUB_YN"      VARCHAR2(1)    NULL,
                                       "RMK"         VARCHAR2(4000) NULL,
                                       "ADD_URL"     VARCHAR2(255)  NULL,
                                       "URL_TGT_SE"  VARCHAR2(20)   NULL,
                                       "POP_W"       NUMBER(10,4)   NULL,
                                       "W_PSTN"      NUMBER(10,4)   NULL,
                                       "POP_H"       NUMBER(10,4)   NULL,
                                       "H_PSTN"      NUMBER(10,4)   NULL,
                                       "CRT_AT"      DATE           NOT NULL,
                                       "CRT_BY"      VARCHAR2(100)  NOT NULL,
                                       "CRT_IP"      VARCHAR2(40)   NOT NULL,
                                       "CRT_PGM"     VARCHAR2(100)  NOT NULL,
                                       "UPD_AT"      DATE           NOT NULL,
                                       "UPD_BY"      VARCHAR2(100)  NOT NULL,
                                       "UPD_IP"      VARCHAR2(40)   NOT NULL,
                                       "UPD_PGM"     VARCHAR2(100)  NOT NULL,
                                       CONSTRAINT "PK_CMS_POPUP" PRIMARY KEY ("SITE_CD", "POP_GRP_ID", "POP_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_POPUP"              IS '[03.사이트]09.팝업';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."SITE_CD"    IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."POP_GRP_ID" IS '팝업 그룹 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."POP_ID"     IS '팝업 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."POP_NM"     IS '팝업 명';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."TTL"        IS '제목';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."DESC"       IS '내용';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."FILE_NM"    IS '파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."FILE_PATH"  IS '파일 경로';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_ST_DAY" IS '게시 시작 일';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_END_DAY" IS '게시 종료 일';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_ST_HR"  IS '게시 시작 시간';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_END_HR" IS '게시 종료 시간';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_SE"     IS '오늘 하루동안 그만보기';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."PUB_YN"     IS '게시 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."RMK"        IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."ADD_URL"    IS '추가 URL';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."URL_TGT_SE" IS '_self, _blank';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."POP_W"      IS '팝업 가로';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."W_PSTN"     IS '가로 위치';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."POP_H"      IS '팝업 세로';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."H_PSTN"     IS '세로 위치';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."CRT_AT"     IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."CRT_BY"     IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."CRT_IP"     IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."CRT_PGM"    IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."UPD_AT"     IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."UPD_BY"     IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."UPD_IP"     IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP"."UPD_PGM"    IS '수정프로그램';


-- [03.사이트]10.팝업 그룹
CREATE TABLE "INS_APP"."CMS_POPUP_GROUP" (
                                             "SITE_CD"     VARCHAR2(20)  NOT NULL,
                                             "POP_GRP_ID"  VARCHAR2(100) NOT NULL,
                                             "POP_GRP_NM"  VARCHAR2(100) NULL,
                                             "USE_YN"      VARCHAR2(1)   NULL,
                                             "SORT"        NUMBER(10)    NULL,
                                             "CRT_AT"      DATE          NOT NULL,
                                             "CRT_BY"      VARCHAR2(100) NOT NULL,
                                             "CRT_IP"      VARCHAR2(40)  NOT NULL,
                                             "CRT_PGM"     VARCHAR2(100) NOT NULL,
                                             "UPD_AT"      DATE          NOT NULL,
                                             "UPD_BY"      VARCHAR2(100) NOT NULL,
                                             "UPD_IP"      VARCHAR2(40)  NOT NULL,
                                             "UPD_PGM"     VARCHAR2(100) NOT NULL,
                                             CONSTRAINT "PK_CMS_POPUP_GROUP" PRIMARY KEY ("SITE_CD", "POP_GRP_ID")
);

COMMENT ON TABLE  "INS_APP"."CMS_POPUP_GROUP"             IS '[03.사이트]10.팝업 그룹';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."SITE_CD"   IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."POP_GRP_ID" IS '팝업 그룹 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."POP_GRP_NM" IS '팝업 그룹 명';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."USE_YN"    IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."SORT"      IS '정렬';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."CRT_AT"    IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."CRT_BY"    IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."CRT_IP"    IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."CRT_PGM"   IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."UPD_AT"    IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."UPD_BY"    IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."UPD_IP"    IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POPUP_GROUP"."UPD_PGM"   IS '수정프로그램';


-- [03.사이트]11.파일관리
CREATE TABLE "INS_APP"."CMS_FILE" (
                                      "FILE_SN"  NUMBER(20)    NOT NULL,
                                      "SITE_CD"  VARCHAR2(20)  NOT NULL,
                                      "FILE_PATH" VARCHAR2(400) NULL,
                                      "FILE_NM"  VARCHAR2(300) NULL,
                                      "CRT_AT"   DATE          NOT NULL,
                                      "CRT_BY"   VARCHAR2(100) NOT NULL,
                                      "CRT_IP"   VARCHAR2(40)  NOT NULL,
                                      "CRT_PGM"  VARCHAR2(100) NOT NULL,
                                      "UPD_AT"   DATE          NOT NULL,
                                      "UPD_BY"   VARCHAR2(100) NOT NULL,
                                      "UPD_IP"   VARCHAR2(40)  NOT NULL,
                                      "UPD_PGM"  VARCHAR2(100) NOT NULL,
                                      CONSTRAINT "PK_CMS_FILE" PRIMARY KEY ("FILE_SN", "SITE_CD")
);

COMMENT ON TABLE  "INS_APP"."CMS_FILE"           IS '[03.사이트]11.파일관리';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."FILE_SN"  IS '파일 순번';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."SITE_CD"  IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."FILE_PATH" IS '파일 경로';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."FILE_NM"  IS '파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_FILE"."UPD_PGM"  IS '수정프로그램';


-- [04.게시판]01.게시판
CREATE TABLE "INS_APP"."CMS_BOARD" (
                                       "SITE_CD"        VARCHAR2(20)   NOT NULL,
                                       "BRD_ID"         VARCHAR2(100)  NOT NULL,
                                       "BRD_SE"         VARCHAR2(20)   NOT NULL,
                                       "BRD_NM"         VARCHAR2(200)  NULL,
                                       "BRD_DESC"       VARCHAR2(4000) NULL,
                                       "ORD"            NUMBER(10)     NULL,
                                       "USE_YN"         VARCHAR2(1)    NULL,
                                       "WRT_AUTH_CD"    VARCHAR2(20)   NULL,
                                       "QRY_AUTH_CD"    VARCHAR2(20)   NULL,
                                       "CMT_AUTH_CD"    VARCHAR2(20)   NULL,
                                       "LGN_USER_USE_YN" VARCHAR2(1)  NULL,
                                       "WRTR_PSN_QRY_YN" VARCHAR2(1)  NULL,
                                       "PWD_USE_YN"     VARCHAR2(1)    NULL,
                                       "FILE_USE_YN"    VARCHAR2(1)    NULL,
                                       "CMT_USE_YN"     VARCHAR2(1)    NULL,
                                       "CRT_AT"         DATE           NOT NULL,
                                       "CRT_BY"         VARCHAR2(100)  NOT NULL,
                                       "CRT_IP"         VARCHAR2(40)   NOT NULL,
                                       "CRT_PGM"        VARCHAR2(100)  NOT NULL,
                                       "UPD_AT"         DATE           NOT NULL,
                                       "UPD_BY"         VARCHAR2(100)  NOT NULL,
                                       "UPD_IP"         VARCHAR2(40)   NOT NULL,
                                       "UPD_PGM"        VARCHAR2(100)  NOT NULL,
                                       CONSTRAINT "PK_CMS_BOARD" PRIMARY KEY ("SITE_CD", "BRD_ID", "BRD_SE")
);

COMMENT ON TABLE  "INS_APP"."CMS_BOARD"                  IS '[04.게시판]01.게시판';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."SITE_CD"        IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."BRD_ID"         IS '게시판 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."BRD_SE"         IS '공통 코드';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."BRD_NM"         IS '게시판 명';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."BRD_DESC"       IS '게시판 내용';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."ORD"            IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."USE_YN"         IS '사용여부';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."WRT_AUTH_CD"    IS 'AUTH_CD';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."QRY_AUTH_CD"    IS 'AUTH_CD';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CMT_AUTH_CD"    IS 'AUTH_CD';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."LGN_USER_USE_YN" IS '로그인 한 사람만 사용 가능';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."WRTR_PSN_QRY_YN" IS '비밀글';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."PWD_USE_YN"     IS '비밀글의 경우';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."FILE_USE_YN"    IS '파일 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CMT_USE_YN"     IS '댓글 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CRT_AT"         IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CRT_BY"         IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CRT_IP"         IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."CRT_PGM"        IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."UPD_AT"         IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."UPD_BY"         IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."UPD_IP"         IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_BOARD"."UPD_PGM"        IS '수정프로그램';


-- [04.게시판]02.게시글
CREATE TABLE "INS_APP"."CMS_POST" (
                                      "SITE_CD"     VARCHAR2(20)    NOT NULL,
                                      "BRD_ID"      VARCHAR2(100)   NOT NULL,
                                      "BRD_SE"      VARCHAR2(20)    NOT NULL,
                                      "PST_SN"      NUMBER(15)      NOT NULL,
                                      "PST_ID"      VARCHAR2(100)   NULL,
                                      "CTG_SE"      VARCHAR2(20)    NULL,
                                      "PST_SE"      VARCHAR2(20)    NULL,
                                      "PST_STS_SE"  VARCHAR2(20)    NULL,
                                      "PST_TTL"     VARCHAR2(1000)  NULL,
                                      "PST_DESC"    VARCHAR2(4000)  NULL,
                                      "USE_YN"      VARCHAR2(1)     NULL,
                                      "DEL_YN"      VARCHAR2(1)     NULL,
                                      "PST_DEL_SE"  VARCHAR2(20)    NULL,
                                      "QRY_CNT"     NUMBER(10)      NULL,
                                      "RMK"         VARCHAR2(4000)  NULL,
                                      "ORD"         NUMBER(10)      NULL,
                                      "NTC_YN"      VARCHAR2(1)     NULL,
                                      "PUB_ST_YMD"  VARCHAR2(8)     NULL,
                                      "PUB_END_YMD" VARCHAR2(8)     NULL,
                                      "PWD_USE_YN"  VARCHAR2(1)     NULL,
                                      "FILE_PATH"   VARCHAR2(400)   NULL,
                                      "FILE_NM"     VARCHAR2(300)   NULL,
                                      "PWD"         VARCHAR2(500)   NULL,
                                      "CRT_AT"      DATE            NOT NULL,
                                      "CRT_BY"      VARCHAR2(100)   NOT NULL,
                                      "CRT_IP"      VARCHAR2(40)    NOT NULL,
                                      "CRT_PGM"     VARCHAR2(100)   NOT NULL,
                                      "UPD_AT"      DATE            NOT NULL,
                                      "UPD_BY"      VARCHAR2(100)   NOT NULL,
                                      "UPD_IP"      VARCHAR2(40)    NOT NULL,
                                      "UPD_PGM"     VARCHAR2(100)   NOT NULL,
                                      CONSTRAINT "PK_CMS_POST" PRIMARY KEY ("SITE_CD", "BRD_ID", "BRD_SE", "PST_SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_POST"             IS '[04.게시판]02.게시글';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."SITE_CD"   IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."BRD_ID"    IS '게시판 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."BRD_SE"    IS '게시판 구분';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_SN"    IS '게시글 순번';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_ID"    IS '게시글 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."CTG_SE"    IS '공통 코드로 관리';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_SE"    IS '문의/답글(Q&A)/일반글';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_STS_SE" IS '관리자에 의해 삭제된 게시글입니다.';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_TTL"   IS '게시글 제목';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_DESC"  IS '게시글 내용';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."USE_YN"    IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."DEL_YN"    IS '삭제 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PST_DEL_SE" IS '관리자삭제, 작성자삭제';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."QRY_CNT"   IS '조회 수';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."RMK"       IS '비고';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."ORD"       IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."NTC_YN"    IS '최상단에 고정';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PUB_ST_YMD"  IS '게시 시작 일자';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PUB_END_YMD" IS '게시 종료 일자';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PWD_USE_YN" IS '비밀글';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."FILE_PATH" IS '파일 경로';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."FILE_NM"   IS '파일 명';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."PWD"       IS '비밀글의 경우';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."CRT_AT"    IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."CRT_BY"    IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."CRT_IP"    IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."CRT_PGM"   IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."UPD_AT"    IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."UPD_BY"    IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."UPD_IP"    IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POST"."UPD_PGM"   IS '수정프로그램';


-- [04.게시판]03.게시물 댓글
CREATE TABLE "INS_APP"."CMS_POST_COMMENT" (
                                              "SITE_CD"    VARCHAR2(20)   NOT NULL,
                                              "BRD_ID"     VARCHAR2(100)  NOT NULL,
                                              "BRD_SE"     VARCHAR2(20)   NOT NULL,
                                              "PST_SN"     NUMBER(15)     NOT NULL,
                                              "CMT_SN"     NUMBER(15)     NOT NULL,
                                              "CMT_TTL"    VARCHAR2(300)  NULL,
                                              "LIKE_CNT"   NUMBER(10)     NULL,
                                              "CMT_DESC"   VARCHAR2(4000) NULL,
                                              "PWD_USE_YN" VARCHAR2(1)    NULL,
                                              "CMT_PWD"    VARCHAR2(500)  NULL,
                                              "USE_YN"     VARCHAR2(1)    NULL,
                                              "DEL_YN"     VARCHAR2(1)    NULL,
                                              "CMT_DEL_SE" VARCHAR2(20)   NULL,
                                              "ORD"        NUMBER(10)     NULL,
                                              "CRT_AT"     DATE           NOT NULL,
                                              "CRT_BY"     VARCHAR2(100)  NOT NULL,
                                              "CRT_IP"     VARCHAR2(40)   NOT NULL,
                                              "CRT_PGM"    VARCHAR2(100)  NOT NULL,
                                              "UPD_AT"     DATE           NOT NULL,
                                              "UPD_BY"     VARCHAR2(100)  NOT NULL,
                                              "UPD_IP"     VARCHAR2(40)   NOT NULL,
                                              "UPD_PGM"    VARCHAR2(100)  NOT NULL,
                                              CONSTRAINT "PK_CMS_POST_COMMENT" PRIMARY KEY ("SITE_CD", "BRD_ID", "BRD_SE", "PST_SN", "CMT_SN")
);

COMMENT ON TABLE  "INS_APP"."CMS_POST_COMMENT"            IS '[04.게시판]03.게시물 댓글';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."SITE_CD"  IS '사이트 코드';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."BRD_ID"   IS '게시판 아이디';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."BRD_SE"   IS '게시판 구분';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."PST_SN"   IS '게시글 순번';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CMT_SN"   IS '댓글 순번';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CMT_TTL"  IS '댓글 제목';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."LIKE_CNT" IS '좋아요 수';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CMT_DESC" IS '댓글 내용';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."PWD_USE_YN" IS '비밀번호 사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CMT_PWD"  IS '댓글 비밀번호';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."USE_YN"   IS '사용 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."DEL_YN"   IS '삭제 여부';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CMT_DEL_SE" IS '관리자/본인삭제';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."ORD"      IS '순서';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CRT_AT"   IS '등록일시';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CRT_BY"   IS '등록자';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CRT_IP"   IS '등록자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."CRT_PGM"  IS '등록프로그램';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."UPD_AT"   IS '수정일시';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."UPD_BY"   IS '수정자';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."UPD_IP"   IS '수정자IP';
COMMENT ON COLUMN "INS_APP"."CMS_POST_COMMENT"."UPD_PGM"  IS '수정프로그램';


-- ============================================================
-- 외래키 제약조건 (Foreign Key Constraints)
-- ============================================================

-- [00.시스템]02.업무 사용자 -> [01.공통]04.부서
ALTER TABLE "INS_APP"."CMS_TASK_USER"
    ADD CONSTRAINT "FK_DEPT_TO_TASK_USER"
        FOREIGN KEY ("DEPT_CD", "ORG_CD")
            REFERENCES "INS_APP"."CMS_COMMON_DEPT" ("DEPT_CD", "ORG_CD");

-- [00.시스템]03.관리자 사용자 -> [01.공통]04.부서
ALTER TABLE "INS_APP"."CMS_ADMIN_USER"
    ADD CONSTRAINT "FK_DEPT_TO_ADMIN_USER"
        FOREIGN KEY ("DEPT_CD", "ORG_CD")
            REFERENCES "INS_APP"."CMS_COMMON_DEPT" ("DEPT_CD", "ORG_CD");

-- [01.공통]04.부서 -> [01.공통]03.조직
ALTER TABLE "INS_APP"."CMS_COMMON_DEPT"
    ADD CONSTRAINT "FK_ORG_TO_DEPT"
        FOREIGN KEY ("ORG_CD")
            REFERENCES "INS_APP"."CMS_COMMON_ORG" ("ORG_CD");

-- [01.공통]06.권한별 메뉴 -> [01.공통]05.권한
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH_MENU"
    ADD CONSTRAINT "FK_AUTH_TO_AUTH_MENU"
        FOREIGN KEY ("AUTH_CD")
            REFERENCES "INS_APP"."CMS_COMMON_AUTH" ("AUTH_CD");

-- [01.공통]06.권한별 메뉴 -> [01.공통]02.메뉴
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH_MENU"
    ADD CONSTRAINT "FK_MENU_TO_AUTH_MENU"
        FOREIGN KEY ("MENU_CD")
            REFERENCES "INS_APP"."CMS_COMMON_MENU" ("MENU_CD");

-- [03.사이트]02.사이트 아이피 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_SITE_IP"
    ADD CONSTRAINT "FK_SITE_TO_SITE_IP"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [03.사이트]03.사이트 메뉴 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_SITE_MENU"
    ADD CONSTRAINT "FK_SITE_TO_SITE_MENU"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [03.사이트]04.사이트 방문 이력 -> [03.사이트]03.사이트 메뉴
ALTER TABLE "INS_APP"."CMS_SITE_VISIT_HISTORY"
    ADD CONSTRAINT "FK_SITE_MENU_TO_VISIT_HIST"
        FOREIGN KEY ("SITE_CD", "MENU_CD")
            REFERENCES "INS_APP"."CMS_SITE_MENU" ("SITE_CD", "MENU_CD");

-- [03.사이트]05.배너 그룹 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_BANNER_GROUP"
    ADD CONSTRAINT "FK_SITE_TO_BANNER_GRP"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [03.사이트]06.배너 -> [03.사이트]05.배너 그룹
ALTER TABLE "INS_APP"."CMS_BANNER"
    ADD CONSTRAINT "FK_BANNER_GRP_TO_BANNER"
        FOREIGN KEY ("BNR_GRP_ID", "SITE_CD")
            REFERENCES "INS_APP"."CMS_BANNER_GROUP" ("BNR_GRP_ID", "SITE_CD");

-- [03.사이트]07.컨텐츠 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_CONTENT"
    ADD CONSTRAINT "FK_SITE_TO_CONTENT"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [03.사이트]08.컨텐츠 SEO -> [03.사이트]07.컨텐츠
ALTER TABLE "INS_APP"."CMS_CONTENT_SEO"
    ADD CONSTRAINT "FK_CONTENT_TO_CONTENT_SEO"
        FOREIGN KEY ("SITE_CD", "CTT_ID")
            REFERENCES "INS_APP"."CMS_CONTENT" ("SITE_CD", "CTT_ID");

-- [03.사이트]09.팝업 -> [03.사이트]10.팝업 그룹
ALTER TABLE "INS_APP"."CMS_POPUP"
    ADD CONSTRAINT "FK_POPUP_GRP_TO_POPUP"
        FOREIGN KEY ("SITE_CD", "POP_GRP_ID")
            REFERENCES "INS_APP"."CMS_POPUP_GROUP" ("SITE_CD", "POP_GRP_ID");

-- [03.사이트]10.팝업 그룹 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_POPUP_GROUP"
    ADD CONSTRAINT "FK_SITE_TO_POPUP_GRP"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [03.사이트]11.파일관리 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_FILE"
    ADD CONSTRAINT "FK_SITE_TO_FILE"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [04.게시판]01.게시판 -> [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_BOARD"
    ADD CONSTRAINT "FK_SITE_TO_BOARD"
        FOREIGN KEY ("SITE_CD")
            REFERENCES "INS_APP"."CMS_SITE" ("SITE_CD");

-- [04.게시판]02.게시글 -> [04.게시판]01.게시판
ALTER TABLE "INS_APP"."CMS_POST"
    ADD CONSTRAINT "FK_BOARD_TO_POST"
        FOREIGN KEY ("SITE_CD", "BRD_ID", "BRD_SE")
            REFERENCES "INS_APP"."CMS_BOARD" ("SITE_CD", "BRD_ID", "BRD_SE");

-- [04.게시판]03.게시물 댓글 -> [04.게시판]02.게시글
ALTER TABLE "INS_APP"."CMS_POST_COMMENT"
    ADD CONSTRAINT "FK_POST_TO_POST_COMMENT"
        FOREIGN KEY ("SITE_CD", "BRD_ID", "BRD_SE", "PST_SN")
            REFERENCES "INS_APP"."CMS_POST" ("SITE_CD", "BRD_ID", "BRD_SE", "PST_SN");