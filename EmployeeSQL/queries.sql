SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.sex as "Sex",
	s.salary as "Salary"
FROM 
	employees e
JOIN 
	salaries s
	ON 
	e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name as "First Name",
	last_name as "Last Name",
	hire_date as "Hire Date"
FROM
	employees
WHERE
	hire_date like '%1986';


-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name.
SELECT 
	d.dept_no as "Department Number",
	d.dept_name as "Department Name",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
FROM 
	departments d
JOIN 
	dept_manager dm
	ON 
	d.dept_no = dm.dept_no
JOIN 
	employees e
	ON 
	dm.emp_no = e.emp_no;


-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
SELECT 
	d.dept_no as "Department Number",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM 
	departments d
JOIN 
	dept_emp de
	ON 
	d.dept_no = de.dept_no
JOIN 
	employees e
	ON 
	de.emp_no = e.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and
-- whose last name begins with the letter B.
SELECT
	first_name as "First Name",
	last_name as "Last Name",
	sex as "Sex"
FROM
	employees
WHERE
	first_name = 'Hercules'
	AND
	last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	emp_no as "Employee Number",
	last_name as "Last Name",
	first_name as "First Name"
FROM
	employees
WHERE
	emp_no IN 
		(SELECT emp_no FROM dept_emp WHERE dept_no IN 
			(SELECT dept_no FROM departments WHERE dept_name = 'Sales'));


-- List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM 
	employees e
JOIN 
	dept_emp de
	ON 
	e.emp_no = de.emp_no
JOIN 
	departments d
	ON 
	de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'
	OR
	d.dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).
SELECT
	last_name as "Last Name",
	count(last_name) as "Frequency"
FROM
	employees
GROUP BY
	last_name
ORDER BY
	last_name DESC;