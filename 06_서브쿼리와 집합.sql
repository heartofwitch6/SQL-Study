-- 서브쿼리

SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Popp');

-- 그룹함수 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 예제 1
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

-- 예제 2
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull')
AND department_id =  (SELECT department_id FROM employees WHERE last_name = 'Bull');

-- 예제 3
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees WHERE last_name = 'Russell');

-- 예제 4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title = 'Stock Manager');

-- 다중행 서브쿼리
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANL, ALL
SELECT department_id, last_name, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- 예제 1
SELECT employee_id, first_name, job_id 직종, salary 급여
FROM employees
WHERE department_id != 20
AND manager_id IN (SELECT manager_id FROM employees WHERE department_id = 20);

-- 예제 2
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'ST_MAN')
ORDER BY salary ASC;

-- 예제 3
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
ORDER BY salary DESC;

-- 다중열 서브쿼리
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id)
IN (SELECT manager_id, job_id FROM employees WHERE first_name = 'Bruce')
AND first_name != 'Bruce';

-- 예제
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, min(salary) FROM employees GROUP BY job_id)
ORDER BY salary DESC;