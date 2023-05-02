
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary FROM employees as e
LEFT JOIN salaries as s on e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date >= TO_DATE('1986-01-01' ,'YYYY mm dd') AND hire_date < TO_DATE('1987-01-01' ,'YYYY mm dd');


-- List the managers along with their department number, department name, employee number, last name, and first name.
	-- Using JOIN
	SELECT dm.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name FROM EMPLOYEES as e
	INNER JOIN DEPT_MANAGER as dm
	ON e.emp_no = dm.emp_no
	INNER JOIN departments as d
	ON dm.dept_no = d.dept_no;

	-- Using Subqueries
	SELECT emp_data.dept_no,departments.dept_name,emp_data.emp_no,emp_data.last_name, emp_data.first_name FROM 
	(SELECT e.emp_no,dm.dept_no,e.last_name,e.first_name FROM EMPLOYEES as e
	INNER JOIN DEPT_MANAGER as dm
	ON e.emp_no = dm.emp_no) as emp_data
	INNER JOIN departments
	ON emp_data.dept_no = departments.dept_no;

	-- Using Views
	CREATE VIEW emp_data as 
	SELECT e.emp_no,dm.dept_no,e.first_name,e.last_name FROM employees as e
	INNER JOIN dept_manager as dm
	ON e.emp_no = dm.emp_no;

	SELECT emp_data.dept_no,d.dept_name,emp_data.emp_no,emp_data.first_name,emp_data.last_name FROM emp_data
	INNER JOIN departments as d
	ON emp_data.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,last_name,sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

-- SELECT e.emp_no,de.dept_no,d.dept_name,e.first_name,e.last_name FROM employees as e
-- INNER JOIN dept_emp as de
-- on e.emp_no = de.emp_no
-- INNER JOIN departments as d
-- ON de.dept_no = d.dept_no AND d.dept_no = 'd007';

CREATE VIEW emp_dept_name as
SELECT e.emp_no,de.dept_no,e.first_name,e.last_name FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no;

SELECT emp_dept_name.emp_no,emp_dept_name.last_name,emp_dept_name.first_name,emp_dept_name.dept_no,d.dept_name from emp_dept_name
INNER JOIN departments as d
ON emp_dept_name.dept_no = d.dept_no AND d.dept_no = 'd007';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp_dept_name.emp_no,emp_dept_name.last_name,emp_dept_name.first_name,emp_dept_name.dept_no,d.dept_name from emp_dept_name
INNER JOIN departments as d
ON emp_dept_name.dept_no = d.dept_no AND (d.dept_no = 'd007' OR d.dept_no = 'd005');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Frequency of Occurance" FROM employees
GROUP BY last_name
ORDER BY "Frequency of Occurance" DESC;
