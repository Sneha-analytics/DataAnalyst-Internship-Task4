USE employees;
-- a.Use SELECT, WHERE, ORDER BY, GROUP B
SELECT dept_no Departmentno, dept_name Departmentname FROM departments LIMIT 5 ; 
SELECT * FROM departments WHERE dept_no= 'd001';
SELECT * FROM dept_emp WHERE dept_no= 'd001' ORDER BY emp_no;
SELECT emp_no, sum(salary) FROM salaries GROUP BY emp_no;

--  b.Use JOINS (INNER, LEFT, RIGHT)
SELECT  employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, dept_emp.from_date FROM employees INNER JOIN dept_emp ON employees.emp_no= dept_emp.emp_no;
SELECT  employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, dept_emp.from_date FROM employees LEFT JOIN dept_emp ON employees.emp_no= dept_emp.emp_no;
SELECT  employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, dept_emp.from_date FROM employees RIGHT JOIN dept_emp ON employees.emp_no= dept_emp.emp_no;

--  c.Write subqueries
SELECT emp_no, salary FROM salaries WHERE emp_no IN (SELECT emp_no FROM dept_emp WHERE dept_no='d001');

-- d.Use aggregate functions (SUM, AVG)
SELECT emp_no, SUM(salary), CEIL(AVG(salary)) FROM salaries GROUP BY emp_no;

--  e.Create views for analysis
CREATE VIEW salary_by_gender AS SELECT e.gender, SUM(s.salary) FROM employees e INNER JOIN salaries s ON e.emp_no= s.emp_no GROUP BY gender;
SELECT * FROM salary_by_gender;

--  f.Optimize queries with indexes
CREATE UNIQUE INDEX deptname ON departments(dept_name);
SHOW INDEX FROM departments;
