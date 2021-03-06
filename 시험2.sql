DROP TABLE EMP_DDL;

CREATE TABLE EMP_DDL (
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9), MGR NUMBER(4),
HIREDATE DATE, SAL NUMBER(7,2),
COMM NUMBER(7,2), DEPTNO NUMBER(2)
);

DESC EMP_DDL;

RENAME EMP_DDL TO EMP_ALTER;

SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);

ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

ALTER TABLE EMP_ALTER DROP COLUMN TEL;

DROP TABLE EMP_ALTER;

CREATE INDEX IDX_EMP_SAL
ON EMP (SAL);

SELECT *
FROM DICT
WHERE TABLE_NAME = 'USER_IND_COLUMNS';

DROP INDEX IDX_EMP_SAL;