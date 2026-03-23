-- [00.시스템]01.일반 사용자
CREATE TABLE "INS_APP"."CMS_USER" (
                                      "USER_ID" VARCHAR(100) NOT NULL,
                                      "USER_NM" VARCHAR(100) NULL,
                                      "MTELNO" VARCHAR(20) NULL,
                                      "TELNO" VARCHAR(20) NULL,
                                      "GNDR_SE" VARCHAR(20) NULL,
                                      "EML" VARCHAR(100) NULL,
                                      "ADDR" VARCHAR(255) NULL,
                                      "DADDR" VARCHAR(255) NULL,
                                      "ZIP" VARCHAR(10) NULL,
                                      "ACC_EXP_YMD" DATE NULL,
                                      "EML_CERT_YN" VARCHAR(1) NULL,
                                      "TELNO_CERT_YN" VARCHAR(1) NULL,
                                      "LST_LGN_DT" TIMESTAMP NULL,
                                      "LST_LGN_IP" VARCHAR(40) NULL,
                                      "WD_DT" DATE NULL,
                                      "USER_STS_SE" VARCHAR(20) NULL,
                                      "CI" VARCHAR(100) NULL,
                                      "DI" VARCHAR(100) NULL,
                                      "CRT_AT" DATE NOT NULL,
                                      "CRT_BY" VARCHAR(100) NOT NULL,
                                      "CRT_IP" VARCHAR(40) NOT NULL,
                                      "CRT_PGM" VARCHAR(100) NOT NULL,
                                      "UPD_AT" DATE NOT NULL,
                                      "UPD_BY" VARCHAR(100) NOT NULL,
                                      "UPD_IP" VARCHAR(40) NOT NULL,
                                      "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', '*', '[00.시스템]01.일반 사용자', systimestamp, CURRENT_USER);

-- [00.시스템]01.일반 사용자
ALTER TABLE "INS_APP"."CMS_USER"
    ADD CONSTRAINT "PK_CMS_USER" -- [00.시스템]01.일반 사용자 기본키
        PRIMARY KEY (
                     "USER_ID" -- 사용자 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'USER_NM', '사용자 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'MTELNO', '휴대전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'TELNO', '전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'GNDR_SE', '성별 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'EML', '이메일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'ADDR', '주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'DADDR', '상세주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'ZIP', '우편번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'ACC_EXP_YMD', '접근 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'EML_CERT_YN', '이메일 인증 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'TELNO_CERT_YN', '전화번호 인증 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'LST_LGN_DT', '최종 로그인 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'LST_LGN_IP', '최종 로그인 IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'WD_DT', '탈퇴 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'USER_STS_SE', '공통 코드로 관리', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'CI', 'CI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'DI', 'DI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]02.업무 사용자
CREATE TABLE "INS_APP"."CMS_TASK_USER" (
                                           "TASK_USER_ID" VARCHAR(100) NOT NULL,
                                           "USER_NM" VARCHAR(100) NULL,
                                           "GNDR_SE" VARCHAR(20) NULL,
                                           "MTELNO" VARCHAR(20) NULL,
                                           "EML" VARCHAR(100) NULL,
                                           "TELNO" VARCHAR(20) NULL,
                                           "ADDR" VARCHAR(255) NULL,
                                           "DADDR" VARCHAR(255) NULL,
                                           "AUTH_EXP_YMD" VARCHAR(8) NULL,
                                           "AUTH_GRNT_YMD" VARCHAR(8) NULL,
                                           "AUTH_RVK_SE" VARCHAR(20) NULL,
                                           "USER_STS_SE" VARCHAR(20) NULL,
                                           "DEPT_CD" VARCHAR(20) NULL,
                                           "ORG_CD" VARCHAR(20) NULL,
                                           "CI" VARCHAR(100) NULL,
                                           "DI" VARCHAR(100) NULL,
                                           "CRT_AT" DATE NOT NULL,
                                           "CRT_BY" VARCHAR(100) NOT NULL,
                                           "CRT_IP" VARCHAR(40) NOT NULL,
                                           "CRT_PGM" VARCHAR(100) NOT NULL,
                                           "UPD_AT" DATE NOT NULL,
                                           "UPD_BY" VARCHAR(100) NOT NULL,
                                           "UPD_IP" VARCHAR(40) NOT NULL,
                                           "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', '*', '[00.시스템]02.업무 사용자', systimestamp, CURRENT_USER);

-- [00.시스템]02.업무 사용자
ALTER TABLE "INS_APP"."CMS_TASK_USER"
    ADD CONSTRAINT "PK_CMS_TASK_USER" -- [00.시스템]02.업무 사용자 기본키
        PRIMARY KEY (
                     "TASK_USER_ID" -- 업무사용자 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'TASK_USER_ID', '업무사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'USER_NM', '사용자 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'GNDR_SE', '성별 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'MTELNO', '휴대전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'EML', '이메일 ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'TELNO', '전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'ADDR', '주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'DADDR', '상세주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'AUTH_EXP_YMD', '권한 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'AUTH_GRNT_YMD', '권한 부여 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'AUTH_RVK_SE', '권한 부여일 초과, 만료일 초과', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'USER_STS_SE', '활성화,  비활성화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'DEPT_CD', '부서 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'ORG_CD', '조직 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'CI', 'CI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'DI', 'DI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_TASK_USER', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]03.관리자 사용자
CREATE TABLE "INS_APP"."CMS_ADMIN_USER" (
                                            "ADM_ID" VARCHAR(100) NOT NULL,
                                            "USER_NM" VARCHAR(100) NULL,
                                            "EML" VARCHAR(100) NULL,
                                            "MTELNO" VARCHAR(20) NULL,
                                            "GNDR_SE" VARCHAR(20) NULL,
                                            "TELNO" VARCHAR(20) NULL,
                                            "ADDR" VARCHAR(255) NULL,
                                            "DADDR" VARCHAR(255) NULL,
                                            "AUTH_EXP_YMD" VARCHAR(8) NULL,
                                            "AUTH_GRNT_YMD" VARCHAR(8) NULL,
                                            "AUTH_RVK_SE" VARCHAR(20) NULL,
                                            "ADM_STS_SE" VARCHAR(20) NULL,
                                            "DEPT_CD" VARCHAR(20) NULL,
                                            "ORG_CD" VARCHAR(20) NULL,
                                            "CI" VARCHAR(100) NULL,
                                            "DI" VARCHAR(100) NULL,
                                            "CRT_AT" DATE NOT NULL,
                                            "CRT_BY" VARCHAR(100) NOT NULL,
                                            "CRT_IP" VARCHAR(40) NOT NULL,
                                            "CRT_PGM" VARCHAR(100) NOT NULL,
                                            "UPD_AT" DATE NOT NULL,
                                            "UPD_BY" VARCHAR(100) NOT NULL,
                                            "UPD_IP" VARCHAR(40) NOT NULL,
                                            "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', '*', '[00.시스템]03.관리자 사용자', systimestamp, CURRENT_USER);

-- [00.시스템]03.관리자 사용자
ALTER TABLE "INS_APP"."CMS_ADMIN_USER"
    ADD CONSTRAINT "PK_CMS_ADMIN_USER" -- [00.시스템]03.관리자 사용자 기본키
        PRIMARY KEY (
                     "ADM_ID" -- 관리자 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'ADM_ID', '관리자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'USER_NM', '사용자 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'EML', '이메일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'MTELNO', '휴대전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'GNDR_SE', '성별 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'TELNO', '전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'ADDR', '주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'DADDR', '상세주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'AUTH_EXP_YMD', '권한 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'AUTH_GRNT_YMD', '권한 부여 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'AUTH_RVK_SE', '권한 부여일 초과, 만료일 초과', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'ADM_STS_SE', '공통코드| 활성화vs비활성화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'DEPT_CD', '부서 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'ORG_CD', '조직 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'CI', 'CI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'DI', 'DI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_ADMIN_USER', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]04.비밀번호
CREATE TABLE "INS_APP"."CMS_PASSWORD" (
                                          "USER_ID" VARCHAR(100) NOT NULL,
                                          "USER_SE" VARCHAR(20) NOT NULL,
                                          "PWD" VARCHAR(100) NOT NULL,
                                          "USE_YN" VARCHAR(1) NOT NULL,
                                          "PWD_FAIL_CNT" NUMBER(10) NULL,
                                          "PWD_CHG_YMD" DATE NULL,
                                          "PWD_CHG_SE" VARCHAR(20) NULL,
                                          "PWD_EXP_YMD" DATE NULL,
                                          "CRT_AT" DATE NOT NULL,
                                          "CRT_BY" VARCHAR(100) NOT NULL,
                                          "CRT_IP" VARCHAR(40) NOT NULL,
                                          "CRT_PGM" VARCHAR(100) NOT NULL,
                                          "UPD_AT" DATE NOT NULL,
                                          "UPD_BY" VARCHAR(100) NOT NULL,
                                          "UPD_IP" VARCHAR(40) NOT NULL,
                                          "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', '*', '[00.시스템]04.비밀번호', systimestamp, CURRENT_USER);

-- [00.시스템]04.비밀번호
ALTER TABLE "INS_APP"."CMS_PASSWORD"
    ADD CONSTRAINT "PK_CMS_PASSWORD" -- [00.시스템]04.비밀번호 기본키
        PRIMARY KEY (
                     "USER_ID", -- 사용자 아이디
                     "USER_SE"  -- 사용자 구분
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'USER_ID', '업무사용자, 사용자, 관리자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'USER_SE', '관리자, 사용자, 업무사용자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'PWD', '비밀번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'USE_YN', '사용여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'PWD_FAIL_CNT', '비밀번호 실패 횟수', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'PWD_CHG_YMD', '비밀번호 변경 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'PWD_CHG_SE', '관리자,만료,단순', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'PWD_EXP_YMD', '비밀번호 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]05.비밀번호 히스토리
CREATE TABLE "INS_APP"."CMS_PASSWORD_HISTORY" (
                                                  "SN" NUMBER(20) NOT NULL,
                                                  "PWD" VARCHAR(100) NOT NULL,
                                                  "PWD_CHG_YMD" TIMESTAMP NOT NULL,
                                                  "PWD_CHG_SE" VARCHAR(20) NULL,
                                                  "CHG_USER_ID" VARCHAR(100) NOT NULL,
                                                  "USER_SE" VARCHAR(20) NOT NULL,
                                                  "CHG_USER_IP" VARCHAR(40) NULL,
                                                  "EXP_TMG" TIMESTAMP NULL,
                                                  "CRT_AT" TIMESTAMP NOT NULL,
                                                  "CRT_BY" VARCHAR(100) NOT NULL,
                                                  "CRT_IP" VARCHAR(40) NOT NULL,
                                                  "CRT_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', '*', '[00.시스템]05.비밀번호 히스토리', systimestamp, CURRENT_USER);

-- [00.시스템]05.비밀번호 히스토리
ALTER TABLE "INS_APP"."CMS_PASSWORD_HISTORY"
    ADD CONSTRAINT "PK_CMS_PASSWORD_HISTORY" -- [00.시스템]05.비밀번호 히스토리 기본키
        PRIMARY KEY (
                     "SN" -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'PWD', '비밀번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'PWD_CHG_YMD', '비밀번호 변경 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'PWD_CHG_SE', '비밀번호 변경 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CHG_USER_ID', '업무사용자, 사용자, 관리자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'USER_SE', '관리자, 사용자, 업무사용자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CHG_USER_IP', '변경 사용자 아이피', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'EXP_TMG', '만료 시기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CRT_AT', '등록 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PASSWORD_HISTORY', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]06.갱신 토큰
CREATE TABLE "INS_APP"."CMS_REFRESH_TOKEN" (
                                               "TK_ID" VARCHAR(100) NOT NULL,
                                               "USER_ID" VARCHAR(100) NOT NULL,
                                               "TK" VARCHAR(100) NOT NULL,
                                               "EXP_DT" DATE NOT NULL,
                                               "RVK_YN" VARCHAR(1) NOT NULL,
                                               "IP_ADDR" VARCHAR(40) NULL,
                                               "USER_AGT" VARCHAR(100) NULL,
                                               "CRT_AT" DATE NOT NULL,
                                               "CRT_BY" VARCHAR(100) NOT NULL,
                                               "CRT_IP" VARCHAR(40) NOT NULL,
                                               "CRT_PGM" VARCHAR(100) NOT NULL,
                                               "UPD_AT" DATE NOT NULL,
                                               "UPD_BY" VARCHAR(100) NOT NULL,
                                               "UPD_IP" VARCHAR(40) NOT NULL,
                                               "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', '*', '[00.시스템]06.갱신 토큰', systimestamp, CURRENT_USER);

-- [00.시스템]06.갱신 토큰
ALTER TABLE "INS_APP"."CMS_REFRESH_TOKEN"
    ADD CONSTRAINT "PK_CMS_REFRESH_TOKEN" -- [00.시스템]06.갱신 토큰 기본키
        PRIMARY KEY (
                     "TK_ID" -- 토큰 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'TK_ID', '토큰 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'TK', 'TOKEN ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'EXP_DT', 'EXPIRES_AT ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'RVK_YN', 'REVOKED_YN', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'IP_ADDR', '아이피 주소', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'USER_AGT', 'USER_AGENT ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_REFRESH_TOKEN', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]07.사용자 SNS 연동
CREATE TABLE "INS_APP"."CMS_USER_SNS_INTERFACE" (
                                                    "SN" NUMBER(15) NOT NULL,
                                                    "USER_ID" VARCHAR(100) NOT NULL,
                                                    "USER_SE" VARCHAR(20) NOT NULL,
                                                    "PRVD" VARCHAR(100) NOT NULL,
                                                    "PRVD_UID" VARCHAR(50) NULL,
                                                    "PRVD_EML" VARCHAR(100) NULL,
                                                    "IF_DESC" VARCHAR(4000) NULL,
                                                    "ACC_TK" VARCHAR(100) NULL,
                                                    "RF_TK" VARCHAR(100) NULL,
                                                    "TK_EXP_DT" DATE NULL,
                                                    "MAIN_LGN_YN" <데이터 타입 없음> NULL,
                                                    "LGN_AVL_YN" VARCHAR(1) NULL,
                                                    "LST_LGN_DT" <데이터 타입 없음> NULL,
                                                    "IF_STS_SE" <데이터 타입 없음> NULL,
                                                    "IF_FST_TMG" <데이터 타입 없음> NULL,
                                                    "IF_END_TMG" <데이터 타입 없음> NULL,
                                                    "IF_IP" <데이터 타입 없음> NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', '*', '[00.시스템]07.사용자 SNS 연동', systimestamp, CURRENT_USER);

-- [00.시스템]07.사용자 SNS 연동
ALTER TABLE "INS_APP"."CMS_USER_SNS_INTERFACE"
    ADD CONSTRAINT "PK_CMS_USER_SNS_INTERFACE" -- [00.시스템]07.사용자 SNS 연동 기본키
        PRIMARY KEY (
                     "SN" -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'USER_SE', '사용자 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'PRVD', 'provider (구글, 카카오, 네이버,애플)', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'PRVD_UID', '공급자 UID', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'PRVD_EML', '공급자 이메일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'IF_DESC', '추가 컬럼', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'ACC_TK', '암호화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'RF_TK', '암호화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'TK_EXP_DT', '토큰 만료 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'MAIN_LGN_YN', '주요 로그인 방식으로 사용하는지', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'LGN_AVL_YN', '로그인 가능, 불가능', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'LST_LGN_DT', '최종 로그인 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'IF_STS_SE', '활성화, 비활성화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'IF_FST_TMG', '연동 최초 시기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'IF_END_TMG', '연동 종료 시기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_SNS_INTERFACE', 'IF_IP', '연동 아이피', systimestamp, CURRENT_USER);

-- [00.시스템]08.사용자 권한
CREATE TABLE "INS_APP"."CMS_USER_AUTH" (
                                           "USER_ID" VARCHAR(100) NOT NULL,
                                           "AUTH_CD" VARCHAR(20) NOT NULL,
                                           "AUTH_EXP_YMD" VARCHAR(8) NULL,
                                           "AUTH_GRNT_YMD" VARCHAR(8) NULL,
                                           "AUTH_SE" VARCHAR(20) NULL,
                                           "CRT_AT" DATE NOT NULL,
                                           "CRT_BY" VARCHAR(100) NOT NULL,
                                           "CRT_IP" VARCHAR(40) NOT NULL,
                                           "CRT_PGM" VARCHAR(100) NOT NULL,
                                           "UPD_AT" DATE NOT NULL,
                                           "UPD_BY" VARCHAR(100) NOT NULL,
                                           "UPD_IP" VARCHAR(40) NOT NULL,
                                           "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', '*', '[00.시스템]08.사용자 권한', systimestamp, CURRENT_USER);

-- [00.시스템]08.사용자 권한
ALTER TABLE "INS_APP"."CMS_USER_AUTH"
    ADD CONSTRAINT "PK_CMS_USER_AUTH" -- [00.시스템]08.사용자 권한 기본키
        PRIMARY KEY (
                     "USER_ID", -- 사용자 아이디
                     "AUTH_CD"  -- 권한 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'USER_ID', '업무사용자, 관리자, 일반사용자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'AUTH_CD', '권한 테이블', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'AUTH_EXP_YMD', '권한 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'AUTH_GRNT_YMD', '권한 부여 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'AUTH_SE', '전체,부서,개인', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]09.사용자 권한 로그
CREATE TABLE "INS_APP"."CMS_USER_AUTH_LOG" (
                                               "LOG_DT" DATE NULL,
                                               "LOG_RSN" VARCHAR(4000) NULL,
                                               "USER_ID" VARCHAR(100) NOT NULL,
                                               "AUTH_CD" VARCHAR(20) NOT NULL,
                                               "AUTH_EXP_YMD" VARCHAR(8) NULL,
                                               "AUTH_GRNT_YMD" VARCHAR(8) NULL,
                                               "AUTH_SE" VARCHAR(20) NULL,
                                               "CRT_AT" DATE NOT NULL,
                                               "CRT_BY" VARCHAR(100) NOT NULL,
                                               "CRT_IP" VARCHAR(40) NOT NULL,
                                               "CRT_PGM" VARCHAR(100) NOT NULL,
                                               "UPD_AT" DATE NOT NULL,
                                               "UPD_BY" VARCHAR(100) NOT NULL,
                                               "UPD_IP" VARCHAR(40) NOT NULL,
                                               "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', '*', '[00.시스템]09.사용자 권한 로그', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'LOG_DT', '로그 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'LOG_RSN', '로그 사유', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'USER_ID', '업무사용자, 관리자, 일반사용자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'AUTH_CD', '권한 테이블', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'AUTH_EXP_YMD', '권한 만료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'AUTH_GRNT_YMD', '권한 부여 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'AUTH_SE', '전체,부서,개인', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_AUTH_LOG', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]10.사용자 인증
CREATE TABLE "INS_APP"."CMS_USER_CERT" (
                                           "SN" NUMBER(15) NOT NULL,
                                           "CERT_ID" VARCHAR(100) NOT NULL,
                                           "MTELNO" VARCHAR(20) NULL,
                                           "EML" VARCHAR(1) NULL,
                                           "CERT_SE" VARCHAR(20) NULL,
                                           "CERT_NO" VARCHAR(100) NOT NULL,
                                           "CRT_AT" DATE NOT NULL,
                                           "CRT_BY" VARCHAR(100) NOT NULL,
                                           "CRT_IP" VARCHAR(40) NOT NULL,
                                           "CRT_PGM" VARCHAR(100) NOT NULL,
                                           "UPD_AT" DATE NOT NULL,
                                           "UPD_BY" VARCHAR(100) NOT NULL,
                                           "UPD_IP" VARCHAR(40) NOT NULL,
                                           "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', '*', '[00.시스템]10.사용자 인증', systimestamp, CURRENT_USER);

-- [00.시스템]10.사용자 인증
ALTER TABLE "INS_APP"."CMS_USER_CERT"
    ADD CONSTRAINT "PK_CMS_USER_CERT" -- [00.시스템]10.사용자 인증 기본키
        PRIMARY KEY (
                     "SN",      -- 일련번호
                     "CERT_ID"  -- 인증 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CERT_ID', '인증 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'MTELNO', '휴대전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'EML', '이메일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CERT_SE', '이메일,휴대전화번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CERT_NO', '인증 번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_USER_CERT', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]11.개인정보 조회 이력 로그
CREATE TABLE "INS_APP"."CMS_PRIVACY_SEARCH_LOG" (
                                                    "SN" NUMBER(15) NOT NULL,
                                                    "SITE_SE" VARCHAR(20) NULL,
                                                    "SITE_CD" VARCHAR(20) NULL,
                                                    "ACC_USER_ID" VARCHAR(100) NULL,
                                                    "ACC_USER_NM" VARCHAR(100) NULL,
                                                    "TGT_USER_ID" VARCHAR(100) NULL,
                                                    "TGT_USER_NM" VARCHAR(100) NULL,
                                                    "QRY_RSN" VARCHAR(4000) NULL,
                                                    "QRY_PATH" VARCHAR(1000) NULL,
                                                    "ACC_IP" VARCHAR(40) NULL,
                                                    "USER_AGT" VARCHAR(100) NULL,
                                                    "EXP_DT" DATE NULL,
                                                    "CRT_AT" DATE NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', '*', '[00.시스템]11.개인정보 조회 이력 로그', systimestamp, CURRENT_USER);

-- [00.시스템]11.개인정보 조회 이력 로그
ALTER TABLE "INS_APP"."CMS_PRIVACY_SEARCH_LOG"
    ADD CONSTRAINT "PK_CMS_PRIVACY_SEARCH_LOG" -- [00.시스템]11.개인정보 조회 이력 로그 기본키
        PRIMARY KEY (
                     "SN" -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'SITE_SE', 'CMS| 사용자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'ACC_USER_ID', '접근 사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'ACC_USER_NM', '삭제돼도 보존', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'TGT_USER_ID', '타겟 사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'TGT_USER_NM', '타겟 사용자 이름', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'QRY_RSN', '본인확인, 회원정보 확인', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'QRY_PATH', 'URL', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'ACC_IP', '접근 아이피', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'USER_AGT', '사용자 에이전트', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'EXP_DT', '법적 보관 만료기한', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PRIVACY_SEARCH_LOG', 'CRT_AT', '등록 일시', systimestamp, CURRENT_USER);

-- [00.시스템]12.사용자 전환 로그인 로그
CREATE TABLE "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG" (
                                                       "COL" NUMBER(15) NOT NULL,
                                                       "TGT_ID" VARCHAR(100) NULL,
                                                       "USER_SE" VARCHAR(20) NULL,
                                                       "USER_ID" VARCHAR(100) NULL,
                                                       "USE_DT" DATE NULL,
                                                       "USE_IP" <데이터 타입 없음> NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', '*', '[00.시스템]12.사용자 전환 로그인 로그', systimestamp, CURRENT_USER);

-- [00.시스템]12.사용자 전환 로그인 로그
ALTER TABLE "INS_APP"."CMS_SWITCH_USER_LOGIN_LOG"
    ADD CONSTRAINT "PK_CMS_SWITCH_USER_LOGIN_LOG" -- [00.시스템]12.사용자 전환 로그인 로그 기본키
        PRIMARY KEY (
                     "COL" -- SN
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'COL', 'SN', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'TGT_ID', '타겟 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'USER_SE', '사용자 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'USE_DT', '사용 일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SWITCH_USER_LOGIN_LOG', 'USE_IP', '사용 아이피', systimestamp, CURRENT_USER);

-- [00.시스템]98.푸시 토큰
CREATE TABLE "INS_APP"."CMS_PUSH_TOKEN" (
                                            "SN" NUMBER(15) NOT NULL,
                                            "SITE_CD" VARCHAR(20) NOT NULL,
                                            "USER_ID" VARCHAR(100) NOT NULL,
                                            "USER_SE" VARCHAR(20) NULL,
                                            "DVC_ID" <데이터 타입 없음> NULL,
                                            "DVC_NM" <데이터 타입 없음> NULL,
                                            "DVC_SE" <데이터 타입 없음> NOT NULL,
                                            "OS_VER" <데이터 타입 없음> NULL,
                                            "APP_VER" <데이터 타입 없음> NULL,
                                            "PUSH_CH" <데이터 타입 없음> NULL,
                                            "PUSH_TK" VARCHAR(100) NOT NULL,
                                            "_" VARCHAR(100) NULL,
                                            "USE_YN" <데이터 타입 없음> NULL,
                                            "PUSH_AGR_YN" <데이터 타입 없음> NULL,
                                            "LST_PUSH_USE_TMG" <데이터 타입 없음> NULL,
                                            "TK_EXP_TMG" <데이터 타입 없음> NULL,
                                            "CRT_AT" DATE NOT NULL,
                                            "CRT_BY" VARCHAR(100) NOT NULL,
                                            "CRT_IP" VARCHAR(40) NOT NULL,
                                            "CRT_PGM" VARCHAR(100) NOT NULL,
                                            "UPD_AT" DATE NOT NULL,
                                            "UPD_BY" VARCHAR(100) NOT NULL,
                                            "UPD_IP" VARCHAR(40) NOT NULL,
                                            "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', '*', '[00.시스템]98.푸시 토큰', systimestamp, CURRENT_USER);

-- [00.시스템]98.푸시 토큰
ALTER TABLE "INS_APP"."CMS_PUSH_TOKEN"
    ADD CONSTRAINT "PK_CMS_PUSH_TOKEN" -- [00.시스템]98.푸시 토큰 기본키
        PRIMARY KEY (
                     "SN" -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'USER_SE', '사용자 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'DVC_ID', '장치 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'DVC_NM', '장치 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'DVC_SE', ' ios,android, ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'OS_VER', '운영체제 버전', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'APP_VER', '앱 버전', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'PUSH_CH', 'fcm | apns | web_push', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'PUSH_TK', '푸시 토큰', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', '_', 'apns 암호화', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'PUSH_AGR_YN', '푸시 동의 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'LST_PUSH_USE_TMG', '최종 푸시 사용 시기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'TK_EXP_TMG', '토큰 만료 시기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]99.푸시 토큰 이력
CREATE TABLE "INS_APP"."CMS_PUSH_TOKEN_LOG" (
                                                "SN" <데이터 타입 없음> NOT NULL,
                                                "SITE_CD" <데이터 타입 없음> NULL,
                                                "USER_ID" <데이터 타입 없음> NULL,
                                                "DVC_ID" <데이터 타입 없음> NULL,
                                                "PUSH_CH" <데이터 타입 없음> NULL,
                                                "TK_KND_SE" <데이터 타입 없음> NOT NULL,
                                                "RSLT_CD" <데이터 타입 없음> NULL,
                                                "RSLT_MSG" <데이터 타입 없음> NULL,
                                                "CRT_AT" DATE NOT NULL,
                                                "CRT_BY" VARCHAR(100) NOT NULL,
                                                "CRT_IP" VARCHAR(40) NOT NULL,
                                                "CRT_PGM" VARCHAR(100) NOT NULL,
                                                "UPD_AT" DATE NOT NULL,
                                                "UPD_BY" VARCHAR(100) NOT NULL,
                                                "UPD_IP" VARCHAR(40) NOT NULL,
                                                "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', '*', '[00.시스템]99.푸시 토큰 이력', systimestamp, CURRENT_USER);

-- [00.시스템]99.푸시 토큰 이력
ALTER TABLE "INS_APP"."CMS_PUSH_TOKEN_LOG"
    ADD CONSTRAINT "PK_CMS_PUSH_TOKEN_LOG" -- [00.시스템]99.푸시 토큰 이력 기본키
        PRIMARY KEY (
                     "SN" -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'USER_ID', '사용자 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'DVC_ID', '장치 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'PUSH_CH', '푸시 채널', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'TK_KND_SE', '등록,갱신,삭제,발송성공,발송실패,토큰만료', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'RSLT_CD', '결과 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'RSLT_MSG', '결과 메시지', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_PUSH_TOKEN_LOG', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]01.코드
CREATE TABLE "INS_APP"."CMS_COMMON_CODE" (
                                             "CD" VARCHAR(20) NOT NULL,
                                             "CD_NM" VARCHAR(200) NULL,
                                             "CD_LVL" NUMBER(10) NULL,
                                             "UP_CD" VARCHAR(20) NULL,
                                             "USE_YN" VARCHAR(1) NULL,
                                             "ORD" NUMBER(10) NULL,
                                             "REF_CD1" VARCHAR(20) NULL,
                                             "REF_CD2" VARCHAR(20) NULL,
                                             "REF_CD3" VARCHAR(20) NULL,
                                             "REF_CD4" VARCHAR(20) NULL,
                                             "REF_CD5" VARCHAR(20) NULL,
                                             "REF_NUM1" NUMBER(10,4) NULL,
                                             "REF_NUM2" NUMBER(10,4) NULL,
                                             "REF_NUM3" NUMBER(10,4) NULL,
                                             "REF_NUM4" NUMBER(10,4) NULL,
                                             "REF_NUM5" NUMBER(10,4) NULL,
                                             "RMK" VARCHAR(4000) NULL,
                                             "CRT_AT" DATE NOT NULL,
                                             "CRT_BY" VARCHAR(100) NOT NULL,
                                             "CRT_IP" VARCHAR(40) NOT NULL,
                                             "CRT_PGM" VARCHAR(100) NOT NULL,
                                             "UPD_AT" DATE NOT NULL,
                                             "UPD_BY" VARCHAR(100) NOT NULL,
                                             "UPD_IP" VARCHAR(40) NOT NULL,
                                             "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', '*', '[01.공통]01.코드', systimestamp, CURRENT_USER);

-- [01.공통]01.코드
ALTER TABLE "INS_APP"."CMS_COMMON_CODE"
    ADD CONSTRAINT "PK_CMS_COMMON_CODE" -- [01.공통]01.코드 기본키
        PRIMARY KEY (
                     "CD" -- 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CD', '여기서는 관리코드로 등록을 해야하나요? 도메인', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CD_NM', '코드 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CD_LVL', '코드 레벨', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'UP_CD', '상위 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_CD1', '참조 코드1', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_CD2', '참조 코드2', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_CD3', '참조 코드3', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_CD4', '참조 코드4', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_CD5', '참조 코드5', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_NUM1', '참조 숫자1', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_NUM2', '참조 숫자2', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_NUM3', '참조 숫자3', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_NUM4', '참조 숫자4', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'REF_NUM5', '참조 숫자5', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_CODE', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]02.메뉴
CREATE TABLE "INS_APP"."CMS_COMMON_MENU" (
                                             "MENU_CD" VARCHAR(20) NOT NULL,
                                             "PRGM_NM" VARCHAR(300) NULL,
                                             "PRGM_PATH" VARCHAR(400) NULL,
                                             "MENU_LVL" NUMBER(10) NULL,
                                             "UP_MENU_CD" VARCHAR(20) NULL,
                                             "MENU_NM" VARCHAR(100) NULL,
                                             "ORD" NUMBER(10) NULL,
                                             "QRY_USE_YN" VARCHAR(1) NULL,
                                             "NEW_USE_YN" VARCHAR(1) NULL,
                                             "SAVE_USE_YN" VARCHAR(1) NULL,
                                             "DEL_USE_YN" VARCHAR(1) NULL,
                                             "OUTP_USE_YN" VARCHAR(1) NULL,
                                             "URL_MTHD_SE" VARCHAR(20) NULL,
                                             "URL_ADDR" VARCHAR(255) NULL,
                                             "PARAM1" VARCHAR(100) NULL,
                                             "PARAM2" VARCHAR(100) NULL,
                                             "PARAM3" VARCHAR(100) NULL,
                                             "PARAM_4" VARCHAR(100) NULL,
                                             "PARAM_5" VARCHAR(100) NULL,
                                             "RMK" VARCHAR(4000) NULL,
                                             "PRV_USE_YN" VARCHAR(1) NULL,
                                             "CRT_AT" DATE NOT NULL,
                                             "CRT_BY" VARCHAR(100) NOT NULL,
                                             "CRT_IP" VARCHAR(40) NOT NULL,
                                             "CRT_PGM" VARCHAR(100) NOT NULL,
                                             "UPD_AT" DATE NOT NULL,
                                             "UPD_BY" VARCHAR(100) NOT NULL,
                                             "UPD_IP" VARCHAR(40) NOT NULL,
                                             "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', '*', '[01.공통]02.메뉴', systimestamp, CURRENT_USER);

-- [01.공통]02.메뉴
ALTER TABLE "INS_APP"."CMS_COMMON_MENU"
    ADD CONSTRAINT "PK_CMS_COMMON_MENU" -- [01.공통]02.메뉴 기본키
        PRIMARY KEY (
                     "MENU_CD" -- 메뉴 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'MENU_CD', '메뉴 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PRGM_NM', '소스 파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PRGM_PATH', '소스 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'MENU_LVL', '1레벨, 2레벨', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'UP_MENU_CD', '상위 메뉴 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'MENU_NM', '메뉴 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'QRY_USE_YN', 'CMS 메뉴는 이렇게 관리??', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'NEW_USE_YN', '신규 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'SAVE_USE_YN', '저장 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'DEL_USE_YN', '삭제 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'OUTP_USE_YN', '출력 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'URL_MTHD_SE', '내부/ 새창', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'URL_ADDR', '외부  URL 사용하는 경우', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PARAM1', '매뉴 오픈 시 사용될 수 있을 듯', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PARAM2', '파라미터2', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PARAM3', '파라미터3', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PARAM_4', '파라미터4', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PARAM_5', '파라미터5', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'PRV_USE_YN', '개인정보 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_MENU', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]03.조직
CREATE TABLE "INS_APP"."CMS_COMMON_ORG" (
                                            "ORG_CD" VARCHAR(20) NOT NULL,
                                            "ORG_NM" VARCHAR(30) NULL,
                                            "ORG_STS_SE" VARCHAR(20) NULL,
                                            "ORD" NUMBER(10) NULL,
                                            "USE_YN" VARCHAR(1) NULL,
                                            "CRT_AT" DATE NOT NULL,
                                            "CRT_BY" VARCHAR(100) NOT NULL,
                                            "CRT_IP" VARCHAR(40) NOT NULL,
                                            "CRT_PGM" VARCHAR(100) NOT NULL,
                                            "UPD_AT" DATE NOT NULL,
                                            "UPD_BY" VARCHAR(100) NOT NULL,
                                            "UPD_IP" VARCHAR(40) NOT NULL,
                                            "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', '*', '[01.공통]03.조직', systimestamp, CURRENT_USER);

-- [01.공통]03.조직
ALTER TABLE "INS_APP"."CMS_COMMON_ORG"
    ADD CONSTRAINT "PK_CMS_COMMON_ORG" -- [01.공통]03.조직 기본키
        PRIMARY KEY (
                     "ORG_CD" -- 조직 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'ORG_CD', '조직 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'ORG_NM', '조직 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'ORG_STS_SE', '조직 상태 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'USE_YN', '사용여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_ORG', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]04.부서
CREATE TABLE "INS_APP"."CMS_COMMON_DEPT" (
                                             "DEPT_CD" VARCHAR(20) NOT NULL,
                                             "ORG_CD" VARCHAR(20) NOT NULL,
                                             "DEPT_NM" VARCHAR(50) NULL,
                                             "ORD" NUMBER(10) NULL,
                                             "USE_YN" VARCHAR(1) NULL,
                                             "CRT_AT" DATE NOT NULL,
                                             "CRT_BY" VARCHAR(100) NOT NULL,
                                             "CRT_IP" VARCHAR(40) NOT NULL,
                                             "CRT_PGM" VARCHAR(100) NOT NULL,
                                             "UPD_AT" DATE NOT NULL,
                                             "UPD_BY" VARCHAR(100) NOT NULL,
                                             "UPD_IP" VARCHAR(40) NOT NULL,
                                             "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', '*', '[01.공통]04.부서', systimestamp, CURRENT_USER);

-- [01.공통]04.부서
ALTER TABLE "INS_APP"."CMS_COMMON_DEPT"
    ADD CONSTRAINT "PK_CMS_COMMON_DEPT" -- [01.공통]04.부서 기본키
        PRIMARY KEY (
                     "DEPT_CD", -- 부서 코드
                     "ORG_CD"   -- 조직 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'DEPT_CD', '부서 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'ORG_CD', '조직 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'DEPT_NM', '부서 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_DEPT', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]05.권한
CREATE TABLE "INS_APP"."CMS_COMMON_AUTH" (
                                             "AUTH_CD" VARCHAR(20) NOT NULL,
                                             "MENU_CD" VARCHAR(20) NULL,
                                             "AUTH_NM" VARCHAR(100) NULL,
                                             "AUTH_SE" VARCHAR(20) NULL,
                                             "AUTH_ORG_CD" VARCHAR(20) NULL,
                                             "AUTH_DEPT_CD" VARCHAR(20) NULL,
                                             "AUTH_LVL" NUMBER(10) NULL,
                                             "ORD" NUMBER(10) NULL,
                                             "USE_YN" VARCHAR(1) NULL,
                                             "DESC" VARCHAR(4000) NULL,
                                             "RMK" VARCHAR(4000) NULL,
                                             "CRT_AT" DATE NOT NULL,
                                             "CRT_BY" VARCHAR(100) NOT NULL,
                                             "CRT_IP" VARCHAR(40) NOT NULL,
                                             "CRT_PGM" VARCHAR(100) NOT NULL,
                                             "UPD_AT" DATE NOT NULL,
                                             "UPD_BY" VARCHAR(100) NOT NULL,
                                             "UPD_IP" VARCHAR(40) NOT NULL,
                                             "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', '*', '[01.공통]05.권한', systimestamp, CURRENT_USER);

-- [01.공통]05.권한
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH"
    ADD CONSTRAINT "PK_CMS_COMMON_AUTH" -- [01.공통]05.권한 기본키
        PRIMARY KEY (
                     "AUTH_CD" -- 권한 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_CD', '권한 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'MENU_CD', '메뉴 1레벨(공통관리, 업무단위등)', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_NM', '권한 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_SE', '전체권한,부서권한,개인권한', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_ORG_CD', '조직관리(ORG_CD)', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_DEPT_CD', '부서관리(DEPT_CD)', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'AUTH_LVL', '1,2,3,4,5 가 편한가요..', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'USE_YN', '사용여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'DESC', '내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [01.공통]06.권한별 메뉴
CREATE TABLE "INS_APP"."CMS_COMMON_AUTH_MENU" (
                                                  "MENU_CD" VARCHAR(20) NOT NULL,
                                                  "AUTH_CD" VARCHAR(20) NOT NULL,
                                                  "AUTH_SE" VARCHAR(20) NULL,
                                                  "USE_YN" VARCHAR(1) NULL,
                                                  "QRY_YN" VARCHAR(1) NULL,
                                                  "SAVE_YN" VARCHAR(1) NULL,
                                                  "DEL_YN" VARCHAR(1) NULL,
                                                  "NEW_YN" VARCHAR(1) NULL,
                                                  "EXL_YN" VARCHAR(1) NULL,
                                                  "OUTP_YN" VARCHAR(1) NULL,
                                                  "CRT_AT" DATE NOT NULL,
                                                  "CRT_BY" VARCHAR(100) NOT NULL,
                                                  "CRT_IP" VARCHAR(40) NOT NULL,
                                                  "CRT_PGM" VARCHAR(100) NOT NULL,
                                                  "UPD_AT" DATE NOT NULL,
                                                  "UPD_BY" VARCHAR(100) NOT NULL,
                                                  "UPD_IP" VARCHAR(40) NOT NULL,
                                                  "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', '*', '[01.공통]06.권한별 메뉴', systimestamp, CURRENT_USER);

-- [01.공통]06.권한별 메뉴
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH_MENU"
    ADD CONSTRAINT "PK_CMS_COMMON_AUTH_MENU" -- [01.공통]06.권한별 메뉴 기본키
        PRIMARY KEY (
                     "MENU_CD", -- 메뉴 코드
                     "AUTH_CD"  -- 권한 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'MENU_CD', '메뉴 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'AUTH_CD', '권한 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'AUTH_SE', '개인/부서/전체', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'QRY_YN', '조회 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'SAVE_YN', '저장 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'DEL_YN', '삭제 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'NEW_YN', '신규 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'EXL_YN', '엑셀 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'OUTP_YN', '출력 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_COMMON_AUTH_MENU', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]01.사이트
CREATE TABLE "INS_APP"."CMS_SITE" (
                                      "SITE_CD" VARCHAR(20) NOT NULL,
                                      "SITE_NM" VARCHAR(100) NULL,
                                      "SITE_DESC" VARCHAR(4000) NULL,
                                      "USE_YN" VARCHAR(1) NULL,
                                      "CRT_AT" DATE NOT NULL,
                                      "CRT_BY" VARCHAR(100) NOT NULL,
                                      "CRT_IP" VARCHAR(40) NOT NULL,
                                      "CRT_PGM" VARCHAR(100) NOT NULL,
                                      "UPD_AT" DATE NOT NULL,
                                      "UPD_BY" VARCHAR(100) NOT NULL,
                                      "UPD_IP" VARCHAR(40) NOT NULL,
                                      "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', '*', '[03.사이트]01.사이트', systimestamp, CURRENT_USER);

-- [03.사이트]01.사이트
ALTER TABLE "INS_APP"."CMS_SITE"
    ADD CONSTRAINT "PK_CMS_SITE" -- [03.사이트]01.사이트 기본키
        PRIMARY KEY (
                     "SITE_CD" -- 사이트 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'SITE_CD', '사이트 코드?', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'SITE_NM', '사이트 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'SITE_DESC', '사이트 설명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]02.사이트 아이피
CREATE TABLE "INS_APP"."CMS_SITE_IP" (
                                         "SITE_CD" VARCHAR(20) NOT NULL,
                                         "SN" VARCHAR(20) NOT NULL,
                                         "USE_YN" VARCHAR(1) NULL,
                                         "DESC" VARCHAR(4000) NULL,
                                         "PERM_IP" VARCHAR(40) NULL,
                                         "USE_ST_YMD" VARCHAR(8) NULL,
                                         "USE_END_YMD" VARCHAR(8) NULL,
                                         "CRT_AT" DATE NOT NULL,
                                         "CRT_BY" VARCHAR(100) NOT NULL,
                                         "CRT_IP" VARCHAR(40) NOT NULL,
                                         "CRT_PGM" VARCHAR(100) NOT NULL,
                                         "UPD_AT" DATE NOT NULL,
                                         "UPD_BY" VARCHAR(100) NOT NULL,
                                         "UPD_IP" VARCHAR(40) NOT NULL,
                                         "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', '*', '[03.사이트]02.사이트 아이피', systimestamp, CURRENT_USER);

-- [03.사이트]02.사이트 아이피
ALTER TABLE "INS_APP"."CMS_SITE_IP"
    ADD CONSTRAINT "PK_CMS_SITE_IP" -- [03.사이트]02.사이트 아이피 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "SN"       -- 일련번호
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'DESC', '내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'PERM_IP', '허용 아이피', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'USE_ST_YMD', '사용 시작 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'USE_END_YMD', '사용 종료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_IP', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]03.사이트 메뉴
CREATE TABLE "INS_APP"."CMS_SITE_MENU" (
                                           "SITE_CD" VARCHAR(20) NOT NULL,
                                           "MENU_CD" VARCHAR(20) NOT NULL,
                                           "MENU_LVL" NUMBER(10) NULL,
                                           "UP_MENU_CD" VARCHAR(20) NULL,
                                           "PRGM_PATH" VARCHAR(400) NULL,
                                           "MENU_NM" VARCHAR(100) NULL,
                                           "MENU_SE" VARCHAR(20) NULL,
                                           "BRD_ID" VARCHAR(100) NULL,
                                           "CTT_ID" VARCHAR(100) NULL,
                                           "ORD" NUMBER(10) NULL,
                                           "LGN_USE_YN" VARCHAR(1) NULL,
                                           "MENU_ENG_NM" <데이터 타입 없음> NULL,
                                           "MENU_JPN_NM" <데이터 타입 없음> NULL,
                                           "MENU_CHS_NM" <데이터 타입 없음> NULL,
                                           "MENU__NM3" <데이터 타입 없음> NULL,
                                           "URL_MTHD_SE" VARCHAR(20) NULL,
                                           "URL_ADDR" VARCHAR(255) NULL,
                                           "PARAM1" VARCHAR(100) NULL,
                                           "PARAM2" VARCHAR(100) NULL,
                                           "PARAM3" VARCHAR(100) NULL,
                                           "PARAM4" VARCHAR(100) NULL,
                                           "PARAM5" VARCHAR(100) NULL,
                                           "PRV_USE_YN" VARCHAR(1) NULL,
                                           "PRGM_TYPE_SE" VARCHAR(20) NULL,
                                           "CRT_AT" DATE NOT NULL,
                                           "CRT_BY" VARCHAR(100) NOT NULL,
                                           "CRT_IP" VARCHAR(40) NOT NULL,
                                           "CRT_PGM" VARCHAR(100) NOT NULL,
                                           "UPD_AT" DATE NOT NULL,
                                           "UPD_BY" VARCHAR(100) NOT NULL,
                                           "UPD_IP" VARCHAR(40) NOT NULL,
                                           "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', '*', '[03.사이트]03.사이트 메뉴', systimestamp, CURRENT_USER);

-- [03.사이트]03.사이트 메뉴
ALTER TABLE "INS_APP"."CMS_SITE_MENU"
    ADD CONSTRAINT "PK_CMS_SITE_MENU" -- [03.사이트]03.사이트 메뉴 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "MENU_CD"  -- 메뉴 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_CD', 'CMS+1레벨2+2레벨3+3레벨3 으로 생성', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_LVL', '메뉴 레벨', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'UP_MENU_CD', '상위 메뉴 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PRGM_PATH', '소스코드 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_NM', '메뉴명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_SE', '팝업/일반/탭/게시판/컨텐츠', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'BRD_ID', '게시판 관리의 코드를 입력해서 연결? ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'CTT_ID', '컨텐츠 연결', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'LGN_USE_YN', '로그인 해야만 사용 가능', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_ENG_NM', '메뉴 영어 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_JPN_NM', '메뉴 일어 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU_CHS_NM', '메뉴 중문(간체) 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'MENU__NM3', '메뉴 중문(일어) 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'URL_MTHD_SE', '내부/ 새창', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'URL_ADDR', '외부  URL 사용하는 경우', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PARAM1', '파라미터1', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PARAM2', '파라미터2', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PARAM3', '파라미터3', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PARAM4', '파라미터4', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PARAM5', '파라미터5', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PRV_USE_YN', '로그 관리 용이?', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'PRGM_TYPE_SE', '조회/저장/출력 등 관리?', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_MENU', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]04.사이트 방문 이력
CREATE TABLE "INS_APP"."CMS_SITE_VISIT_HISTORY" (
                                                    "SITE_CD" VARCHAR(20) NOT NULL,
                                                    "MENU_CD" VARCHAR(20) NOT NULL,
                                                    "SN" NUMBER(15) NULL,
                                                    "IP" VARCHAR(40) NULL,
                                                    "VST_YMD" DATE NULL,
                                                    "OS" VARCHAR(100) NULL,
                                                    "BRWS" VARCHAR(100) NULL,
                                                    "USER_AGT" VARCHAR(300) NULL,
                                                    "TGT_BRWS" VARCHAR(10) NULL,
                                                    "PSTN" VARCHAR(100) NULL,
                                                    "BRD_ID" VARCHAR(100) NULL,
                                                    "CTT_ID" VARCHAR(100) NULL,
                                                    "SITE_URL" VARCHAR(1000) NULL,
                                                    "REF_URL" VARCHAR(1000) NULL,
                                                    "MENU_SE" VARCHAR(20) NULL,
                                                    "EQP_SE" VARCHAR(20) NULL,
                                                    "CRT_AT" DATE NOT NULL,
                                                    "CRT_BY" VARCHAR(100) NOT NULL,
                                                    "CRT_IP" VARCHAR(40) NOT NULL,
                                                    "CRT_PGM" VARCHAR(100) NOT NULL,
                                                    "UPD_AT" DATE NOT NULL,
                                                    "UPD_BY" VARCHAR(100) NOT NULL,
                                                    "UPD_IP" VARCHAR(40) NOT NULL,
                                                    "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', '*', '[03.사이트]04.사이트 방문 이력', systimestamp, CURRENT_USER);

-- [03.사이트]04.사이트 방문 이력
ALTER TABLE "INS_APP"."CMS_SITE_VISIT_HISTORY"
    ADD CONSTRAINT "PK_CMS_SITE_VISIT_HISTORY" -- [03.사이트]04.사이트 방문 이력 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "MENU_CD"  -- 메뉴 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'MENU_CD', '메뉴 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'IP', '아이피', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'VST_YMD', '방문 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'OS', 'Windows', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'BRWS', 'Chrome-90.0.4430.212', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'USER_AGT', '사용자 에이전트', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'TGT_BRWS', 'CHROME|SAFARI', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'PSTN', 'ko', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'BRD_ID', '게시판 관리의 코드를 입력해서 연결? ', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'CTT_ID', '컨텐츠 연결', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'SITE_URL', '사이트 URL', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'REF_URL', '이전 방문', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'MENU_SE', '메뉴 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'EQP_SE', 'pc/?', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_SITE_VISIT_HISTORY', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]05.배너 그룹
CREATE TABLE "INS_APP"."CMS_BANNER_GROUP" (
                                              "BNR_GRP_ID" VARCHAR(100) NOT NULL,
                                              "SITE_CD" VARCHAR(20) NOT NULL,
                                              "BNR_GRP_NM" <데이터 타입 없음> NULL,
                                              "BNR_GRP_DESC" <데이터 타입 없음> NULL,
                                              "USE_YN" <데이터 타입 없음> NULL,
                                              "SORT" <데이터 타입 없음> NULL,
                                              "CRT_AT" DATE NOT NULL,
                                              "CRT_BY" VARCHAR(100) NOT NULL,
                                              "CRT_IP" VARCHAR(40) NOT NULL,
                                              "CRT_PGM" VARCHAR(100) NOT NULL,
                                              "UPD_AT" DATE NOT NULL,
                                              "UPD_BY" VARCHAR(100) NOT NULL,
                                              "UPD_IP" VARCHAR(40) NOT NULL,
                                              "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', '*', '[03.사이트]05.배너 그룹', systimestamp, CURRENT_USER);

-- [03.사이트]05.배너 그룹
ALTER TABLE "INS_APP"."CMS_BANNER_GROUP"
    ADD CONSTRAINT "PK_CMS_BANNER_GROUP" -- [03.사이트]05.배너 그룹 기본키
        PRIMARY KEY (
                     "BNR_GRP_ID", -- 배너 그룹 아이디
                     "SITE_CD"     -- 사이트 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'BNR_GRP_ID', '배너 그룹 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'BNR_GRP_NM', '배너 그룹 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'BNR_GRP_DESC', '배너 그룹 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'USE_YN', '사용여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'SORT', '정렬', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER_GROUP', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]06.베너
CREATE TABLE "INS_APP"."CMS_BANNER" (
                                        "BNR_ID" VARCHAR(100) NOT NULL,
                                        "BNR_GRP_ID" VARCHAR(100) NOT NULL,
                                        "SITE_CD" VARCHAR(20) NOT NULL,
                                        "BNR_NM" VARCHAR(100) NULL,
                                        "BNR_DESC" VARCHAR(4000) NULL,
                                        "BNR_FILE_NM" VARCHAR(300) NULL,
                                        "BNR_FILE_PATH" VARCHAR(400) NULL,
                                        "SORT" NUMBER(10) NULL,
                                        "PUB_ST_DAY" VARCHAR(8) NULL,
                                        "PUB_ST_HR" VARCHAR(4) NULL,
                                        "PUB_END_DAY" VARCHAR(8) NULL,
                                        "PUB_END_HR" VARCHAR(4) NULL,
                                        "USE_YN" VARCHAR(1) NULL,
                                        "BNR_SE" VARCHAR(20) NULL,
                                        "BNR_SZ_SE" VARCHAR(20) NULL,
                                        "BNR_URL" VARCHAR(1000) NULL,
                                        "DEL_YN" VARCHAR(1) NULL,
                                        "RMK" BLOB NULL,
                                        "CRT_AT" DATE NOT NULL,
                                        "CRT_BY" VARCHAR(100) NOT NULL,
                                        "CRT_IP" VARCHAR(40) NOT NULL,
                                        "CRT_PGM" VARCHAR(100) NOT NULL,
                                        "UPD_AT" DATE NOT NULL,
                                        "UPD_BY" VARCHAR(100) NOT NULL,
                                        "UPD_IP" VARCHAR(40) NOT NULL,
                                        "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', '*', '[03.사이트]06.베너', systimestamp, CURRENT_USER);

-- [03.사이트]06.베너
ALTER TABLE "INS_APP"."CMS_BANNER"
    ADD CONSTRAINT "PK_CMS_BANNER" -- [03.사이트]06.베너 기본키
        PRIMARY KEY (
                     "BNR_ID",     -- 배너 아이디
                     "BNR_GRP_ID", -- 배너 그룹 아이디
                     "SITE_CD"     -- 사이트 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_ID', '배너 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_GRP_ID', '배너 그룹 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_NM', '배너 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_DESC', '배너 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_FILE_NM', '배너 파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_FILE_PATH', '배너 파일 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'SORT', '정렬', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'PUB_ST_DAY', '게시 시작 일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'PUB_ST_HR', '게시 시작 시간', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'PUB_END_DAY', '게시 종료 일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'PUB_END_HR', '게시 종료 시간', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_SE', '_self', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_SZ_SE', '배너 크기 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'BNR_URL', '배너 URL', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'DEL_YN', '삭제 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BANNER', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]07.컨텐츠 - puck editor 사용
CREATE TABLE "INS_APP"."CMS_CONTENT" (
                                         "SITE_CD" VARCHAR(20) NOT NULL,
                                         "CTT_ID" VARCHAR(100) NOT NULL,
                                         "CTT_NM" VARCHAR(300) NULL,
                                         "CTT_DESC" VARCHAR(32000) NULL,
                                         "FILE_NM" VARCHAR(300) NULL,
                                         "FILE_PATH" VARCHAR(400) NULL,
                                         "USE_YN" VARCHAR(1) NULL,
                                         "PUB_YN" VARCHAR(1) NULL,
                                         "RMK" VARCHAR(4000) NULL,
                                         "CRT_AT" DATE NOT NULL,
                                         "CRT_BY" VARCHAR(100) NOT NULL,
                                         "CRT_IP" VARCHAR(40) NOT NULL,
                                         "CRT_PGM" VARCHAR(100) NOT NULL,
                                         "UPD_AT" DATE NOT NULL,
                                         "UPD_BY" VARCHAR(100) NOT NULL,
                                         "UPD_IP" VARCHAR(40) NOT NULL,
                                         "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', '*', '[03.사이트]07.컨텐츠 - puck editor 사용', systimestamp, CURRENT_USER);

-- [03.사이트]07.컨텐츠 - puck editor 사용
ALTER TABLE "INS_APP"."CMS_CONTENT"
    ADD CONSTRAINT "PK_CMS_CONTENT" -- [03.사이트]07.컨텐츠 - puck editor 사용 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "CTT_ID"   -- 컨텐츠 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CTT_ID', '컨텐츠 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CTT_NM', '컨텐츠 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CTT_DESC', '컨텐츠 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'FILE_NM', '파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'FILE_PATH', '파일 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'PUB_YN', '중간저장 등의 이슈가 있을 수 있음.', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]08.컨텐츠 SEO
CREATE TABLE "INS_APP"."CMS_CONTENT_SEO" (
                                             "SN" NUMBER(15) NOT NULL,
                                             "SITE_CD" VARCHAR(20) NOT NULL,
                                             "CTT_ID" VARCHAR(100) NOT NULL,
                                             "_TTL" VARCHAR(300) NULL,
                                             "_DESC" VARCHAR(4000) NULL,
                                             "COL2" VARCHAR(4000) NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', '*', '[03.사이트]08.컨텐츠 SEO', systimestamp, CURRENT_USER);

-- [03.사이트]08.컨텐츠 SEO
ALTER TABLE "INS_APP"."CMS_CONTENT_SEO"
    ADD CONSTRAINT "PK_CMS_CONTENT_SEO" -- [03.사이트]08.컨텐츠 SEO 기본키
        PRIMARY KEY (
                     "SN",      -- 일련번호
                     "SITE_CD", -- 사이트 코드
                     "CTT_ID"   -- 컨텐츠 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', 'SN', '일련번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', 'CTT_ID', '컨텐츠 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', '_TTL', 'meta 제목', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', '_DESC', 'meta 설명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_CONTENT_SEO', 'COL2', '키워드', systimestamp, CURRENT_USER);

-- [03.사이트]09.팝업
CREATE TABLE "INS_APP"."CMS_POPUP" (
                                       "SITE_CD" VARCHAR(20) NOT NULL,
                                       "POP_GRP_ID" VARCHAR(100) NOT NULL,
                                       "POP_ID" VARCHAR(100) NOT NULL,
                                       "POP_NM" VARCHAR(100) NULL,
                                       "TTL" VARCHAR(300) NULL,
                                       "DESC" VARCHAR(4000) NULL,
                                       "FILE_NM" VARCHAR(300) NULL,
                                       "FILE_PATH" VARCHAR(400) NULL,
                                       "PUB_ST_DAY" DATE NULL,
                                       "PUB_END_DAY" DATE NULL,
                                       "PUB_ST_HR" VARCHAR(4) NULL,
                                       "PUB_END_HR" VARCHAR(4) NULL,
                                       "PUB_SE" VARCHAR(20) NULL,
                                       "PUB_YN" VARCHAR(1) NULL,
                                       "RMK" VARCHAR(4000) NULL,
                                       "ADD_URL" VARCHAR(255) NULL,
                                       "URL_TGT_SE" VARCHAR(20) NULL,
                                       "POP_W" NUMBER(10,4) NULL,
                                       "W_PSTN" <데이터 타입 없음> NULL,
                                       "POP_H" NUMBER(10,4) NULL,
                                       "H_PSTN" <데이터 타입 없음> NULL,
                                       "CRT_AT" DATE NOT NULL,
                                       "CRT_BY" VARCHAR(100) NOT NULL,
                                       "CRT_IP" VARCHAR(40) NOT NULL,
                                       "CRT_PGM" VARCHAR(100) NOT NULL,
                                       "UPD_AT" DATE NOT NULL,
                                       "UPD_BY" VARCHAR(100) NOT NULL,
                                       "UPD_IP" VARCHAR(40) NOT NULL,
                                       "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', '*', '[03.사이트]09.팝업', systimestamp, CURRENT_USER);

-- [03.사이트]09.팝업
ALTER TABLE "INS_APP"."CMS_POPUP"
    ADD CONSTRAINT "PK_CMS_POPUP" -- [03.사이트]09.팝업 기본키
        PRIMARY KEY (
                     "SITE_CD",    -- 사이트 코드
                     "POP_GRP_ID", -- 팝업 그룹 아이디
                     "POP_ID"      -- 팝업 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'POP_GRP_ID', '팝업 그룹 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'POP_ID', '팝업 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'POP_NM', '팝업 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'TTL', '제목', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'DESC', '내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'FILE_NM', '파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'FILE_PATH', '파일 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_ST_DAY', '게시 시작 일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_END_DAY', '게시 종료 일', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_ST_HR', '게시 시작 시간', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_END_HR', '게시 종료 시간', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_SE', '오늘 하루동안 그만보기', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'PUB_YN', '게시 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'ADD_URL', '추가 URL', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'URL_TGT_SE', '_self, _blank', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'POP_W', '팝업 가로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'W_PSTN', '가로 위치', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'POP_H', '팝업 세로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'H_PSTN', '세로 위치', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]10.팝업 그룹
CREATE TABLE "INS_APP"."CMS_POPUP_GROUP" (
                                             "SITE_CD" VARCHAR(20) NOT NULL,
                                             "POP_GRP_ID" VARCHAR(100) NOT NULL,
                                             "POP_GRP_NM" VARCHAR(100) NULL,
                                             "USE_YN" VARCHAR(1) NULL,
                                             "SORT" NUMBER(10) NULL,
                                             "CRT_AT" DATE NOT NULL,
                                             "CRT_BY" VARCHAR(100) NOT NULL,
                                             "CRT_IP" VARCHAR(40) NOT NULL,
                                             "CRT_PGM" VARCHAR(100) NOT NULL,
                                             "UPD_AT" DATE NOT NULL,
                                             "UPD_BY" VARCHAR(100) NOT NULL,
                                             "UPD_IP" VARCHAR(40) NOT NULL,
                                             "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', '*', '[03.사이트]10.팝업 그룹', systimestamp, CURRENT_USER);

-- [03.사이트]10.팝업 그룹
ALTER TABLE "INS_APP"."CMS_POPUP_GROUP"
    ADD CONSTRAINT "PK_CMS_POPUP_GROUP" -- [03.사이트]10.팝업 그룹 기본키
        PRIMARY KEY (
                     "SITE_CD",    -- 사이트 코드
                     "POP_GRP_ID"  -- 팝업 그룹 아이디
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'POP_GRP_ID', '팝업 그룹 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'POP_GRP_NM', '팝업 그룹 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'SORT', '정렬', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POPUP_GROUP', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [03.사이트]11.파일관리
CREATE TABLE "INS_APP"."CMS_FILE" (
                                      "FILE_SN" NUMBER(20) NOT NULL,
                                      "SITE_CD" VARCHAR(20) NOT NULL,
                                      "FILE_PATH" VARCHAR(400) NULL,
                                      "FILE_NM" VARCHAR(300) NULL,
                                      "CRT_AT" DATE NOT NULL,
                                      "CRT_BY" VARCHAR(100) NOT NULL,
                                      "CRT_IP" VARCHAR(40) NOT NULL,
                                      "CRT_PGM" VARCHAR(100) NOT NULL,
                                      "UPD_AT" DATE NOT NULL,
                                      "UPD_BY" VARCHAR(100) NOT NULL,
                                      "UPD_IP" VARCHAR(40) NOT NULL,
                                      "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', '*', '[03.사이트]11.파일관리', systimestamp, CURRENT_USER);

-- [03.사이트]11.파일관리
ALTER TABLE "INS_APP"."CMS_FILE"
    ADD CONSTRAINT "PK_CMS_FILE" -- [03.사이트]11.파일관리 기본키
        PRIMARY KEY (
                     "FILE_SN", -- 파일 순번
                     "SITE_CD"  -- 사이트 코드
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'FILE_SN', '파일 순번', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'FILE_PATH', '파일 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'FILE_NM', '파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_FILE', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [04.게시판]01.게시판
CREATE TABLE "INS_APP"."CMS_BOARD" (
                                       "SITE_CD" VARCHAR(20) NOT NULL,
                                       "BRD_ID" VARCHAR(100) NOT NULL,
                                       "BRD_SE" VARCHAR(20) NOT NULL,
                                       "BRD_NM" VARCHAR(200) NULL,
                                       "BRD_DESC" VARCHAR(4000) NULL,
                                       "ORD" NUMBER(10) NULL,
                                       "USE_YN" VARCHAR(1) NULL,
                                       "WRT_AUTH_CD" VARCHAR(20) NULL,
                                       "QRY_AUTH_CD" VARCHAR(20) NULL,
                                       "CMT_AUTH_CD" VARCHAR(20) NULL,
                                       "LGN_USER_USE_YN" VARCHAR(1) NULL,
                                       "WRTR_PSN_QRY_YN" VARCHAR(1) NULL,
                                       "PWD_USE_YN" VARCHAR(1) NULL,
                                       "FILE_USE_YN" VARCHAR(1) NULL,
                                       "CMT_USE_YN" VARCHAR(1) NULL,
                                       "CRT_AT" DATE NOT NULL,
                                       "CRT_BY" VARCHAR(100) NOT NULL,
                                       "CRT_IP" VARCHAR(40) NOT NULL,
                                       "CRT_PGM" VARCHAR(100) NOT NULL,
                                       "UPD_AT" DATE NOT NULL,
                                       "UPD_BY" VARCHAR(100) NOT NULL,
                                       "UPD_IP" VARCHAR(40) NOT NULL,
                                       "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', '*', '[04.게시판]01.게시판', systimestamp, CURRENT_USER);

-- [04.게시판]01.게시판
ALTER TABLE "INS_APP"."CMS_BOARD"
    ADD CONSTRAINT "PK_CMS_BOARD" -- [04.게시판]01.게시판 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "BRD_ID",  -- 게시판 아이디
                     "BRD_SE"   -- 게시판 구분
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'BRD_ID', '게시판 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'BRD_SE', '공통 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'BRD_NM', '게시판 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'BRD_DESC', '게시판 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'USE_YN', '사용여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'WRT_AUTH_CD', 'AUTH_CD', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'QRY_AUTH_CD', 'AUTH_CD', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CMT_AUTH_CD', 'AUTH_CD', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'LGN_USER_USE_YN', '로그인 한 사람만 사용 가능', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'WRTR_PSN_QRY_YN', '비밀글', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'PWD_USE_YN', '비밀글의 경우', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'FILE_USE_YN', '파일 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CMT_USE_YN', '댓글 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_BOARD', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [04.게시판]02.게시글
CREATE TABLE "INS_APP"."CMS_POST" (
                                      "SITE_CD" VARCHAR(20) NOT NULL,
                                      "BRD_ID" VARCHAR(100) NOT NULL,
                                      "BRD_SE" VARCHAR(20) NOT NULL,
                                      "PST_SN" NUMBER(15) NOT NULL,
                                      "PST_ID" VARCHAR(100) NULL,
                                      "CTG_SE" VARCHAR(20) NULL,
                                      "PST_SE" VARCHAR(20) NULL,
                                      "PST_STS_SE" VARCHAR(20) NULL,
                                      "PST_TTL" VARCHAR(1000) NULL,
                                      "PST_DESC" VARCHAR(4000) NULL,
                                      "USE_YN" VARCHAR(1) NULL,
                                      "DEL_YN" VARCHAR(1) NULL,
                                      "PST_DEL_SE" VARCHAR(20) NULL,
                                      "QRY_CNT" NUMBER(10) NULL,
                                      "RMK" VARCHAR(4000) NULL,
                                      "ORD" NUMBER(10) NULL,
                                      "NTC_YN" VARCHAR(1) NULL,
                                      "PUB_ST_YMD" VARCHAR(8) NULL,
                                      "PUB_END_YMD" VARCHAR(8) NULL,
                                      "PWD_USE_YN" VARCHAR(1) NULL,
                                      "FILE_PATH" VARCHAR(400) NULL,
                                      "FILE_NM" VARCHAR(300) NULL,
                                      "PWD" VARCHAR(500) NULL,
                                      "CRT_AT" DATE NOT NULL,
                                      "CRT_BY" VARCHAR(100) NOT NULL,
                                      "CRT_IP" VARCHAR(40) NOT NULL,
                                      "CRT_PGM" VARCHAR(100) NOT NULL,
                                      "UPD_AT" DATE NOT NULL,
                                      "UPD_BY" VARCHAR(100) NOT NULL,
                                      "UPD_IP" VARCHAR(40) NOT NULL,
                                      "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', '*', '[04.게시판]02.게시글', systimestamp, CURRENT_USER);

-- [04.게시판]02.게시글
ALTER TABLE "INS_APP"."CMS_POST"
    ADD CONSTRAINT "PK_CMS_POST" -- [04.게시판]02.게시글 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "BRD_ID",  -- 게시판 아이디
                     "BRD_SE",  -- 게시판 구분
                     "PST_SN"   -- 게시글 순번
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'BRD_ID', '게시판 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'BRD_SE', '게시판 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_SN', '게시글 순번', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_ID', '게시글 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'CTG_SE', '공통 코드로 관리', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_SE', '문의/답글(Q&A)/일반글', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_STS_SE', '관리자에 의해 삭제된 게시글입니다.', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_TTL', '게시글 제목', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_DESC', '게시글 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'DEL_YN', '삭제 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PST_DEL_SE', '관리자삭제, 작성자삭제', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'QRY_CNT', '조회 수', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'RMK', '비고', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'NTC_YN', '최상단에 고정', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PUB_ST_YMD', '게시 시작 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PUB_END_YMD', '게시 종료 일자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PWD_USE_YN', '비밀글', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'FILE_PATH', '파일 경로', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'FILE_NM', '파일 명', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'PWD', '비밀글의 경우', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [04.게시판]03.게시물 댓글
CREATE TABLE "INS_APP"."CMS_POST_COMMENT" (
                                              "SITE_CD" VARCHAR(20) NOT NULL,
                                              "BRD_ID" VARCHAR(100) NOT NULL,
                                              "BRD_SE" VARCHAR(20) NOT NULL,
                                              "PST_SN" NUMBER(15) NOT NULL,
                                              "CMT_SN" NUMBER(15) NOT NULL,
                                              "CMT_TTL" VARCHAR(300) NULL,
                                              "LIKE_CNT" NUMBER(10) NULL,
                                              "CMT_DESC" VARCHAR(4000) NULL,
                                              "PWD_USE_YN" VARCHAR(1) NULL,
                                              "CMT_PWD" VARCHAR(500) NULL,
                                              "USE_YN" VARCHAR(1) NULL,
                                              "DEL_YN" VARCHAR(1) NULL,
                                              "CMT_DEL_SE" VARCHAR(20) NULL,
                                              "ORD" NUMBER(10) NULL,
                                              "CRT_AT" DATE NOT NULL,
                                              "CRT_BY" VARCHAR(100) NOT NULL,
                                              "CRT_IP" VARCHAR(40) NOT NULL,
                                              "CRT_PGM" VARCHAR(100) NOT NULL,
                                              "UPD_AT" DATE NOT NULL,
                                              "UPD_BY" VARCHAR(100) NOT NULL,
                                              "UPD_IP" VARCHAR(40) NOT NULL,
                                              "UPD_PGM" VARCHAR(100) NOT NULL
);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', '*', '[04.게시판]03.게시물 댓글', systimestamp, CURRENT_USER);

-- [04.게시판]03.게시물 댓글
ALTER TABLE "INS_APP"."CMS_POST_COMMENT"
    ADD CONSTRAINT "PK_CMS_POST_COMMENT" -- [04.게시판]03.게시물 댓글 기본키
        PRIMARY KEY (
                     "SITE_CD", -- 사이트 코드
                     "BRD_ID",  -- 게시판 아이디
                     "BRD_SE",  -- 게시판 구분
                     "PST_SN",  -- 게시글 순번
                     "CMT_SN"   -- 댓글 순번
            );

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'SITE_CD', '사이트 코드', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'BRD_ID', '게시판 아이디', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'BRD_SE', '게시판 구분', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'PST_SN', '게시글 순번', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CMT_SN', '댓글 순번', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CMT_TTL', '댓글 제목', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'LIKE_CNT', '좋아요 수', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CMT_DESC', '댓글 내용', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'PWD_USE_YN', '비밀번호 사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CMT_PWD', '댓글 비밀번호', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'USE_YN', '사용 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'DEL_YN', '삭제 여부', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CMT_DEL_SE', '관리자/본인삭제', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'ORD', '순서', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CRT_AT', '등록일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CRT_BY', '등록자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CRT_IP', '등록자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'CRT_PGM', '등록프로그램', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'UPD_AT', '수정일시', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'UPD_BY', '수정자', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'UPD_IP', '수정자IP', systimestamp, CURRENT_USER);

INSERT INTO _cub_schema_comments (table_name, column_name, description, last_updated, last_updated_user) VALUES ('INS_APP.CMS_POST_COMMENT', 'UPD_PGM', '수정프로그램', systimestamp, CURRENT_USER);

-- [00.시스템]02.업무 사용자
ALTER TABLE "INS_APP"."CMS_TASK_USER"
    ADD CONSTRAINT "FK_CMS_COMMON_DEPT_TO_CMS_TASK_USER" -- [01.공통]04.부서 -> [00.시스템]02.업무 사용자
        FOREIGN KEY (
                     "DEPT_CD", -- 부서 코드
                     "ORG_CD"   -- 조직 코드
            )
            REFERENCES "INS_APP"."CMS_COMMON_DEPT" ( -- [01.공통]04.부서
                                                    "DEPT_CD", -- 부서 코드
                                                    "ORG_CD"   -- 조직 코드
                );

-- [00.시스템]03.관리자 사용자
ALTER TABLE "INS_APP"."CMS_ADMIN_USER"
    ADD CONSTRAINT "FK_CMS_COMMON_DEPT_TO_CMS_ADMIN_USER" -- [01.공통]04.부서 -> [00.시스템]03.관리자 사용자
        FOREIGN KEY (
                     "DEPT_CD", -- 부서 코드
                     "ORG_CD"   -- 조직 코드
            )
            REFERENCES "INS_APP"."CMS_COMMON_DEPT" ( -- [01.공통]04.부서
                                                    "DEPT_CD", -- 부서 코드
                                                    "ORG_CD"   -- 조직 코드
                );

-- [01.공통]04.부서
ALTER TABLE "INS_APP"."CMS_COMMON_DEPT"
    ADD CONSTRAINT "FK_CMS_COMMON_ORG_TO_CMS_COMMON_DEPT" -- [01.공통]03.조직 -> [01.공통]04.부서
        FOREIGN KEY (
                     "ORG_CD" -- 조직 코드
            )
            REFERENCES "INS_APP"."CMS_COMMON_ORG" ( -- [01.공통]03.조직
                                                   "ORG_CD" -- 조직 코드
                );

-- [01.공통]06.권한별 메뉴
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH_MENU"
    ADD CONSTRAINT "FK_CMS_COMMON_AUTH_TO_CMS_COMMON_AUTH_MENU" -- [01.공통]05.권한 -> [01.공통]06.권한별 메뉴
        FOREIGN KEY (
                     "AUTH_CD" -- 권한 코드
            )
            REFERENCES "INS_APP"."CMS_COMMON_AUTH" ( -- [01.공통]05.권한
                                                    "AUTH_CD" -- 권한 코드
                );

-- [01.공통]06.권한별 메뉴
ALTER TABLE "INS_APP"."CMS_COMMON_AUTH_MENU"
    ADD CONSTRAINT "FK_CMS_COMMON_MENU_TO_CMS_COMMON_AUTH_MENU" -- [01.공통]02.메뉴 -> [01.공통]06.권한별 메뉴
        FOREIGN KEY (
                     "MENU_CD" -- 메뉴 코드
            )
            REFERENCES "INS_APP"."CMS_COMMON_MENU" ( -- [01.공통]02.메뉴
                                                    "MENU_CD" -- 메뉴 코드
                );

-- [03.사이트]02.사이트 아이피
ALTER TABLE "INS_APP"."CMS_SITE_IP"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_SITE_IP" -- [03.사이트]01.사이트 -> [03.사이트]02.사이트 아이피
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [03.사이트]03.사이트 메뉴
ALTER TABLE "INS_APP"."CMS_SITE_MENU"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_SITE_MENU" -- [03.사이트]01.사이트 -> [03.사이트]03.사이트 메뉴
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [03.사이트]04.사이트 방문 이력
ALTER TABLE "INS_APP"."CMS_SITE_VISIT_HISTORY"
    ADD CONSTRAINT "FK_CMS_SITE_MENU_TO_CMS_SITE_VISIT_HISTORY" -- [03.사이트]03.사이트 메뉴 -> [03.사이트]04.사이트 방문 이력
        FOREIGN KEY (
                     "SITE_CD", -- 사이트 코드
                     "MENU_CD"  -- 메뉴 코드
            )
            REFERENCES "INS_APP"."CMS_SITE_MENU" ( -- [03.사이트]03.사이트 메뉴
                                                  "SITE_CD", -- 사이트 코드
                                                  "MENU_CD"  -- 메뉴 코드
                );

-- [03.사이트]05.배너 그룹
ALTER TABLE "INS_APP"."CMS_BANNER_GROUP"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_BANNER_GROUP" -- [03.사이트]01.사이트 -> [03.사이트]05.배너 그룹
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [03.사이트]06.베너
ALTER TABLE "INS_APP"."CMS_BANNER"
    ADD CONSTRAINT "FK_CMS_BANNER_GROUP_TO_CMS_BANNER" -- [03.사이트]05.배너 그룹 -> [03.사이트]06.베너
        FOREIGN KEY (
                     "BNR_GRP_ID", -- 배너 그룹 아이디
                     "SITE_CD"     -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_BANNER_GROUP" ( -- [03.사이트]05.배너 그룹
                                                     "BNR_GRP_ID", -- 배너 그룹 아이디
                                                     "SITE_CD"     -- 사이트 코드
                );

-- [03.사이트]07.컨텐츠 - puck editor 사용
ALTER TABLE "INS_APP"."CMS_CONTENT"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_CONTENT" -- [03.사이트]01.사이트 -> [03.사이트]07.컨텐츠 - puck editor 사용
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [03.사이트]08.컨텐츠 SEO
ALTER TABLE "INS_APP"."CMS_CONTENT_SEO"
    ADD CONSTRAINT "FK_CMS_CONTENT_TO_CMS_CONTENT_SEO" -- [03.사이트]07.컨텐츠 - puck editor 사용 -> [03.사이트]08.컨텐츠 SEO
        FOREIGN KEY (
                     "SITE_CD", -- 사이트 코드
                     "CTT_ID"   -- 컨텐츠 아이디
            )
            REFERENCES "INS_APP"."CMS_CONTENT" ( -- [03.사이트]07.컨텐츠 - puck editor 사용
                                                "SITE_CD", -- 사이트 코드
                                                "CTT_ID"   -- 컨텐츠 아이디
                );

-- [03.사이트]09.팝업
ALTER TABLE "INS_APP"."CMS_POPUP"
    ADD CONSTRAINT "FK_CMS_POPUP_GROUP_TO_CMS_POPUP" -- [03.사이트]10.팝업 그룹 -> [03.사이트]09.팝업
        FOREIGN KEY (
                     "SITE_CD",    -- 사이트 코드
                     "POP_GRP_ID"  -- 팝업 그룹 아이디
            )
            REFERENCES "INS_APP"."CMS_POPUP_GROUP" ( -- [03.사이트]10.팝업 그룹
                                                    "SITE_CD",    -- 사이트 코드
                                                    "POP_GRP_ID"  -- 팝업 그룹 아이디
                );

-- [03.사이트]10.팝업 그룹
ALTER TABLE "INS_APP"."CMS_POPUP_GROUP"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_POPUP_GROUP" -- [03.사이트]01.사이트 -> [03.사이트]10.팝업 그룹
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [03.사이트]11.파일관리
ALTER TABLE "INS_APP"."CMS_FILE"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_FILE" -- [03.사이트]01.사이트 -> [03.사이트]11.파일관리
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [04.게시판]01.게시판
ALTER TABLE "INS_APP"."CMS_BOARD"
    ADD CONSTRAINT "FK_CMS_SITE_TO_CMS_BOARD" -- [03.사이트]01.사이트 -> [04.게시판]01.게시판
        FOREIGN KEY (
                     "SITE_CD" -- 사이트 코드
            )
            REFERENCES "INS_APP"."CMS_SITE" ( -- [03.사이트]01.사이트
                                             "SITE_CD" -- 사이트 코드
                );

-- [04.게시판]02.게시글
ALTER TABLE "INS_APP"."CMS_POST"
    ADD CONSTRAINT "FK_CMS_BOARD_TO_CMS_POST" -- [04.게시판]01.게시판 -> [04.게시판]02.게시글
        FOREIGN KEY (
                     "SITE_CD", -- 사이트 코드
                     "BRD_ID",  -- 게시판 아이디
                     "BRD_SE"   -- 게시판 구분
            )
            REFERENCES "INS_APP"."CMS_BOARD" ( -- [04.게시판]01.게시판
                                              "SITE_CD", -- 사이트 코드
                                              "BRD_ID",  -- 게시판 아이디
                                              "BRD_SE"   -- 게시판 구분
                );

-- [04.게시판]03.게시물 댓글
ALTER TABLE "INS_APP"."CMS_POST_COMMENT"
    ADD CONSTRAINT "FK_CMS_POST_TO_CMS_POST_COMMENT" -- [04.게시판]02.게시글 -> [04.게시판]03.게시물 댓글
        FOREIGN KEY (
                     "SITE_CD", -- 사이트 코드
                     "BRD_ID",  -- 게시판 아이디
                     "BRD_SE",  -- 게시판 구분
                     "PST_SN"   -- 게시글 순번
            )
            REFERENCES "INS_APP"."CMS_POST" ( -- [04.게시판]02.게시글
                                             "SITE_CD", -- 사이트 코드
                                             "BRD_ID",  -- 게시판 아이디
                                             "BRD_SE",  -- 게시판 구분
                                             "PST_SN"   -- 게시글 순번
                );