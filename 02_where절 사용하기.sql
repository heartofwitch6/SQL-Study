-- where 절

SELECT * FROM EMPLOYEES WHERE SALARY > 14000;

SELECT * FROM EMPLOYEES WHERE last_name = 'King';

SELECT * FROM EMPLOYEES WHERE hire_date < '2002/06/10';

-- 예제 1
SELECT * FROM EMPLOYEES WHERE employee_id = 100;

-- 예제 2
SELECT * FROM EMPLOYEES WHERE first_name = 'David';

-- 예제 3
SELECT * FROM EMPLOYEES WHERE employee_id <= 105;

-- 예제 4
SELECT * FROM JOB_HISTORY WHERE start_date > '2006/03/03';

-- 예제 5
SELECT * FROM DEPARTMENTS WHERE location_id != 1700;

-- 논리 연산자 and or not

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
OR (DEPARTMENT_ID = 80
AND SALARY > 10000);

SELECT * 
FROM employees
WHERE NOT (hire_date > '2004/01/01' OR salary > 5000);

-- 예제 1
SELECT *
FROM employees
WHERE salary > 4000 AND job_id = 'IT_PROG';

-- 예제 2
SELECT *
FROM employees
WHERE salary >4000
AND (job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN 연산자
SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

-- 예제 1
SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

-- 예제 2
SELECT *
FROM employees
WHERE department_ID NOT IN (30, 50, 80, 100, 110);

-- between 사이값
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

-- 예제 1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

-- 예제 2
SELECT *
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';

-- 예제 3
SELECT *
FROM employees
WHERE salary < 7000 OR salary > 17000;

-- LIKE 연산자
SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT *
FROM employees
WHERE last_name LIKE '%b%';

SELECT *
FROM employees
WHERE last_name LIKE '____y';

-- 예제 1
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

-- 예제 2
SELECT *
FROM employees
WHERE job_id LIKE 'AD___';

-- 예제 3
SELECT *
FROM employees
WHERE phone_number LIKE '________1234';

-- 예제 4
SELECT *
FROM employees
WHERE phone_number NOT LIKE('%3%')
AND phone_number LIKE '___________9';

-- 예제 5
SELECT *
FROM employees
WHERE job_id LIKE ('%MGR%') OR job_id LIKE ('%ASST%');

-- IS NULL
SELECT commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- 예제
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY 정령
SELECT *
FROM employees
ORDER BY EMPLOYEE_ID DESC;

SELECT *
FROM employees
ORDER BY EMPLOYEE_ID ASC;

SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC;

-- 예제 1
SELECT department_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

-- 예제 2
SELECT *
FROM employees
WHERE job_id LIKE ('%CLERK%')
ORDER BY salary ASC;

-- 예제 3
SELECT employee_id AS 직원번호, first_name AS 직원이름, department_id AS 부서번호, salary AS 월급
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY 부서번호 DESC, 월급 DESC;