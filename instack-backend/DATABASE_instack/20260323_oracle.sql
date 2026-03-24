CREATE TABLE INS_APP.CMS_USER (
                                  USER_ID VARCHAR2(100) NOT NULL,
                                  USER_NM VARCHAR2(100),
                                  MTELNO VARCHAR2(20),
                                  TELNO VARCHAR2(20),
                                  GNDR_SE VARCHAR2(20),
                                  EML VARCHAR2(100),
                                  ADDR VARCHAR(255),
                                  DADDR VARCHAR(255),
                                  ZIP VARCHAR2(10),
                                  ACC_EXP_YMD VARCHAR2(8),
                                  EML_CERT_YN VARCHAR2(1),
                                  TELNO_CERT_YN VARCHAR2(1),
                                  LST_LGN_DT DATE,
                                  LST_LGN_IP VARCHAR2(40),
                                  WD_DT DATE,
                                  USER_STS_SE VARCHAR2(20),
                                  CI VARCHAR(100),
                                  DI VARCHAR(100),
                                  CRT_AT DATE NOT NULL,
                                  CRT_BY VARCHAR2(100) NOT NULL,
                                  CRT_IP VARCHAR2(40) NOT NULL,
                                  CRT_PGM VARCHAR2(100) NOT NULL,
                                  UPD_AT DATE NOT NULL,
                                  UPD_BY VARCHAR2(100) NOT NULL,
                                  UPD_IP VARCHAR2(40) NOT NULL,
                                  UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER IS '[00.시스템]01.사용자(일반)';

COMMENT ON COLUMN INS_APP.CMS_USER.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_USER.USER_NM IS '사용자 명';

COMMENT ON COLUMN INS_APP.CMS_USER.MTELNO IS '휴대전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER.TELNO IS '전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER.GNDR_SE IS '성별 구분';

COMMENT ON COLUMN INS_APP.CMS_USER.EML IS '이메일';

COMMENT ON COLUMN INS_APP.CMS_USER.ADDR IS '주소';

COMMENT ON COLUMN INS_APP.CMS_USER.DADDR IS '상세주소';

COMMENT ON COLUMN INS_APP.CMS_USER.ZIP IS '우편번호';

COMMENT ON COLUMN INS_APP.CMS_USER.ACC_EXP_YMD IS '접근 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_USER.EML_CERT_YN IS '이메일 인증 여부';

COMMENT ON COLUMN INS_APP.CMS_USER.TELNO_CERT_YN IS '전화번호 인증 여부';

COMMENT ON COLUMN INS_APP.CMS_USER.LST_LGN_DT IS '최종 로그인 일시';

COMMENT ON COLUMN INS_APP.CMS_USER.LST_LGN_IP IS '최종 로그인 IP';

COMMENT ON COLUMN INS_APP.CMS_USER.WD_DT IS '탈퇴 일시';

COMMENT ON COLUMN INS_APP.CMS_USER.USER_STS_SE IS '공통 코드로 관리';

COMMENT ON COLUMN INS_APP.CMS_USER.CI IS 'CI';

COMMENT ON COLUMN INS_APP.CMS_USER.DI IS 'DI';

COMMENT ON COLUMN INS_APP.CMS_USER.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_USER
    ON INS_APP.CMS_USER (
                         USER_ID ASC
        );

ALTER TABLE INS_APP.CMS_USER
    ADD
        CONSTRAINT PK_CMS_USER
            PRIMARY KEY (
                         USER_ID
                );

CREATE TABLE INS_APP.CMS_USER_TASK (
                                       USER_ID VARCHAR2(100) NOT NULL,
                                       USER_NM VARCHAR2(100),
                                       GNDR_SE VARCHAR2(20),
                                       MTELNO VARCHAR2(20),
                                       EML VARCHAR2(100),
                                       TELNO VARCHAR2(20),
                                       ADDR VARCHAR(255),
                                       DADDR VARCHAR(255),
                                       AUTH_EXP_YMD VARCHAR2(8),
                                       AUTH_GRNT_YMD VARCHAR2(8),
                                       AUTH_RVK_SE VARCHAR2(20),
                                       USER_STS_SE VARCHAR2(20),
                                       CI VARCHAR(100),
                                       DI VARCHAR(100),
                                       CRT_AT DATE NOT NULL,
                                       CRT_BY VARCHAR2(100) NOT NULL,
                                       CRT_IP VARCHAR2(40) NOT NULL,
                                       CRT_PGM VARCHAR2(100) NOT NULL,
                                       UPD_AT DATE NOT NULL,
                                       UPD_BY VARCHAR2(100) NOT NULL,
                                       UPD_IP VARCHAR2(40) NOT NULL,
                                       UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER_TASK IS '[00.시스템]02.사용자(업무)';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.USER_NM IS '사용자 명';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.GNDR_SE IS '성별 구분';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.MTELNO IS '휴대전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.EML IS '이메일';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.TELNO IS '전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.ADDR IS '주소';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.DADDR IS '상세주소';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.AUTH_EXP_YMD IS '권한 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.AUTH_GRNT_YMD IS '권한 부여 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.AUTH_RVK_SE IS '권한 부여일 초과, 만료일 초과';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.USER_STS_SE IS '활성화,  비활성화';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.CI IS 'CI';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.DI IS 'DI';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_TASK.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_USER_TASK
    ON INS_APP.CMS_USER_TASK (
                              USER_ID ASC
        );

ALTER TABLE INS_APP.CMS_USER_TASK
    ADD
        CONSTRAINT PK_CMS_USER_TASK
            PRIMARY KEY (
                         USER_ID
                );

CREATE TABLE INS_APP.CMS_USER_ADMIN (
                                        USER_ID VARCHAR2(100) NOT NULL,
                                        USER_NM VARCHAR2(100),
                                        EML VARCHAR2(100),
                                        MTELNO VARCHAR2(20),
                                        GNDR_SE VARCHAR2(20),
                                        TELNO VARCHAR2(20),
                                        ADDR VARCHAR(255),
                                        DADDR VARCHAR(255),
                                        AUTH_EXP_YMD VARCHAR2(8),
                                        AUTH_GRNT_YMD VARCHAR2(8),
                                        AUTH_RVK_SE VARCHAR2(20),
                                        ADM_STS_SE VARCHAR2(20),
                                        CI VARCHAR(100),
                                        DI VARCHAR(100),
                                        CRT_AT DATE NOT NULL,
                                        CRT_BY VARCHAR2(100) NOT NULL,
                                        CRT_IP VARCHAR2(40) NOT NULL,
                                        CRT_PGM VARCHAR2(100) NOT NULL,
                                        UPD_AT DATE NOT NULL,
                                        UPD_BY VARCHAR2(100) NOT NULL,
                                        UPD_IP VARCHAR2(40) NOT NULL,
                                        UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER_ADMIN IS '[00.시스템]03.사용자(관리자)';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.USER_NM IS '사용자 명';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.EML IS '이메일';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.MTELNO IS '휴대전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.GNDR_SE IS '성별 구분';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.TELNO IS '전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.ADDR IS '주소';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.DADDR IS '상세주소';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.AUTH_EXP_YMD IS '권한 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.AUTH_GRNT_YMD IS '권한 부여 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.AUTH_RVK_SE IS '권한 부여일 초과, 만료일 초과';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.ADM_STS_SE IS '공통코드| 활성화vs비활성화';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.CI IS 'CI';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.DI IS 'DI';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_ADMIN.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_USER_ADMIN
    ON INS_APP.CMS_USER_ADMIN (
                               USER_ID ASC
        );

ALTER TABLE INS_APP.CMS_USER_ADMIN
    ADD
        CONSTRAINT PK_CMS_USER_ADMIN
            PRIMARY KEY (
                         USER_ID
                );

CREATE TABLE INS_APP.CMS_PWD (
                                 USER_ID VARCHAR2(100) NOT NULL,
                                 USER_SE VARCHAR2(20) NOT NULL,
                                 PWD VARCHAR2(500) NOT NULL,
                                 USE_YN VARCHAR2(1) NOT NULL,
                                 PWD_FAIL_CNT NUMBER(5),
                                 PWD_CHG_YMD VARCHAR2(8),
                                 PWD_CHG_SE VARCHAR2(20),
                                 PWD_EXP_YMD VARCHAR2(8),
                                 CRT_AT DATE NOT NULL,
                                 CRT_BY VARCHAR2(100) NOT NULL,
                                 CRT_IP VARCHAR2(40) NOT NULL,
                                 CRT_PGM VARCHAR2(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR2(100) NOT NULL,
                                 UPD_IP VARCHAR2(40) NOT NULL,
                                 UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PWD IS '[00.시스템]04.비밀번호';

COMMENT ON COLUMN INS_APP.CMS_PWD.USER_ID IS '업무사용자, 사용자, 관리자';

COMMENT ON COLUMN INS_APP.CMS_PWD.USER_SE IS '관리자, 사용자, 업무사용자';

COMMENT ON COLUMN INS_APP.CMS_PWD.PWD IS '비밀번호';

COMMENT ON COLUMN INS_APP.CMS_PWD.USE_YN IS '사용여부';

COMMENT ON COLUMN INS_APP.CMS_PWD.PWD_FAIL_CNT IS '비밀번호 실패 횟수';

COMMENT ON COLUMN INS_APP.CMS_PWD.PWD_CHG_YMD IS '비밀번호 변경 일자';

COMMENT ON COLUMN INS_APP.CMS_PWD.PWD_CHG_SE IS '관리자,만료,단순';

COMMENT ON COLUMN INS_APP.CMS_PWD.PWD_EXP_YMD IS '비밀번호 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_PWD.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_PWD.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PWD.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PWD.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_PWD.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_PWD.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_PWD.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_PWD.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PWD
    ON INS_APP.CMS_PWD (
                        USER_ID ASC,
                        USER_SE ASC
        );

ALTER TABLE INS_APP.CMS_PWD
    ADD
        CONSTRAINT PK_CMS_PWD
            PRIMARY KEY (
                         USER_ID,
                         USER_SE
                );

CREATE TABLE INS_APP.CMS_PWD_HIST (
                                      SN NUMBER(15) NOT NULL,
                                      PWD VARCHAR(100) NOT NULL,
                                      PWD_CHG_YMD VARCHAR2(8) NOT NULL,
                                      PWD_CHG_SE VARCHAR2(20),
                                      CHG_USER_ID VARCHAR2(100) NOT NULL,
                                      USER_SE VARCHAR2(20) NOT NULL,
                                      CHG_USER_IP VARCHAR2(40),
                                      PWD_EXP_YMD VARCHAR2(8),
                                      CRT_AT DATE NOT NULL,
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PWD_HIST IS '[00.시스템]05.비밀번호 히스토리';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.PWD IS '비밀번호';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.PWD_CHG_YMD IS '비밀번호 변경 일자';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.PWD_CHG_SE IS '비밀번호 변경 구분';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CHG_USER_ID IS '업무사용자, 사용자, 관리자';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.USER_SE IS '관리자, 사용자, 업무사용자';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CHG_USER_IP IS '변경 사용자 아이피';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.PWD_EXP_YMD IS '비밀번호 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PWD_HIST.CRT_PGM IS '등록프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PWD_HIST
    ON INS_APP.CMS_PWD_HIST (
                             SN ASC
        );

ALTER TABLE INS_APP.CMS_PWD_HIST
    ADD
        CONSTRAINT PK_CMS_PWD_HIST
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_RF_TK (
                                   TK_ID VARCHAR2(100) NOT NULL,
                                   USER_ID VARCHAR2(100) NOT NULL,
                                   TK VARCHAR(100) NOT NULL,
                                   TK_EXP_DT DATE NOT NULL,
                                   RVK_YN VARCHAR2(1) NOT NULL,
                                   IP_ADDR VARCHAR2(40),
                                   USER_AGT VARCHAR2(100),
                                   CRT_AT DATE NOT NULL,
                                   CRT_BY VARCHAR2(100) NOT NULL,
                                   CRT_IP VARCHAR2(40) NOT NULL,
                                   CRT_PGM VARCHAR2(100) NOT NULL,
                                   UPD_AT DATE NOT NULL,
                                   UPD_BY VARCHAR2(100) NOT NULL,
                                   UPD_IP VARCHAR2(40) NOT NULL,
                                   UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_RF_TK IS '[00.시스템]06.JWT 리프레시 토큰';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.TK_ID IS '토큰 아이디';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.TK IS 'TOKEN ';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.TK_EXP_DT IS 'EXPIRES_AT ';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.RVK_YN IS 'REVOKED_YN';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.IP_ADDR IS '아이피 주소';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.USER_AGT IS 'USER_AGENT ';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_RF_TK.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_RF_TK
    ON INS_APP.CMS_RF_TK (
                          TK_ID ASC
        );

ALTER TABLE INS_APP.CMS_RF_TK
    ADD
        CONSTRAINT PK_CMS_RF_TK
            PRIMARY KEY (
                         TK_ID
                );

CREATE TABLE INS_APP.CMS_SNS_IF (
                                    SN NUMBER(15) NOT NULL,
                                    USER_ID VARCHAR2(100) NOT NULL,
                                    USER_SE VARCHAR2(20) NOT NULL,
                                    PRVD_NM VARCHAR2(200) NOT NULL,
                                    PRVD_UID VARCHAR2(50),
                                    PRVD_EML VARCHAR2(100),
                                    IF_DESC VARCHAR2(4000),
                                    ACC_TK VARCHAR(100),
                                    RF_TK VARCHAR(100),
                                    TK_EXP_DT DATE,
                                    MAIN_LGN_YN VARCHAR2(1),
                                    LGN_AVL_YN VARCHAR2(1),
                                    LST_LGN_DT DATE,
                                    USE_YN VARCHAR2(1),
                                    IF_FST_DT DATE,
                                    IF_END_DT DATE,
                                    IF_IP VARCHAR2(40),
                                    CRT_BY VARCHAR2(100) NOT NULL,
                                    CRT_IP VARCHAR2(40) NOT NULL,
                                    CRT_PGM VARCHAR2(100) NOT NULL,
                                    UPD_AT DATE NOT NULL,
                                    UPD_BY VARCHAR2(100) NOT NULL,
                                    UPD_IP VARCHAR2(40) NOT NULL,
                                    UPD_PGM VARCHAR2(100) NOT NULL,
                                    CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_SNS_IF IS '[00.시스템]07.SNS 연동';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.USER_SE IS '사용자 구분';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.PRVD_NM IS 'provider (구글, 카카오, 네이버,애플)';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.PRVD_UID IS '공급자 UID';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.PRVD_EML IS '공급자 이메일';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.IF_DESC IS '추가 컬럼';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.ACC_TK IS '암호화';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.RF_TK IS '암호화';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.TK_EXP_DT IS '토큰 만료 일시';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.MAIN_LGN_YN IS '주요 로그인 방식으로 사용하는지';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.LGN_AVL_YN IS '로그인 가능, 불가능';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.LST_LGN_DT IS '최종 로그인 일시';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.USE_YN IS '활성화, 비활성화';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.IF_FST_DT IS '연동 최초 일시';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.IF_END_DT IS '연동 종료 일시';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.IF_IP IS '연동 아이피';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_SNS_IF.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SNS_IF
    ON INS_APP.CMS_SNS_IF (
                           SN ASC
        );

ALTER TABLE INS_APP.CMS_SNS_IF
    ADD
        CONSTRAINT PK_CMS_SNS_IF
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_USER_AUTH (
                                       USER_ID VARCHAR2(100) NOT NULL,
                                       AUTH_CD VARCHAR2(20) NOT NULL,
                                       AUTH_EXP_YMD VARCHAR2(8),
                                       AUTH_GRNT_YMD VARCHAR2(8),
                                       AUTH_SE VARCHAR2(20),
                                       CRT_AT DATE NOT NULL,
                                       CRT_BY VARCHAR2(100) NOT NULL,
                                       CRT_IP VARCHAR2(40) NOT NULL,
                                       CRT_PGM VARCHAR2(100) NOT NULL,
                                       UPD_AT DATE NOT NULL,
                                       UPD_BY VARCHAR2(100) NOT NULL,
                                       UPD_IP VARCHAR2(40) NOT NULL,
                                       UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER_AUTH IS '[00.시스템]08.사용자 권한';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.USER_ID IS '업무사용자, 관리자, 일반사용자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.AUTH_CD IS '권한 테이블';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.AUTH_EXP_YMD IS '권한 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.AUTH_GRNT_YMD IS '권한 부여 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.AUTH_SE IS '전체,부서,개인';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_USER_AUTH
    ON INS_APP.CMS_USER_AUTH (
                              USER_ID ASC,
                              AUTH_CD ASC
        );

ALTER TABLE INS_APP.CMS_USER_AUTH
    ADD
        CONSTRAINT PK_CMS_USER_AUTH
            PRIMARY KEY (
                         USER_ID,
                         AUTH_CD
                );

CREATE TABLE INS_APP.CMS_USER_AUTH_LOG (
                                           LOG_DT DATE,
                                           LOG_RSN VARCHAR2(4000),
                                           USER_ID VARCHAR2(100) NOT NULL,
                                           AUTH_CD VARCHAR2(20) NOT NULL,
                                           AUTH_EXP_YMD VARCHAR2(8),
                                           AUTH_GRNT_YMD VARCHAR2(8),
                                           AUTH_SE VARCHAR2(20),
                                           CRT_AT DATE NOT NULL,
                                           CRT_BY VARCHAR2(100) NOT NULL,
                                           CRT_IP VARCHAR2(40) NOT NULL,
                                           CRT_PGM VARCHAR2(100) NOT NULL,
                                           UPD_AT DATE NOT NULL,
                                           UPD_BY VARCHAR2(100) NOT NULL,
                                           UPD_IP VARCHAR2(40) NOT NULL,
                                           UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER_AUTH_LOG IS '[00.시스템]09.사용자 권한 로그';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.LOG_DT IS '로그 일시';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.LOG_RSN IS '로그 사유';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.USER_ID IS '업무사용자, 관리자, 일반사용자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.AUTH_CD IS '권한 테이블';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.AUTH_EXP_YMD IS '권한 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.AUTH_GRNT_YMD IS '권한 부여 일자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.AUTH_SE IS '전체,부서,개인';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_AUTH_LOG.UPD_PGM IS '수정프로그램';

CREATE TABLE INS_APP.CMS_USER_CERT (
                                       SN NUMBER(15) NOT NULL,
                                       CERT_ID VARCHAR2(100) NOT NULL,
                                       MTELNO VARCHAR2(20),
                                       EML VARCHAR2(100),
                                       CERT_SE VARCHAR2(20),
                                       CERT_NO VARCHAR(100) NOT NULL,
                                       CRT_AT DATE NOT NULL,
                                       CRT_BY VARCHAR2(100) NOT NULL,
                                       CRT_IP VARCHAR2(40) NOT NULL,
                                       CRT_PGM VARCHAR2(100) NOT NULL,
                                       UPD_AT DATE NOT NULL,
                                       UPD_BY VARCHAR2(100) NOT NULL,
                                       UPD_IP VARCHAR2(40) NOT NULL,
                                       UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_USER_CERT IS '[00.시스템]10.사용자 인증';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CERT_ID IS '인증 아이디';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.MTELNO IS '휴대전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.EML IS '이메일';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CERT_SE IS '이메일,휴대전화번호';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CERT_NO IS '인증 번호';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_USER_CERT.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_USER_CERT
    ON INS_APP.CMS_USER_CERT (
                              SN ASC,
                              CERT_ID ASC
        );

ALTER TABLE INS_APP.CMS_USER_CERT
    ADD
        CONSTRAINT PK_CMS_USER_CERT
            PRIMARY KEY (
                         SN,
                         CERT_ID
                );

CREATE TABLE INS_APP.CMS_PRV_QRY_LOG (
                                         SN NUMBER(15) NOT NULL,
                                         SITE_CD VARCHAR2(20),
                                         ACC_USER_ID VARCHAR2(100),
                                         ACC_USER_NM VARCHAR2(100),
                                         TGT_USER_ID VARCHAR2(100),
                                         TGT_USER_NM VARCHAR2(100),
                                         QRY_RSN VARCHAR2(4000),
                                         QRY_PATH VARCHAR2(1000),
                                         ACC_IP VARCHAR2(40),
                                         USER_AGT VARCHAR2(100),
                                         CRT_AT DATE
);

COMMENT ON TABLE INS_APP.CMS_PRV_QRY_LOG IS '[00.시스템]11.개인정보 조회 이력 로그';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.ACC_USER_ID IS '접근 사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.ACC_USER_NM IS '삭제돼도 보존';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.TGT_USER_ID IS '타겟 사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.TGT_USER_NM IS '타겟 사용자 이름';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.QRY_RSN IS '본인확인, 회원정보 확인';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.QRY_PATH IS 'URL';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.ACC_IP IS '접근 아이피';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.USER_AGT IS '사용자 에이전트';

COMMENT ON COLUMN INS_APP.CMS_PRV_QRY_LOG.CRT_AT IS '등록 일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PRV_QRY_LOG
    ON INS_APP.CMS_PRV_QRY_LOG (
                                SN ASC
        );

ALTER TABLE INS_APP.CMS_PRV_QRY_LOG
    ADD
        CONSTRAINT PK_CMS_PRV_QRY_LOG
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_SU_LOGIN_LOG (
                                          SN NUMBER(15) NOT NULL,
                                          TGT_ID VARCHAR2(100),
                                          USER_SE VARCHAR2(20),
                                          USER_ID VARCHAR2(100),
                                          USE_DT DATE,
                                          USE_IP VARCHAR2(40)
);

COMMENT ON TABLE INS_APP.CMS_SU_LOGIN_LOG IS '[00.시스템]12.사용자 전환 로그인 로그';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.TGT_ID IS '타겟 아이디';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.USER_SE IS '사용자 구분';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.USE_DT IS '사용 일시';

COMMENT ON COLUMN INS_APP.CMS_SU_LOGIN_LOG.USE_IP IS '사용 아이피';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SU_LOGIN_LOG
    ON INS_APP.CMS_SU_LOGIN_LOG (
                                 SN ASC
        );

ALTER TABLE INS_APP.CMS_SU_LOGIN_LOG
    ADD
        CONSTRAINT PK_CMS_SU_LOGIN_LOG
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_LOGIN_LOG (
                                       SN NUMBER(15) NOT NULL,
                                       USER_ID VARCHAR2(100),
                                       USER_SE VARCHAR2(20),
                                       SITE_CD VARCHAR2(20),
                                       USER_NM VARCHAR2(100),
                                       LGNTRY_SE VARCHAR2(20),
                                       LGN_MTHD_SE VARCHAR2(20),
                                       LGN_FAIL_RSN_SE VARCHAR2(20),
                                       ACC_IP VARCHAR2(40),
                                       USER_AGT VARCHAR2(100),
                                       EQP_SE VARCHAR2(20),
                                       OS_NM VARCHAR2(100),
                                       BRWS_NM VARCHAR2(100),
                                       CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_LOGIN_LOG IS '[00.시스템]13.로그인 로그';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.USER_SE IS '사용자 구분';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.USER_NM IS '사용자 명';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.LGNTRY_SE IS '로그인성공,실패,로그아웃';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.LGN_MTHD_SE IS '자체,카카오,구글';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.LGN_FAIL_RSN_SE IS '비밀번호 불일치, 존재하지 않는 계정,계정 잠금
,계정정지,비활성 계정, SNS 미연동 ';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.ACC_IP IS '접근 아이피';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.USER_AGT IS '사용자 에이전트';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.EQP_SE IS '장비 구분';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.OS_NM IS 'Windows | macOS | iOS | Android';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.BRWS_NM IS ' Chrome | Safari | Firefox';

COMMENT ON COLUMN INS_APP.CMS_LOGIN_LOG.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_LOGIN_LOG
    ON INS_APP.CMS_LOGIN_LOG (
                              SN ASC
        );

ALTER TABLE INS_APP.CMS_LOGIN_LOG
    ADD
        CONSTRAINT PK_CMS_LOGIN_LOG
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_PUSH_TK (
                                     SN NUMBER(15) NOT NULL,
                                     SITE_CD VARCHAR2(20) NOT NULL,
                                     USER_ID VARCHAR2(100) NOT NULL,
                                     USER_SE VARCHAR2(20),
                                     DVC_ID VARCHAR2(100),
                                     DVC_NM VARCHAR2(100),
                                     EQP_SE VARCHAR2(20) NOT NULL,
                                     OS_NM VARCHAR2(100),
                                     APP_VER VARCHAR2(100),
                                     PUSH_CH VARCHAR2(100),
                                     PUSH_TK VARCHAR(100) NOT NULL,
                                     USE_YN VARCHAR2(1),
                                     PUSH_AGR_YN VARCHAR2(1),
                                     LST_PUSH_USE_DT DATE,
                                     TK_EXP_YMD VARCHAR2(8),
                                     CRT_BY VARCHAR2(100) NOT NULL,
                                     CRT_IP VARCHAR2(40) NOT NULL,
                                     CRT_PGM VARCHAR2(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR2(100) NOT NULL,
                                     UPD_IP VARCHAR2(40) NOT NULL,
                                     UPD_PGM VARCHAR2(100) NOT NULL,
                                     CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PUSH_TK IS '[00.시스템]98.푸시 토큰';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.USER_SE IS '사용자 구분';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.DVC_ID IS '장치 아이디';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.DVC_NM IS '장치 명';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.EQP_SE IS ' ios,android, ';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.OS_NM IS '운영체제 명';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.APP_VER IS '앱 버전';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.PUSH_CH IS 'fcm | apns | web_push';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.PUSH_TK IS '푸시 토큰';


COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.PUSH_AGR_YN IS '푸시 동의 여부';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.LST_PUSH_USE_DT IS '최종 푸시 사용 일시';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.TK_EXP_YMD IS '토큰 만료 일자';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PUSH_TK
    ON INS_APP.CMS_PUSH_TK (
                            SN ASC
        );

ALTER TABLE INS_APP.CMS_PUSH_TK
    ADD
        CONSTRAINT PK_CMS_PUSH_TK
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_PUSH_TK_LOG (
                                         SN NUMBER(15) NOT NULL,
                                         SITE_CD VARCHAR2(20),
                                         USER_ID VARCHAR2(100),
                                         DVC_ID VARCHAR2(100),
                                         PUSH_CH VARCHAR2(100),
                                         TK_KND_SE VARCHAR2(20) NOT NULL,
                                         RSLT_CD VARCHAR2(20),
                                         RSLT_MSG VARCHAR2(4000),
                                         CRT_BY VARCHAR2(100) NOT NULL,
                                         CRT_IP VARCHAR2(40) NOT NULL,
                                         CRT_PGM VARCHAR2(100) NOT NULL,
                                         UPD_AT DATE NOT NULL,
                                         UPD_BY VARCHAR2(100) NOT NULL,
                                         UPD_IP VARCHAR2(40) NOT NULL,
                                         UPD_PGM VARCHAR2(100) NOT NULL,
                                         CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PUSH_TK_LOG IS '[00.시스템]99.푸시 토큰 이력';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.USER_ID IS '사용자 아이디';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.DVC_ID IS '장치 아이디';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.PUSH_CH IS '푸시 채널';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.TK_KND_SE IS '등록,갱신,삭제,발송성공,발송실패,토큰만료';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.RSLT_CD IS '결과 코드';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.RSLT_MSG IS '결과 메시지';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_PUSH_TK_LOG.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PUSH_TK_LOG
    ON INS_APP.CMS_PUSH_TK_LOG (
                                SN ASC
        );

ALTER TABLE INS_APP.CMS_PUSH_TK_LOG
    ADD
        CONSTRAINT PK_CMS_PUSH_TK_LOG
            PRIMARY KEY (
                         SN
                );

CREATE TABLE INS_APP.CMS_COM_CODE (
                                      CD VARCHAR2(20) NOT NULL,
                                      UP_CD VARCHAR2(20) NOT NULL,
                                      CD_NM VARCHAR2(100),
                                      CD_LVL NUMBER(10),
                                      USE_YN VARCHAR2(1),
                                      CD_ORD NUMBER(10),
                                      REF_CD1 VARCHAR2(20),
                                      REF_CD2 VARCHAR2(20),
                                      REF_CD3 VARCHAR2(20),
                                      REF_CD4 VARCHAR2(20),
                                      REF_CD5 VARCHAR2(20),
                                      REF_NUM1 NUMBER(10,4),
                                      REF_NUM2 NUMBER(10,4),
                                      REF_NUM3 NUMBER(10,4),
                                      REF_NUM4 NUMBER(10,4),
                                      REF_NUM5 NUMBER(10,4),
                                      CD_RMK VARCHAR2(4000),
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_CODE IS '[01.공통]01.코드';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CD IS '코드';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.UP_CD IS '상위 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CD_NM IS '코드 명';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CD_LVL IS '코드 레벨';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CD_ORD IS '코드 순서';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_CD1 IS '참조 코드1';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_CD2 IS '참조 코드2';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_CD3 IS '참조 코드3';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_CD4 IS '참조 코드4';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_CD5 IS '참조 코드5';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_NUM1 IS '참조 숫자1';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_NUM2 IS '참조 숫자2';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_NUM3 IS '참조 숫자3';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_NUM4 IS '참조 숫자4';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.REF_NUM5 IS '참조 숫자5';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CD_RMK IS '코드 비고';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_CODE.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_CODE
    ON INS_APP.CMS_COM_CODE (
                             CD ASC,
                             UP_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_CODE
    ADD
        CONSTRAINT PK_CMS_COM_CODE
            PRIMARY KEY (
                         CD,
                         UP_CD
                );

CREATE TABLE INS_APP.CMS_COM_MENU (
                                      MENU_CD VARCHAR2(20) NOT NULL,
                                      PRGM_NM VARCHAR2(100),
                                      PRGM_PATH VARCHAR2(400),
                                      MENU_LVL NUMBER(10),
                                      UP_MENU_CD VARCHAR2(20),
                                      MENU_NM VARCHAR2(100),
                                      MENU_ORD NUMBER(10),
                                      QRY_USE_YN VARCHAR2(1),
                                      NEW_USE_YN VARCHAR2(1),
                                      SAVE_USE_YN VARCHAR2(1),
                                      DEL_USE_YN VARCHAR2(1),
                                      OUTP_USE_YN VARCHAR2(1),
                                      URL_MTHD_SE VARCHAR2(20),
                                      URL_ADDR VARCHAR2(1000),
                                      PARAM1 VARCHAR2(100),
                                      PARAM2 VARCHAR2(100),
                                      PARAM3 VARCHAR2(100),
                                      PARAM_4 VARCHAR2(100),
                                      PARAM_5 VARCHAR2(100),
                                      MENU_RMK VARCHAR2(4000),
                                      PRV_USE_YN VARCHAR2(1),
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_MENU IS '[01.공통]02.메뉴';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.MENU_CD IS '메뉴 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PRGM_NM IS '소스 파일 명';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PRGM_PATH IS '소스 경로';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.MENU_LVL IS '1레벨, 2레벨';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.UP_MENU_CD IS '상위 메뉴 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.MENU_NM IS '메뉴 명';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.MENU_ORD IS '메뉴 순서';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.QRY_USE_YN IS 'CMS 메뉴는 이렇게 관리??';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.NEW_USE_YN IS '신규 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.SAVE_USE_YN IS '저장 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.DEL_USE_YN IS '삭제 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.OUTP_USE_YN IS '출력 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.URL_MTHD_SE IS '내부/ 새창';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.URL_ADDR IS '외부  URL 사용하는 경우';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PARAM1 IS '매뉴 오픈 시 사용될 수 있을 듯';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PARAM2 IS '파라미터2';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PARAM3 IS '파라미터3';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PARAM_4 IS '파라미터4';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PARAM_5 IS '파라미터5';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.MENU_RMK IS '메뉴 비고';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.PRV_USE_YN IS '개인정보 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_MENU.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_MENU
    ON INS_APP.CMS_COM_MENU (
                             MENU_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_MENU
    ADD
        CONSTRAINT PK_CMS_COM_MENU
            PRIMARY KEY (
                         MENU_CD
                );

CREATE TABLE INS_APP.CMS_COM_ORG (
                                     ORG_CD VARCHAR2(20) NOT NULL,
                                     ORG_NM VARCHAR2(100),
                                     ORG_STS_SE VARCHAR2(20),
                                     ORD NUMBER(10),
                                     USE_YN VARCHAR2(1),
                                     CRT_BY VARCHAR2(100) NOT NULL,
                                     CRT_IP VARCHAR2(40) NOT NULL,
                                     CRT_PGM VARCHAR2(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR2(100) NOT NULL,
                                     UPD_IP VARCHAR2(40) NOT NULL,
                                     UPD_PGM VARCHAR2(100) NOT NULL,
                                     CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_ORG IS '[01.공통]03.조직';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.ORG_CD IS '조직 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.ORG_NM IS '조직 명';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.ORG_STS_SE IS '조직 상태 구분';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.ORD IS '순서';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.USE_YN IS '사용여부';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_ORG.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_ORG
    ON INS_APP.CMS_COM_ORG (
                            ORG_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_ORG
    ADD
        CONSTRAINT PK_CMS_COM_ORG
            PRIMARY KEY (
                         ORG_CD
                );

CREATE TABLE INS_APP.CMS_COM_DEPT (
                                      DEPT_CD VARCHAR2(20) NOT NULL,
                                      ORG_CD VARCHAR2(20) NOT NULL,
                                      DEPT_NM VARCHAR2(100),
                                      ORD NUMBER(10),
                                      USE_YN VARCHAR2(1),
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_DEPT IS '[01.공통]04.부서';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.DEPT_CD IS '부서 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.ORG_CD IS '조직 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.DEPT_NM IS '부서 명';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.ORD IS '순서';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_DEPT.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_DEPT
    ON INS_APP.CMS_COM_DEPT (
                             DEPT_CD ASC,
                             ORG_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_DEPT
    ADD
        CONSTRAINT PK_CMS_COM_DEPT
            PRIMARY KEY (
                         DEPT_CD,
                         ORG_CD
                );

CREATE TABLE INS_APP.CMS_COM_AUTH (
                                      AUTH_CD VARCHAR2(20) NOT NULL,
                                      MENU_CD VARCHAR2(20),
                                      AUTH_NM VARCHAR2(100),
                                      AUTH_SE VARCHAR2(20),
                                      AUTH_ORG_CD VARCHAR2(20),
                                      AUTH_DEPT_CD VARCHAR2(20),
                                      AUTH_ORD NUMBER(10),
                                      USE_YN VARCHAR2(1),
                                      AUTH_DESC VARCHAR2(4000),
                                      AUTH_RMK VARCHAR2(4000),
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_AUTH IS '[01.공통]05.권한';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_CD IS '코드가 레벨';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.MENU_CD IS '메뉴 1레벨(공통관리, 업무단위등)';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_NM IS '권한 명';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_SE IS '전체권한,부서권한,개인권한';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_ORG_CD IS '조직관리(ORG_CD)';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_DEPT_CD IS '부서관리(DEPT_CD)';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_ORD IS '권한 순서';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.USE_YN IS '사용여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_DESC IS '권한 내용';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.AUTH_RMK IS '권한 비고';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_AUTH
    ON INS_APP.CMS_COM_AUTH (
                             AUTH_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_AUTH
    ADD
        CONSTRAINT PK_CMS_COM_AUTH
            PRIMARY KEY (
                         AUTH_CD
                );

CREATE TABLE INS_APP.CMS_COM_AUTH_MENU (
                                           MENU_CD VARCHAR2(20) NOT NULL,
                                           AUTH_CD VARCHAR2(20) NOT NULL,
                                           AUTH_SE VARCHAR2(20),
                                           USE_YN VARCHAR2(1),
                                           QRY_YN VARCHAR2(1),
                                           SAVE_YN VARCHAR2(1),
                                           DEL_YN VARCHAR2(1),
                                           NEW_YN VARCHAR2(1),
                                           EXL_YN VARCHAR2(1),
                                           OUTP_YN VARCHAR2(1),
                                           CRT_BY VARCHAR2(100) NOT NULL,
                                           CRT_IP VARCHAR2(40) NOT NULL,
                                           CRT_PGM VARCHAR2(100) NOT NULL,
                                           UPD_AT DATE NOT NULL,
                                           UPD_BY VARCHAR2(100) NOT NULL,
                                           UPD_IP VARCHAR2(40) NOT NULL,
                                           UPD_PGM VARCHAR2(100) NOT NULL,
                                           CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_COM_AUTH_MENU IS '[01.공통]06.권한별 메뉴';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.MENU_CD IS '메뉴 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.AUTH_CD IS '권한 코드';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.AUTH_SE IS '개인/부서/전체';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.QRY_YN IS '조회 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.SAVE_YN IS '저장 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.DEL_YN IS '삭제 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.NEW_YN IS '신규 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.EXL_YN IS '엑셀 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.OUTP_YN IS '출력 여부';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_COM_AUTH_MENU.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_COM_AUTH_MENU
    ON INS_APP.CMS_COM_AUTH_MENU (
                                  MENU_CD ASC,
                                  AUTH_CD ASC
        );

ALTER TABLE INS_APP.CMS_COM_AUTH_MENU
    ADD
        CONSTRAINT PK_CMS_COM_AUTH_MENU
            PRIMARY KEY (
                         MENU_CD,
                         AUTH_CD
                );

CREATE TABLE INS_APP.CMS_FILE_GRP (
                                      AFILE_ID VARCHAR2(100) NOT NULL,
                                      TASK_SITE_SE VARCHAR2(20),
                                      LGN_USE_YN VARCHAR2(1),
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL,
                                      CRT_BY VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_FILE_GRP IS '[01.공통]07..파일그룹';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.AFILE_ID IS '첨부파일 아이디';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.TASK_SITE_SE IS 'cms/ 별개 시스템';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.LGN_USE_YN IS '로그인 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_FILE_GRP.CRT_BY IS '등록자';

CREATE UNIQUE INDEX INS_APP.PK_CMS_FILE_GRP
    ON INS_APP.CMS_FILE_GRP (
                             AFILE_ID ASC
        );

ALTER TABLE INS_APP.CMS_FILE_GRP
    ADD
        CONSTRAINT PK_CMS_FILE_GRP
            PRIMARY KEY (
                         AFILE_ID
                );

CREATE TABLE INS_APP.CMS_FILE (
                                  AFILE_ID VARCHAR2(100) NOT NULL,
                                  AFILE_SN NUMBER(15) NOT NULL,
                                  FILE_PATH VARCHAR2(400),
                                  FILE_NM VARCHAR2(300),
                                  FILE_DESC VARCHAR2(4000),
                                  FILE_SZ NUMBER(15,5),
                                  DEL_YN VARCHAR2(1),
                                  CRT_IP VARCHAR2(40) NOT NULL,
                                  CRT_PGM VARCHAR2(100) NOT NULL,
                                  UPD_AT DATE NOT NULL,
                                  UPD_BY VARCHAR2(100) NOT NULL,
                                  UPD_IP VARCHAR2(40) NOT NULL,
                                  UPD_PGM VARCHAR2(100) NOT NULL,
                                  CRT_AT DATE NOT NULL,
                                  CRT_BY VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_FILE IS '[01.공통]08.파일';

COMMENT ON COLUMN INS_APP.CMS_FILE.AFILE_ID IS '첨부파일 아이디';

COMMENT ON COLUMN INS_APP.CMS_FILE.AFILE_SN IS '첨부파일 일련번호';

COMMENT ON COLUMN INS_APP.CMS_FILE.FILE_PATH IS '파일 경로';

COMMENT ON COLUMN INS_APP.CMS_FILE.FILE_NM IS '파일 명';

COMMENT ON COLUMN INS_APP.CMS_FILE.FILE_DESC IS '파일 내용';

COMMENT ON COLUMN INS_APP.CMS_FILE.FILE_SZ IS '파일 크기';

COMMENT ON COLUMN INS_APP.CMS_FILE.DEL_YN IS '삭제 여부';

COMMENT ON COLUMN INS_APP.CMS_FILE.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_FILE.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_FILE.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_FILE.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_FILE.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_FILE.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_FILE.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_FILE.CRT_BY IS '등록자';

CREATE UNIQUE INDEX INS_APP.PK_CMS_FILE
    ON INS_APP.CMS_FILE (
                         AFILE_ID ASC,
                         AFILE_SN ASC
        );

ALTER TABLE INS_APP.CMS_FILE
    ADD
        CONSTRAINT PK_CMS_FILE
            PRIMARY KEY (
                         AFILE_ID,
                         AFILE_SN
                );

CREATE TABLE INS_APP.CMS_SITE (
                                  SITE_CD VARCHAR2(20) NOT NULL,
                                  SITE_NM VARCHAR2(100),
                                  SITE_DESC VARCHAR2(4000),
                                  USE_YN VARCHAR2(1),
                                  CRT_AT DATE NOT NULL,
                                  CRT_BY VARCHAR2(100) NOT NULL,
                                  CRT_IP VARCHAR2(40) NOT NULL,
                                  CRT_PGM VARCHAR2(100) NOT NULL,
                                  UPD_AT DATE NOT NULL,
                                  UPD_BY VARCHAR2(100) NOT NULL,
                                  UPD_IP VARCHAR2(40) NOT NULL,
                                  UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_SITE IS '사이트 정보';

COMMENT ON COLUMN INS_APP.CMS_SITE.SITE_CD IS '사이트 코드?';

COMMENT ON COLUMN INS_APP.CMS_SITE.SITE_NM IS '사이트 명';

COMMENT ON COLUMN INS_APP.CMS_SITE.SITE_DESC IS '사이트 설명';

COMMENT ON COLUMN INS_APP.CMS_SITE.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_SITE.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_SITE.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_SITE.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_SITE.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_SITE.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_SITE.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SITE
    ON INS_APP.CMS_SITE (
                         SITE_CD ASC
        );

ALTER TABLE INS_APP.CMS_SITE
    ADD
        CONSTRAINT PK_CMS_SITE
            PRIMARY KEY (
                         SITE_CD
                );

CREATE TABLE INS_APP.CMS_SITE_IP (
                                     SITE_CD VARCHAR2(20) NOT NULL,
                                     SN VARCHAR(20) NOT NULL,
                                     USE_YN VARCHAR(1),
                                     IP_DESC VARCHAR(4000),
                                     PERM_IP VARCHAR(40),
                                     USE_ST_YMD VARCHAR(8),
                                     USE_END_YMD VARCHAR(8),
                                     CRT_AT DATE NOT NULL,
                                     CRT_BY VARCHAR(100) NOT NULL,
                                     CRT_IP VARCHAR(40) NOT NULL,
                                     CRT_PGM VARCHAR(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR(100) NOT NULL,
                                     UPD_IP VARCHAR(40) NOT NULL,
                                     UPD_PGM VARCHAR(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_SITE_IP IS '[03.사이트]02.사이트 아이피';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.IP_DESC IS '아이피 내용';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.PERM_IP IS '허용 아이피';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.USE_ST_YMD IS '사용 시작 일자';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.USE_END_YMD IS '사용 종료 일자';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_IP.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SITE_IP
    ON INS_APP.CMS_SITE_IP (
                            SITE_CD ASC,
                            SN ASC
        );

ALTER TABLE INS_APP.CMS_SITE_IP
    ADD
        CONSTRAINT PK_CMS_SITE_IP
            PRIMARY KEY (
                         SITE_CD,
                         SN
                );

CREATE TABLE INS_APP.CMS_SITE_MENU (
                                       SITE_CD VARCHAR2(20) NOT NULL,
                                       MENU_CD VARCHAR2(20) NOT NULL,
                                       LANG_SE VARCHAR2(20) NOT NULL,
                                       MENU_LVL NUMBER(10),
                                       UP_MENU_CD VARCHAR2(20),
                                       PRGM_PATH VARCHAR2(400),
                                       MENU_NM VARCHAR2(100),
                                       MENU_SE VARCHAR2(20),
                                       BRD_ID VARCHAR2(100),
                                       CTT_ID VARCHAR2(100),
                                       MENU_ORD NUMBER(10),
                                       LGN_USE_YN VARCHAR2(1),
                                       URL_MTHD_SE VARCHAR2(20),
                                       URL_ADDR VARCHAR2(1000),
                                       PARAM1 VARCHAR2(100),
                                       PARAM2 VARCHAR2(100),
                                       PARAM3 VARCHAR2(100),
                                       PARAM4 VARCHAR2(100),
                                       PARAM5 VARCHAR2(100),
                                       PRV_USE_YN VARCHAR2(1),
                                       PRGM_TYPE_SE VARCHAR2(20),
                                       CRT_AT DATE NOT NULL,
                                       CRT_BY VARCHAR2(100) NOT NULL,
                                       CRT_IP VARCHAR2(40) NOT NULL,
                                       CRT_PGM VARCHAR2(100) NOT NULL,
                                       UPD_AT DATE NOT NULL,
                                       UPD_BY VARCHAR2(100) NOT NULL,
                                       UPD_IP VARCHAR2(40) NOT NULL,
                                       UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_SITE_MENU IS '[03.사이트]03.사이트 메뉴';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.MENU_CD IS 'CMS+1레벨2+2레벨3+3레벨3 으로 생성';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.LANG_SE IS '언어 구분';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.MENU_LVL IS '메뉴 레벨';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.UP_MENU_CD IS '상위 메뉴 코드';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PRGM_PATH IS '소스코드 경로';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.MENU_NM IS '메뉴명';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.MENU_SE IS '팝업/일반/탭/게시판/컨텐츠';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.BRD_ID IS '게시판 관리의 코드를 입력해서 연결? ';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.CTT_ID IS '컨텐츠 연결';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.MENU_ORD IS '메뉴 순서';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.LGN_USE_YN IS '로그인 해야만 사용 가능';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.URL_MTHD_SE IS '내부/ 새창';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.URL_ADDR IS '외부  URL 사용하는 경우';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PARAM1 IS '파라미터1';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PARAM2 IS '파라미터2';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PARAM3 IS '파라미터3';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PARAM4 IS '파라미터4';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PARAM5 IS '파라미터5';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PRV_USE_YN IS '개인정보 조회 이력에 로그';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.PRGM_TYPE_SE IS '조회/저장/출력 등 관리?';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_MENU.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SITE_MENU
    ON INS_APP.CMS_SITE_MENU (
                              SITE_CD ASC,
                              MENU_CD ASC,
                              LANG_SE ASC
        );

ALTER TABLE INS_APP.CMS_SITE_MENU
    ADD
        CONSTRAINT PK_CMS_SITE_MENU
            PRIMARY KEY (
                         SITE_CD,
                         MENU_CD,
                         LANG_SE
                );

CREATE TABLE INS_APP.CMS_SITE_VST_HIST (
                                           SITE_CD VARCHAR2(20) NOT NULL,
                                           MENU_CD VARCHAR2(20) NOT NULL,
                                           LANG_SE VARCHAR2(20) NOT NULL,
                                           SN NUMBER(15) NOT NULL,
                                           IP VARCHAR2(40),
                                           VST_YMD VARCHAR2(8),
                                           OS_NM VARCHAR2(100),
                                           BRWS_NM VARCHAR2(100),
                                           USER_AGT VARCHAR2(100),
                                           TGT_BRWS_NM VARCHAR2(100),
                                           PSTN VARCHAR2(100),
                                           BRD_ID VARCHAR2(100),
                                           CTT_ID VARCHAR2(100),
                                           SITE_URL VARCHAR2(1000),
                                           REF_URL VARCHAR2(1000),
                                           MENU_SE VARCHAR2(20),
                                           EQP_SE VARCHAR2(20),
                                           CRT_AT DATE NOT NULL,
                                           CRT_BY VARCHAR2(100) NOT NULL,
                                           CRT_IP VARCHAR2(40) NOT NULL,
                                           CRT_PGM VARCHAR2(100) NOT NULL,
                                           UPD_AT DATE NOT NULL,
                                           UPD_BY VARCHAR2(100) NOT NULL,
                                           UPD_IP VARCHAR2(40) NOT NULL,
                                           UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_SITE_VST_HIST IS '[03.사이트]04.사이트 방문 이력';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.MENU_CD IS '메뉴 코드';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.LANG_SE IS '언어 구분';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.IP IS '아이피';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.VST_YMD IS '방문 일자';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.OS_NM IS 'Windows';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.BRWS_NM IS 'Chrome-90.0.4430.212';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.USER_AGT IS '사용자 에이전트';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.TGT_BRWS_NM IS 'CHROME|SAFARI';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.PSTN IS 'ko';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.BRD_ID IS '게시판 관리의 코드를 입력해서 연결? ';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.CTT_ID IS '컨텐츠 연결';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.SITE_URL IS '사이트 URL';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.REF_URL IS '이전 방문';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.MENU_SE IS '메뉴 구분';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.EQP_SE IS 'pc/?';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_SITE_VST_HIST.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_SITE_VST_HIST
    ON INS_APP.CMS_SITE_VST_HIST (
                                  SITE_CD ASC,
                                  MENU_CD ASC,
                                  LANG_SE ASC,
                                  SN ASC
        );

ALTER TABLE INS_APP.CMS_SITE_VST_HIST
    ADD
        CONSTRAINT PK_CMS_SITE_VST_HIST
            PRIMARY KEY (
                         SITE_CD,
                         MENU_CD,
                         LANG_SE,
                         SN
                );

CREATE TABLE INS_APP.CMS_BNR_GRP (
                                     BNR_GRP_ID VARCHAR(100) NOT NULL,
                                     SITE_CD VARCHAR2(20) NOT NULL

);

COMMENT ON TABLE INS_APP.CMS_BNR_GRP IS '[03.사이트]05.배너 그룹';

COMMENT ON COLUMN INS_APP.CMS_BNR_GRP.BNR_GRP_ID IS '배너 그룹 아이디';

COMMENT ON COLUMN INS_APP.CMS_BNR_GRP.SITE_CD IS '사이트 코드';


CREATE UNIQUE INDEX INS_APP.PK_CMS_BNR_GRP
    ON INS_APP.CMS_BNR_GRP (
                            BNR_GRP_ID ASC,
                            SITE_CD ASC
        );

ALTER TABLE INS_APP.CMS_BNR_GRP
    ADD
        CONSTRAINT PK_CMS_BNR_GRP
            PRIMARY KEY (
                         BNR_GRP_ID,
                         SITE_CD
                );

CREATE TABLE INS_APP.CMS_BNR (
                                 BNR_ID VARCHAR(100) NOT NULL,
                                 BNR_GRP_ID VARCHAR(100) NOT NULL,
                                 SITE_CD VARCHAR2(20) NOT NULL,
                                 BNR_NM VARCHAR(100),
                                 BNR_DESC VARCHAR(4000),
                                 BNR_FILE_NM VARCHAR(300),
                                 BNR_FILE_PATH VARCHAR(400),
                                 PUB_ST_DAY VARCHAR(8),
                                 PUB_ST_HR VARCHAR(4),
                                 PUB_END_DAY VARCHAR(8),
                                 PUB_END_HR VARCHAR(4),
                                 USE_YN VARCHAR(1),
                                 BNR_SE VARCHAR(20),
                                 BNR_SZ_SE VARCHAR(20),
                                 BNR_URL VARCHAR(1000),
                                 DEL_YN VARCHAR(1),
                                 RMK BLOB,
                                 CRT_AT DATE NOT NULL,
                                 CRT_BY VARCHAR(100) NOT NULL,
                                 CRT_IP VARCHAR(40) NOT NULL,
                                 CRT_PGM VARCHAR(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR(100) NOT NULL,
                                 UPD_IP VARCHAR(40) NOT NULL,
                                 UPD_PGM VARCHAR(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_BNR IS '[03.사이트]06.베너';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_ID IS '배너 아이디';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_GRP_ID IS '배너 그룹 아이디';

COMMENT ON COLUMN INS_APP.CMS_BNR.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_NM IS '배너 명';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_DESC IS '배너 내용';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_FILE_NM IS '배너 파일 명';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_FILE_PATH IS '배너 파일 경로';

COMMENT ON COLUMN INS_APP.CMS_BNR.PUB_ST_DAY IS '게시 시작 일';

COMMENT ON COLUMN INS_APP.CMS_BNR.PUB_ST_HR IS '게시 시작 시간';

COMMENT ON COLUMN INS_APP.CMS_BNR.PUB_END_DAY IS '게시 종료 일';

COMMENT ON COLUMN INS_APP.CMS_BNR.PUB_END_HR IS '게시 종료 시간';

COMMENT ON COLUMN INS_APP.CMS_BNR.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_SE IS '_self';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_SZ_SE IS '배너 크기 구분';

COMMENT ON COLUMN INS_APP.CMS_BNR.BNR_URL IS '배너 URL';

COMMENT ON COLUMN INS_APP.CMS_BNR.DEL_YN IS '삭제 여부';

COMMENT ON COLUMN INS_APP.CMS_BNR.RMK IS '비고';

COMMENT ON COLUMN INS_APP.CMS_BNR.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_BNR.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_BNR.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_BNR.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_BNR.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_BNR.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_BNR.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_BNR.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_BNR
    ON INS_APP.CMS_BNR (
                        BNR_ID ASC,
                        BNR_GRP_ID ASC,
                        SITE_CD ASC
        );

ALTER TABLE INS_APP.CMS_BNR
    ADD
        CONSTRAINT PK_CMS_BNR
            PRIMARY KEY (
                         BNR_ID,
                         BNR_GRP_ID,
                         SITE_CD
                );

CREATE TABLE INS_APP.CMS_CTT (
                                 SITE_CD VARCHAR2(20) NOT NULL,
                                 CTT_ID VARCHAR2(100) NOT NULL,
                                 CTT_NM VARCHAR2(100),
                                 CTT_DESC VARCHAR2(4000),
                                 USE_YN VARCHAR2(1),
                                 PUB_YN VARCHAR2(1),
                                 CTT_RMK VARCHAR2(4000),
                                 CRT_BY VARCHAR2(100) NOT NULL,
                                 CRT_IP VARCHAR2(40) NOT NULL,
                                 CRT_PGM VARCHAR2(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR2(100) NOT NULL,
                                 UPD_IP VARCHAR2(40) NOT NULL,
                                 UPD_PGM VARCHAR2(100) NOT NULL,
                                 CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_CTT IS '[03.사이트]07.컨텐츠 - puck editor 사용';

COMMENT ON COLUMN INS_APP.CMS_CTT.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_CTT.CTT_ID IS '컨텐츠 아이디';

COMMENT ON COLUMN INS_APP.CMS_CTT.CTT_NM IS '컨텐츠 명';

COMMENT ON COLUMN INS_APP.CMS_CTT.CTT_DESC IS '컨텐츠 내용';

COMMENT ON COLUMN INS_APP.CMS_CTT.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_CTT.PUB_YN IS '중간저장 등의 이슈가 있을 수 있음.';

COMMENT ON COLUMN INS_APP.CMS_CTT.CTT_RMK IS '컨텐츠 비고';

COMMENT ON COLUMN INS_APP.CMS_CTT.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_CTT.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_CTT.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_CTT.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_CTT.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_CTT.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_CTT.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_CTT.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_CTT
    ON INS_APP.CMS_CTT (
                        SITE_CD ASC,
                        CTT_ID ASC
        );

ALTER TABLE INS_APP.CMS_CTT
    ADD
        CONSTRAINT PK_CMS_CTT
            PRIMARY KEY (
                         SITE_CD,
                         CTT_ID
                );

CREATE TABLE INS_APP.CMS_CTT_SEO (
                                     SN NUMBER(15) NOT NULL,
                                     SITE_CD VARCHAR2(20) NOT NULL,
                                     CTT_ID VARCHAR2(100) NOT NULL,
                                     META_TTL VARCHAR2(300),
                                     META_DESC VARCHAR2(4000),
                                     CRT_IP VARCHAR2(40) NOT NULL,
                                     CRT_PGM VARCHAR2(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR2(100) NOT NULL,
                                     UPD_IP VARCHAR2(40) NOT NULL,
                                     UPD_PGM VARCHAR2(100) NOT NULL,
                                     CRT_AT DATE NOT NULL,
                                     CRT_BY VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_CTT_SEO IS '[03.사이트]08.컨텐츠 SEO';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.SN IS '일련번호';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.CTT_ID IS '컨텐츠 아이디';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.META_TTL IS '메타 제목';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.META_DESC IS '메타 설명';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_CTT_SEO.CRT_BY IS '등록자';

CREATE UNIQUE INDEX INS_APP.PK_CMS_CTT_SEO
    ON INS_APP.CMS_CTT_SEO (
                            SN ASC,
                            SITE_CD ASC,
                            CTT_ID ASC
        );

ALTER TABLE INS_APP.CMS_CTT_SEO
    ADD
        CONSTRAINT PK_CMS_CTT_SEO
            PRIMARY KEY (
                         SN,
                         SITE_CD,
                         CTT_ID
                );

CREATE TABLE INS_APP.CMS_POP (
                                 SITE_CD VARCHAR2(20) NOT NULL,
                                 POP_GRP_ID VARCHAR2(100) NOT NULL,
                                 POP_ID VARCHAR2(100) NOT NULL,
                                 POP_NM VARCHAR2(100),
                                 POP_TTL VARCHAR2(300),
                                 POP_DESC VARCHAR2(4000),
                                 PUB_ST_DAY VARCHAR2(8),
                                 PUB_END_DAY VARCHAR2(8),
                                 PUB_ST_HR VARCHAR2(4),
                                 PUB_END_HR VARCHAR2(4),
                                 POP_PUB_SE VARCHAR2(20),
                                 PUB_YN VARCHAR2(1),
                                 RMK VARCHAR2(4000),
                                 ADD_URL VARCHAR2(1000),
                                 URL_TGT_SE VARCHAR2(20),
                                 POP_W NUMBER(10,4),
                                 W_PSTN NUMBER(10,4),
                                 POP_H NUMBER(10,4),
                                 H_PSTN NUMBER(10,4),
                                 CRT_IP VARCHAR2(40) NOT NULL,
                                 CRT_PGM VARCHAR2(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR2(100) NOT NULL,
                                 UPD_IP VARCHAR2(40) NOT NULL,
                                 UPD_PGM VARCHAR2(100) NOT NULL,
                                 CRT_AT DATE NOT NULL,
                                 CRT_BY VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_POP IS '[03.사이트]09.팝업';

COMMENT ON COLUMN INS_APP.CMS_POP.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_GRP_ID IS '팝업 그룹 아이디';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_ID IS '팝업 아이디';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_NM IS '팝업 명';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_TTL IS '팝업 제목';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_DESC IS '팝업 내용';

COMMENT ON COLUMN INS_APP.CMS_POP.PUB_ST_DAY IS '게시 시작 일';

COMMENT ON COLUMN INS_APP.CMS_POP.PUB_END_DAY IS '게시 종료 일';

COMMENT ON COLUMN INS_APP.CMS_POP.PUB_ST_HR IS '게시 시작 시간';

COMMENT ON COLUMN INS_APP.CMS_POP.PUB_END_HR IS '게시 종료 시간';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_PUB_SE IS '오늘 하루동안 그만보기';

COMMENT ON COLUMN INS_APP.CMS_POP.PUB_YN IS '게시 여부';

COMMENT ON COLUMN INS_APP.CMS_POP.RMK IS '비고';

COMMENT ON COLUMN INS_APP.CMS_POP.ADD_URL IS '추가 URL';

COMMENT ON COLUMN INS_APP.CMS_POP.URL_TGT_SE IS '_self, _blank';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_W IS '팝업 가로';

COMMENT ON COLUMN INS_APP.CMS_POP.W_PSTN IS '가로 위치';

COMMENT ON COLUMN INS_APP.CMS_POP.POP_H IS '팝업 세로';

COMMENT ON COLUMN INS_APP.CMS_POP.H_PSTN IS '세로 위치';

COMMENT ON COLUMN INS_APP.CMS_POP.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_POP.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_POP.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_POP.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_POP.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_POP.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_POP.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_POP.CRT_BY IS '등록자';

CREATE UNIQUE INDEX INS_APP.PK_CMS_POP
    ON INS_APP.CMS_POP (
                        SITE_CD ASC,
                        POP_GRP_ID ASC,
                        POP_ID ASC
        );

ALTER TABLE INS_APP.CMS_POP
    ADD
        CONSTRAINT PK_CMS_POP
            PRIMARY KEY (
                         SITE_CD,
                         POP_GRP_ID,
                         POP_ID
                );

CREATE TABLE INS_APP.CMS_POP_GRP (
                                     SITE_CD VARCHAR2(20) NOT NULL,
                                     POP_GRP_ID VARCHAR2(100) NOT NULL,
                                     POP_GRP_NM VARCHAR2(100),
                                     USE_YN VARCHAR2(1),
                                     POP_GRP_ORD NUMBER(10),
                                     CRT_IP VARCHAR2(40) NOT NULL,
                                     CRT_PGM VARCHAR2(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR2(100) NOT NULL,
                                     UPD_IP VARCHAR2(40) NOT NULL,
                                     UPD_PGM VARCHAR2(100) NOT NULL,
                                     CRT_AT DATE NOT NULL,
                                     CRT_BY VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_POP_GRP IS '[03.사이트]10.팝업 그룹';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.POP_GRP_ID IS '팝업 그룹 아이디';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.POP_GRP_NM IS '팝업 그룹 명';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.POP_GRP_ORD IS '팝업 그룹 순서';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_POP_GRP.CRT_BY IS '등록자';

CREATE UNIQUE INDEX INS_APP.PK_CMS_POP_GRP
    ON INS_APP.CMS_POP_GRP (
                            SITE_CD ASC,
                            POP_GRP_ID ASC
        );

ALTER TABLE INS_APP.CMS_POP_GRP
    ADD
        CONSTRAINT PK_CMS_POP_GRP
            PRIMARY KEY (
                         SITE_CD,
                         POP_GRP_ID
                );

CREATE TABLE INS_APP.CMS_BRD (
                                 SITE_CD VARCHAR2(20) NOT NULL,
                                 BRD_ID VARCHAR2(100) NOT NULL,
                                 BRD_SE VARCHAR2(20) NOT NULL,
                                 BRD_NM VARCHAR2(100),
                                 BRD_DESC VARCHAR2(4000),
                                 ORD NUMBER(10),
                                 USE_YN VARCHAR2(1),
                                 LGN_USER_USE_YN VARCHAR2(1),
                                 WRTR_PSN_QRY_YN VARCHAR2(1),
                                 PWD_USE_YN VARCHAR2(1),
                                 FILE_USE_YN VARCHAR2(1),
                                 CMT_USE_YN VARCHAR2(1),
                                 CRT_AT DATE NOT NULL,
                                 CRT_BY VARCHAR2(100) NOT NULL,
                                 CRT_IP VARCHAR2(40) NOT NULL,
                                 CRT_PGM VARCHAR2(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR2(100) NOT NULL,
                                 UPD_IP VARCHAR2(40) NOT NULL,
                                 UPD_PGM VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_BRD IS '[04.게시판]01.게시판';

COMMENT ON COLUMN INS_APP.CMS_BRD.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_BRD.BRD_ID IS '게시판 아이디';

COMMENT ON COLUMN INS_APP.CMS_BRD.BRD_SE IS '공통 코드';

COMMENT ON COLUMN INS_APP.CMS_BRD.BRD_NM IS '게시판 명';

COMMENT ON COLUMN INS_APP.CMS_BRD.BRD_DESC IS '게시판 내용';

COMMENT ON COLUMN INS_APP.CMS_BRD.ORD IS '순서';

COMMENT ON COLUMN INS_APP.CMS_BRD.USE_YN IS '사용여부';

COMMENT ON COLUMN INS_APP.CMS_BRD.LGN_USER_USE_YN IS '로그인 한 사람만 사용 가능';

COMMENT ON COLUMN INS_APP.CMS_BRD.WRTR_PSN_QRY_YN IS '비밀글';

COMMENT ON COLUMN INS_APP.CMS_BRD.PWD_USE_YN IS '비밀글의 경우';

COMMENT ON COLUMN INS_APP.CMS_BRD.FILE_USE_YN IS '파일 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_BRD.CMT_USE_YN IS '댓글 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_BRD.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_BRD.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_BRD.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_BRD.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_BRD.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_BRD.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_BRD.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_BRD.UPD_PGM IS '수정프로그램';

CREATE UNIQUE INDEX INS_APP.PK_CMS_BRD
    ON INS_APP.CMS_BRD (
                        SITE_CD ASC,
                        BRD_ID ASC,
                        BRD_SE ASC
        );

ALTER TABLE INS_APP.CMS_BRD
    ADD
        CONSTRAINT PK_CMS_BRD
            PRIMARY KEY (
                         SITE_CD,
                         BRD_ID,
                         BRD_SE
                );

CREATE TABLE INS_APP.CMS_BRD_AUTH (
                                      BRD_ID VARCHAR2(100) NOT NULL,
                                      BRD_SE VARCHAR2(20) NOT NULL,
                                      SITE_CD VARCHAR2(20) NOT NULL,
                                      WRT_AUTH_CD VARCHAR2(20),
                                      QRY_AUTH_CD VARCHAR2(20),
                                      CMT_AUTH_CD VARCHAR2(20),
                                      CRT_BY VARCHAR2(100) NOT NULL,
                                      CRT_IP VARCHAR2(40) NOT NULL,
                                      CRT_PGM VARCHAR2(100) NOT NULL,
                                      UPD_AT DATE NOT NULL,
                                      UPD_BY VARCHAR2(100) NOT NULL,
                                      UPD_IP VARCHAR2(40) NOT NULL,
                                      UPD_PGM VARCHAR2(100) NOT NULL,
                                      CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_BRD_AUTH IS '[04.게시판]02.게시판 권한';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.BRD_ID IS '게시판 아이디';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.BRD_SE IS '게시판 구분';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.WRT_AUTH_CD IS 'AUTH_CD';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.QRY_AUTH_CD IS 'AUTH_CD';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.CMT_AUTH_CD IS 'AUTH_CD';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_BRD_AUTH.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_BRD_AUTH
    ON INS_APP.CMS_BRD_AUTH (
                             BRD_ID ASC,
                             BRD_SE ASC,
                             SITE_CD ASC
        );

ALTER TABLE INS_APP.CMS_BRD_AUTH
    ADD
        CONSTRAINT PK_CMS_BRD_AUTH
            PRIMARY KEY (
                         BRD_ID,
                         BRD_SE,
                         SITE_CD
                );

CREATE TABLE INS_APP.CMS_PST (
                                 SITE_CD VARCHAR2(20) NOT NULL,
                                 BRD_ID VARCHAR2(100) NOT NULL,
                                 BRD_SE VARCHAR2(20) NOT NULL,
                                 PST_SN NUMBER(15) NOT NULL,
                                 PST_ID VARCHAR2(100),
                                 CTG_SE VARCHAR2(20),
                                 PST_SE VARCHAR2(20),
                                 PST_STS_SE VARCHAR2(20),
                                 PST_TTL VARCHAR2(300),
                                 PST_DESC VARCHAR2(4000),
                                 USE_YN VARCHAR2(1),
                                 DEL_YN VARCHAR2(1),
                                 PST_DEL_SE VARCHAR2(20),
                                 QRY_CNT NUMBER(10),
                                 PST_RMK VARCHAR2(4000),
                                 PST_ORD NUMBER(10),
                                 NTC_YN VARCHAR2(1),
                                 PUB_ST_YMD VARCHAR2(8),
                                 PUB_END_YMD VARCHAR2(8),
                                 PWD_USE_YN VARCHAR2(1),
                                 AFILE_ID VARCHAR2(100),
                                 PWD VARCHAR(100),
                                 CRT_BY VARCHAR2(100) NOT NULL,
                                 CRT_IP VARCHAR2(40) NOT NULL,
                                 CRT_PGM VARCHAR2(100) NOT NULL,
                                 UPD_AT DATE NOT NULL,
                                 UPD_BY VARCHAR2(100) NOT NULL,
                                 UPD_IP VARCHAR2(40) NOT NULL,
                                 UPD_PGM VARCHAR2(100) NOT NULL,
                                 CRT_AT DATE NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PST IS '[04.게시판]03.게시글';

COMMENT ON COLUMN INS_APP.CMS_PST.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_PST.BRD_ID IS '게시판 아이디';

COMMENT ON COLUMN INS_APP.CMS_PST.BRD_SE IS '게시판 구분';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_SN IS '게시글 순번';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_ID IS '게시글 아이디';

COMMENT ON COLUMN INS_APP.CMS_PST.CTG_SE IS '공통 코드로 관리';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_SE IS '문의/답글(Q&A)/일반글';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_STS_SE IS '관리자에 의해 삭제된 게시글입니다.';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_TTL IS '게시글 제목';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_DESC IS '게시글 내용';

COMMENT ON COLUMN INS_APP.CMS_PST.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_PST.DEL_YN IS '삭제 여부';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_DEL_SE IS '관리자삭제, 작성자삭제';

COMMENT ON COLUMN INS_APP.CMS_PST.QRY_CNT IS '조회 수';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_RMK IS '게시글 비고';

COMMENT ON COLUMN INS_APP.CMS_PST.PST_ORD IS '게시글 순서';

COMMENT ON COLUMN INS_APP.CMS_PST.NTC_YN IS '최상단에 고정';

COMMENT ON COLUMN INS_APP.CMS_PST.PUB_ST_YMD IS '게시 시작 일자';

COMMENT ON COLUMN INS_APP.CMS_PST.PUB_END_YMD IS '게시 종료 일자';

COMMENT ON COLUMN INS_APP.CMS_PST.PWD_USE_YN IS '비밀글';

COMMENT ON COLUMN INS_APP.CMS_PST.AFILE_ID IS '첨부파일 아이디';

COMMENT ON COLUMN INS_APP.CMS_PST.PWD IS '비밀글의 경우';

COMMENT ON COLUMN INS_APP.CMS_PST.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PST.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PST.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_PST.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_PST.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_PST.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_PST.UPD_PGM IS '수정프로그램';

COMMENT ON COLUMN INS_APP.CMS_PST.CRT_AT IS '등록일시';

CREATE UNIQUE INDEX INS_APP.PK_CMS_PST
    ON INS_APP.CMS_PST (
                        SITE_CD ASC,
                        BRD_ID ASC,
                        BRD_SE ASC,
                        PST_SN ASC
        );

ALTER TABLE INS_APP.CMS_PST
    ADD
        CONSTRAINT PK_CMS_PST
            PRIMARY KEY (
                         SITE_CD,
                         BRD_ID,
                         BRD_SE,
                         PST_SN
                );

CREATE TABLE INS_APP.CMS_PST_CMT (
                                     SITE_CD VARCHAR2(20) NOT NULL,
                                     BRD_ID VARCHAR2(100) NOT NULL,
                                     BRD_SE VARCHAR2(20) NOT NULL,
                                     PST_SN NUMBER(15) NOT NULL,
                                     CMT_TTL VARCHAR(300),
                                     CMT_DESC VARCHAR(4000),
                                     PWD_USE_YN VARCHAR(1),
                                     CMT_PWD VARCHAR(500),
                                     USE_YN VARCHAR(1),
                                     DEL_YN VARCHAR(1),
                                     CMT_DEL_SE VARCHAR(20),
                                     CRT_AT DATE NOT NULL,
                                     CRT_BY VARCHAR(100) NOT NULL,
                                     CRT_IP VARCHAR(40) NOT NULL,
                                     CRT_PGM VARCHAR(100) NOT NULL,
                                     UPD_AT DATE NOT NULL,
                                     UPD_BY VARCHAR(100) NOT NULL,
                                     UPD_IP VARCHAR(40) NOT NULL,
                                     UPD_PGM VARCHAR(100) NOT NULL
);

COMMENT ON TABLE INS_APP.CMS_PST_CMT IS '[04.게시판]04.게시물 댓글';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.SITE_CD IS '사이트 코드';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.BRD_ID IS '게시판 아이디';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.BRD_SE IS '게시판 구분';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.PST_SN IS '게시글 순번';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CMT_TTL IS '댓글 제목';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CMT_DESC IS '댓글 내용';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.PWD_USE_YN IS '비밀번호 사용 여부';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CMT_PWD IS '댓글 비밀번호';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.USE_YN IS '사용 여부';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.DEL_YN IS '삭제 여부';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CMT_DEL_SE IS '관리자/본인삭제';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CRT_AT IS '등록일시';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CRT_BY IS '등록자';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CRT_IP IS '등록자IP';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.CRT_PGM IS '등록프로그램';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.UPD_AT IS '수정일시';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.UPD_BY IS '수정자';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.UPD_IP IS '수정자IP';

COMMENT ON COLUMN INS_APP.CMS_PST_CMT.UPD_PGM IS '수정프로그램';

ALTER TABLE INS_APP.CMS_COM_DEPT
    ADD
        CONSTRAINT FK_CMS_COM_ORG_TO_CMS_COM_DEPT
            FOREIGN KEY (
                         ORG_CD
                )
                REFERENCES INS_APP.CMS_COM_ORG (
                                                ORG_CD
                    );

-- Foreign Key Constraints - Optimized Version
-- Identifier length: Maximum 30 characters (Oracle compatible)

ALTER TABLE INS_APP.CMS_COM_AUTH_MENU
    ADD CONSTRAINT FK_CMS_AUTH_TO_AUTH_MENU
        FOREIGN KEY (AUTH_CD)
            REFERENCES INS_APP.CMS_COM_AUTH (AUTH_CD);

ALTER TABLE INS_APP.CMS_COM_AUTH_MENU
    ADD CONSTRAINT FK_CMS_MENU_TO_AUTH_MENU
        FOREIGN KEY (MENU_CD)
            REFERENCES INS_APP.CMS_COM_MENU (MENU_CD);

ALTER TABLE INS_APP.CMS_FILE
    ADD CONSTRAINT FK_CMS_FILE_GRP_TO_FILE
        FOREIGN KEY (AFILE_ID)
            REFERENCES INS_APP.CMS_FILE_GRP (AFILE_ID);

ALTER TABLE INS_APP.CMS_SITE_IP
    ADD CONSTRAINT FK_CMS_SITE_TO_SITE_IP
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_SITE_MENU
    ADD CONSTRAINT FK_CMS_SITE_TO_SITE_MENU
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_SITE_VST_HIST
    ADD CONSTRAINT FK_SITE_MENU_TO_VST_HIST
        FOREIGN KEY (SITE_CD, MENU_CD, LANG_SE)
            REFERENCES INS_APP.CMS_SITE_MENU (SITE_CD, MENU_CD, LANG_SE);

ALTER TABLE INS_APP.CMS_BNR_GRP
    ADD CONSTRAINT FK_CMS_SITE_TO_BNR_GRP
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_BNR
    ADD CONSTRAINT FK_BNR_GRP_TO_BNR
        FOREIGN KEY (BNR_GRP_ID, SITE_CD)
            REFERENCES INS_APP.CMS_BNR_GRP (BNR_GRP_ID, SITE_CD);

ALTER TABLE INS_APP.CMS_CTT
    ADD CONSTRAINT FK_CMS_SITE_TO_CTT
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_CTT_SEO
    ADD CONSTRAINT FK_CMS_CTT_TO_CTT_SEO
        FOREIGN KEY (SITE_CD, CTT_ID)
            REFERENCES INS_APP.CMS_CTT (SITE_CD, CTT_ID);

ALTER TABLE INS_APP.CMS_POP
    ADD CONSTRAINT FK_POP_GRP_TO_POP
        FOREIGN KEY (SITE_CD, POP_GRP_ID)
            REFERENCES INS_APP.CMS_POP_GRP (SITE_CD, POP_GRP_ID);

ALTER TABLE INS_APP.CMS_POP_GRP
    ADD CONSTRAINT FK_CMS_SITE_TO_POP_GRP
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_BRD
    ADD CONSTRAINT FK_CMS_SITE_TO_BRD
        FOREIGN KEY (SITE_CD)
            REFERENCES INS_APP.CMS_SITE (SITE_CD);

ALTER TABLE INS_APP.CMS_BRD_AUTH
    ADD CONSTRAINT FK_CMS_BRD_TO_BRD_AUTH
        FOREIGN KEY (SITE_CD, BRD_ID, BRD_SE)
            REFERENCES INS_APP.CMS_BRD (SITE_CD, BRD_ID, BRD_SE);

ALTER TABLE INS_APP.CMS_PST
    ADD CONSTRAINT FK_CMS_BRD_TO_PST
        FOREIGN KEY (SITE_CD, BRD_ID, BRD_SE)
            REFERENCES INS_APP.CMS_BRD (SITE_CD, BRD_ID, BRD_SE);

ALTER TABLE INS_APP.CMS_PST_CMT
    ADD CONSTRAINT FK_CMS_PST_TO_PST_CMT
        FOREIGN KEY (SITE_CD, BRD_ID, BRD_SE, PST_SN)
            REFERENCES INS_APP.CMS_PST (SITE_CD, BRD_ID, BRD_SE, PST_SN);