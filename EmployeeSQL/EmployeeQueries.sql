-- Preview of the tables
SELECT *FROM employees LIMIT 100;
SELECT *FROM departments LIMIT 100;
SELECT *FROM dept_emp LIMIT 100;
SELECT *FROM dept_manager LIMIT 100;
SELECT *FROM salaries LIMIT 100;
SELECT *FROM titles LIMIT 100;

-- List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name,
	employees.gender, salaries.salary
FROM employees
JOIN salaries
ON (employees.emp_no = salaries.emp_no);

-- List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '1986%'
ORDER BY hire_date;

-- List the manager of each department with the following info:
-- dept_no, dept_name, emp_no, last_name, first_name, from_date, to_date
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no,
	employees.last_name, employees.first_name,
	dept_manager.from_date AS "start date", dept_manager.to_date AS "end date"
FROM ((dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no);

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no);

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no)
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name
SELECT last_name, COUNT(*) 
FROM employees 
GROUP BY last_name
ORDER BY COUNT DESC;