

--employees and salaries
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    public."Employees" e
JOIN
    public."Salaries" s ON e.emp_no = s.emp_no;

--employees from 1986
SELECT
    first_name,
    last_name,
    hire_date
FROM
    public."Employees"
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
-- department managers with their names and department name	
	
	SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    public."Dept_manager" dm
JOIN
    public."Departments" d ON dm.dept_no = d.dept_no
JOIN
    public."Employees" e ON dm.emp_no = e.emp_no;
--department number per employee with their names and department name

SELECT
    de.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    d.dept_name
FROM
    public."Dept_emp" de
JOIN
    public."Employees" e ON de.emp_no = e.emp_no
JOIN
    public."Departments" d ON de.dept_no = d.dept_no;
	
--Finding all hercules with a B starting last name	
	SELECT
    first_name,
    last_name,
    sex
FROM
    public."Employees"
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
-- sales department 

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    public."Employees" e
JOIN
    public."Dept_emp" de ON e.emp_no = de.emp_no
JOIN
    public."Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';
	
--sales and development employees with their department names, employee numbers, and names. 	
	SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    public."Employees" e
JOIN
    public."Dept_emp" de ON e.emp_no = de.emp_no
JOIN
    public."Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
-- name frequency count	
	SELECT
    last_name,
    COUNT(*) AS name_count
FROM
    public."Employees"
GROUP BY
    last_name
ORDER BY
    name_count DESC;


