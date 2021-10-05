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

-- 날짜형 함수
SELECT SYSDATE 현재날짜, ROUND(sysdate, 'DD') 일,
ROUND(sysdate, 'MM') 월, ROUND(sysdate, 'YYYY') 년,
ROUND(MONTHS_BETWEEN('2021/10/05', '2021/06/10'), 1) 월차이
FROM DUAL;

SELECT hire_date FROM employees;

SELECT SYSDATE 오늘, SYSDATE+1 내일, SYSDATE-1 어제
FROM DUAL;

-- 예제 1
SELECT sysdate, hire_date, sysdate-hire_date 적용결과
FROM employees
WHERE department_id = 100;

-- 예제 2
SELECT hire_date, ADD_MONTHS(hire_date, 3) 더하기_3개월,
ADD_MONTHS(hire_date, -3) 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
SELECT TO_CHAR(12345678, '999,999,999') 콤마형식,
TO_CHAR(12345678.678, '999,999,999.99') 콤마소수점형식,
TO_CHAR(12345678, '$999,999,999') 달러형식,
TO_CHAR(12345678, 'L999,999,999') 로컬통화
FROM DUAL;

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD') 날짜표시,
TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') 시간표시
FROM DUAL;

-- 예제 1
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') 입사월
FROM employees
WHERE department_id = 100;

-- 예제 2
SELECT last_name 이름, TO_CHAR(salary, '$999,999.99') 월급
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- 문자열 날짜 변환
SELECT TO_DATE('2021~01$01', 'YYYY~MM$DD')
FROM DUAL;

SELECT TO_NUMBER('0123')+100
FROM DUAL;

-- NULL값
SELECT last_name, NVL(manager_id, 0)
FROM employees
WHERE last_name = 'King';

SELECT last_name, NVL2(manager_id, 1, 0)
FROM employees
WHERE last_name = 'King';

-- 예제 1
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션,
(salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉
FROM employees
ORDER BY 연봉 DESC;

--예제 2
SELECT last_name 이름, salary 월급, NVL(commission_pct, 0) 커미션,
(salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉,
NVL2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산
FROM employees
ORDER BY 연봉 DESC;

-- DECODE 함수
SELECT last_name 이름, job_id, salary,
DECODE(job_id, 'IT_PROG', salary*1.10, 'ST_CLERK', salary*1.15, 'SA_REP', salary*1.2, salary) 수정월급
FROM employees;

-- 예제
SELECT last_name 이름, job_id 직무, salary 월급,
DECODE(TRUNC(salary/2000), 0, 0, 1, 0.09, 2, 0.2, 3, 0.3, 4, 0.4, 5, 0.42, 6, 0.44, 0.45) 세율
FROM employees;

-- CASE 함수
SELECT last_name 이름, job_id, salary,
CASE WHEN salary<5000 THEN 'LOW'
WHEN salary<10000 THEN 'MEDIUM'
WHEN salary<20000 THEN 'GOOD'
ELSE 'EXCELLENT'
END "급여 수준"
FROM employees;

-- 예제
SELECT employee_id, first_name, last_name, salary,
CASE WHEN salary>=9000 THEN '상위급여'
WHEN salary>=6000 THEN '중위급여'
ELSE '하위급여'
END "급여등급"
FROM employees
WHERE job_id = 'IT_PROG';