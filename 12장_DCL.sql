-- DCL

-- 테이블스페이스 생성
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;

-- 새 유저 생성
CREATE USER john IDENTIFIED BY 1234 DEFAULT TABLESPACE johnSpace;

-- 권한 부여
GRANT CREATE SESSION TO john;

GRANT CREATE TABLE TO john;

GRANT CONNECT, RESOURCE TO john;

-- 권한 제거
REVOKE CREATE TABLE, RESOURCE FROM john;

REVOKE CONNECT FROM john;

-- 계정 삭제
DROP USER john CASCADE;

DROP TABLESPACE johnSpace;

-- 계정 비밀번호 변경
ALTER USER scott IDENTIFIED BY "1234";

-- 포트번호 확인
SELECT dbms_xdb.gethttpport() FROM DUAL;

-- 포트번호 변경
EXEC dbms_xdb.sethttpport(9090);
COMMIT;