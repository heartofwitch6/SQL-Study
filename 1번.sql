SELECT * FROM DEPARTMENTS;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

SELECT employee_id, first_name, last_name FROM EMPLOYEES;

SELECT department_id AS 부서번호, department_name 부서이름 FROM DEPARTMENTS;

SELECT first_name 이름, job_id 직책, salary 월급 FROM EMPLOYEES;

SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정 FROM EMPLOYEES;

SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정 FROM EMPLOYEES;

SELECT last_name, first_name, job_id, salary, (salary-1000)*0.05 AS 보너스
FROM employees;

SELECT DISTINCT job_id FROM employees;

-- 예제 1
SELECT employee_id, first_name, last_name FROM employees;

-- 예제 2
SELECT first_name, salary, salary*1.1 AS 뉴셀러리 FROM employees;

-- 예제 3
SELECT employee_id AS 사원번호, first_name AS 이름,
last_name AS 성 FROM employees;

SELECT last_name || ' is a ' || job_id AS 직업정보 FROM employees;

--예제 4
SELECT EMPLOYEE_ID, first_name || ' ' || last_name AS NAME,
email || '@company.com' AS EMAIL FROM employees;

DESC EMPLOYEES;
DESC DEPARTMENTS;