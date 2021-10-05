-- 그룹함수 (다중행 함수, 집계함수)

SELECT ROUND(AVG(salary)) AS 평균, MAX(salary) AS 최댓값,
MIN(salary) AS 최솟값, SUM(salary) AS 합계, COUNT(salary) AS 카운트
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*)
FROM employees
WHERE department_id = 80;

SELECT COUNT(department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

-- GROUP BY 절
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호;

SELECT *
FROM employees
WHERE department_id IS NULL;

-- 예제 1
SELECT department_id 부서명, COUNT(employee_id) 사원수, MAX(salary) 최고급여,
MIN(salary) 최고급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, job_id 직업, manager_id 상사번호,
SUM(salary) 월급합계, COUNT(job_id) 직원수
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY 부서번호 ASC;

--예제 3
SELECT ROUND(AVG(MAX(salary))) 부서별최고월급평균,
AVG(MIN(salary)) 부서별최저월급평균
FROM employees
GROUP BY department_id;

-- HAVING 절
SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 예제 1
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY 월급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id != 40 AND department_id IS NOT NULL
GROUP BY department_id
HAVING AVG(salary) <= 7000;

-- 예제 3
SELECT job_id, SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) >= 13000
ORDER BY 급여총액 DESC;