-- 시퀀스
CREATE SEQUENCE 시퀀스1;

DROP SEQUENCE 시퀀스1;

SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스1';

SELECT 시퀀스1.NEXTVAL FROM DUAL;

CREATE TABLE 부서_테스트 (
부서번호 NUMBER PRIMARY KEY,
부서이름 VARCHAR2(100)
);

INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '영업부');
INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '개발부');

SELECT * FROM 부서_테스트;

SELECT (시퀀스1.CURRVAL)+1 다음값 FROM DUAL;

-- 시퀀스 옵션
DROP SEQUENCE 시퀀스2;
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 20;

SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스2';

INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '마케팅부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '교육부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '경영부');

SELECT * FROM 부서_테스트;

UPDATE 부서_테스트 SET 부서번호 = 시퀀스2.NEXTVAL;

ALTER SEQUENCE 시퀀스2
INCREMENT BY 2;