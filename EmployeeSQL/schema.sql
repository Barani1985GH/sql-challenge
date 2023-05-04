ALTER DATABASE "SQL_Challenge" SET datestyle = "ISO, MDY";

DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles (
	title_id VARCHAR(6) NOT NULL PRIMARY KEY,
	title VARCHAR(30)
  );

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(2),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
  );


DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
	dept_no VARCHAR(6) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30)
 );

DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(6),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
 );
 
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
	dept_no VARCHAR(6),
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
 );
 
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
 );
 
Select * from employees;
Select * from titles;
Select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;

SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date >= TO_DATE('1986-01-01' ,'YYYY mm dd') AND hire_date < TO_DATE('1987-01-01' ,'YYYY mm dd');
