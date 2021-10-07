-- 조인

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 3개 테이블 조인
SELECT e.employee_id 직원번호, d.department_name 부서이름, l.city 도시
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 예제
SELECT d.department_name 부서명, l.city 시티명, c.country_name 국가명
FROM locations l
JOIN departments d ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id
WHERE l.city IN('Seattle', 'London') AND c.country_name LIKE 'United%';

-- 자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;

-- 기본 외부 조인
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 왼쪽 외부 조인
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- 오른쪽 외부 조인
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- FULL 외부 조인
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- 예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries c LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;

-- 크로스 조인 예제
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c CROSS JOIN regions r;