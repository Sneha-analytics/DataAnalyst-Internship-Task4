# DataAnalyst-Internship-Task4
# Task 4: SQL for Data Analysis

## **Objective**
The objective of this task is to run SQL queries on the `employees` database to perform data retrieval, filtering, joining, aggregation, subqueries, and creating views.

---
## **Tools Used**
- **Database:** MySQL 8.0
- **Client:** MySQL Workbench

---
## **Dataset**
- Database: `employees` (sample dataset)
- Main tables:
  - `employees`
  - `departments`
  - `dept_emp`
  - `salaries`

---
## **Queries**

### **a. SELECT, WHERE, ORDER BY, GROUP BY**
SELECT dept_no, dept_name AS DepartmentName 
FROM departments 
LIMIT 5;

SELECT * 
FROM departments 
WHERE dept_no = 'd001';

SELECT * 
FROM dept_emp 
WHERE dept_no = 'd001' 
ORDER BY emp_no;

### **b. JOINS (INNER, LEFT, RIGHT)**
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, de.from_date
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, de.from_date
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, de.from_date
FROM employees e
RIGHT JOIN dept_emp de ON e.emp_no = de.emp_no;

### **c. Subqueries**
SELECT emp_no, salary 
FROM salaries 
WHERE emp_no IN (
    SELECT emp_no 
    FROM dept_emp 
    WHERE dept_no = 'd001'
);

### **d. Aggregate Functions**
SELECT emp_no, SUM(salary), CEIL(AVG(salary)) 
FROM salaries 
GROUP BY emp_no;

### **e. Create Views**
CREATE VIEW salary_by_gender AS 
SELECT e.gender, SUM(s.salary) 
FROM employees e 
INNER JOIN salaries s ON e.emp_no= s.emp_no 
GROUP BY gender;

SELECT * FROM salary_by_gender;

### ** f.Optimize queries with indexes**
CREATE UNIQUE INDEX deptname ON departments(dept_name);
SHOW INDEX FROM departments;

## ***Learning Outcomes***:
Learned SELECT, WHERE, ORDER BY, GROUP BY
Used different types of joins
Created subqueries for nested logic
Applied SUM(), AVG() functions
Built reusable views
Created Index for faster joins




SELECT emp_no, SUM(salary) 
FROM salaries 
GROUP BY emp_no;
