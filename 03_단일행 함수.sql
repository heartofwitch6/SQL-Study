-- 단일행 함수

-- 문자 함수
SELECT UPPER('SQL Course'), LOWER('SQL Course'),
INITCAP('SQL Course') FROM DUAL;

-- 문자 조작 함수
SELECT SUBSTR ('ABCDEFG', 3, 4), LENGTH('ABCDEFG'), 
INSTR('ABCDEFG', 'D') FROM DUAL;

SELECT TRIM(' 헬로우 ') FROM DUAL;

-- 예제 1
SELECT department_id, last_name
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- 예제 2
SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

-- 예제 3
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- 문자열 치환
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') AS 적용결과
FROM employees;

-- 예제 1
SELECT last_name AS 이름, LOWER(last_name) AS LOWER적용,
UPPER(last_name) AS UPPER적용, email AS 이메일, INITCAP(email) AS INITCAP적용
FROM employees;

-- 예제 2
SELECT job_id AS 직업명, SUBSTR(job_id, 1, 2) AS 앞의2개
FROM employees;

-- 숫자형 함수
SELECT ROUND (15.193), ROUND (15.193, 0), ROUND (15.193, 1), ROUND (15.193, 2)
FROM dual;

SELECT employee_id AS 짝수번째, last_name
FROM employees
WHERE MOD (employee_id, 2) = 0
ORDER BY employee_id;