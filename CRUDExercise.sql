/*1. Find All Information About Departments */
SELECT 
    department_id, `name`, manager_id
FROM
    departments;

/*2. Find all Department Names*/
SELECT 
    `name`
FROM
    departments;

/*3. Find salary of Each Employee*/
SELECT 
    first_name, last_name, salary
FROM
    employees;

/*4. Find Full Name of Each Employee*/
SELECT 
    first_name, middle_name, last_name
FROM
    employees;

/*5. Find Email Address of Each Employee*/
SELECT 
    CONCAT(first_name,
            '.',
            last_name,
            '@',
            'softuni.bg') AS `full_email_address`
FROM
    employees;

/*6. Find All Different Employee's Salaries*/
SELECT DISTINCT
    (salary)
FROM
    employees;
    
/*7. Find all Information About Employees*/
SELECT 
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative';
    
/*8. Find Names of All Employees by Salary in Range*/
SELECT 
    first_name, last_name, job_title
FROM
    employees
WHERE
    salary BETWEEN 20000 AND 30000;

/*9. Find Names of All Employees*/
SELECT 
    CONCAT_WS(' ', first_name, middle_name, last_name) AS 'Full Name'
FROM
    employees
WHERE
    salary IN (25000 , 14000, 12500, 23600);
    
/*10. Find All Employees Without Manager*/
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    manager_id IS NULL;

/*11. Find All Employees with Salary More Than*/
SELECT
	first_name,last_name,salary
FROM 
	employees
WHERE
	salary > 50000
ORDER BY 
	salary DESC;
    
/*12. Find 5 Best Paid Employees*/
SELECT
	first_name,last_name
FROM 
	employees
ORDER BY
	salary DESC
LIMIT 
	5;

/*13. Find All Employees Except Marketing*/
SELECT
	first_name,last_name
FROM
	employees
WHERE 
	department_id != 4;
    
/*14. Sort Employees Table*/
SELECT
	*
FROM
	employees
ORDER BY
	salary DESC,
    first_name,
    last_name DESC,
    middle_name;
    
/*15. Create View Employees with Salaries*/
CREATE VIEW v_employees_salaries AS
SELECT
	first_name,last_name,salary
FROM 
	employees;
    
SELECT 
	*
FROM
	v_employees_salaries;

/*16. Create View Employees with Job Titles*/
CREATE VIEW v_employees_job_titles AS
SELECT
	CONCAT_WS(' ',first_name,middle_name,last_name) AS 'full_name',
    job_title
FROM 
	employees;

/*17. Distinct Job Titles*/
SELECT
	DISTINCT(job_title) AS 'job_title'
FROM 
	employees
ORDER BY 
	job_title;

/*18. */
SELECT
	P.project_id,
    P.`name`,
    P.`description`,
    P.start_date,
    P.end_date
FROM
	projects AS P
ORDER BY
	P.start_date,P.`name`
LIMIT
	10;
	
/*19. Last 7 Hired Employees*/
SELECT
	first_name,last_name,hire_date
FROM 
	employees 
ORDER BY 
	hire_date DESC
LIMIT
	7;
    
/*20.Increase Salary*/
UPDATE employees AS e
JOIN departments AS d ON d.department_id = e.department_id
	SET e.salary = e.salary + ( e.salary * 0.12)
WHERE d.`name` in ('Engineering','Tool Design','Marketing','Information Services');

SELECT
	salary AS 'Salary'
FROM employees;

/*21. All Mountain Peaks*/
SELECT
	peak_name
FROM
	peaks
ORDER BY 
	peak_name;

/*22. Biggest Countries by Population*/
SELECT
	country_name,
    population
FROM
	countries
WHERE
	continent_code = 'EU'
ORDER BY
	population DESC,
    country_name ASC
LIMIT
	30;

/*23. Countries and Currency (Euro / Not Euro)*/
SELECT
	country_name,
    country_code,
    CASE
		WHEN currency_code = 'EUR' THEN 'Euro'
        ELSE 'Not Euro' 
    END AS currency
FROM 
	countries
ORDER BY
	country_name;

/*24. All Diablo Characters*/
SELECT
	`name`
FROM characters
ORDER BY `name`
