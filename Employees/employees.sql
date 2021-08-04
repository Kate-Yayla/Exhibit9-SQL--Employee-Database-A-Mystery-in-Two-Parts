-- Employee Database
-- Create In Order then go to next table; First, create Table, Inside the table define Column Name and set INT or VARCHAR,etc.. then define Primary Key
CREATE TABLE Department (
    dept_no   VARCHAR  NOT NULL,
    dept_name VARCHAR  NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (dept_no)
);

CREATE TABLE DepartmentManager (
    dept_no VARCHAR NOT NULL,
    emp_no  INT     NOT NULL,
    CONSTRAINT pk_DepartmentManager PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE Employees (
    emp_no       INT     NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date   DATE    NOT NULL,
    first_name   VARCHAR NOT NULL,
    last_name    VARCHAR NOT NULL,
    sex          VARCHAR NOT NULL,
    hire_date    DATE    NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (emp_no)
);

CREATE TABLE DepartmentEmployee (
    emp_no  INT     NOT NULL,
    dept_no VARCHAR NOT NULL,
    CONSTRAINT pk_DepartmentEmployee PRIMARY KEY (
        emp_no,dept_no)
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR NOT NULL,
    title    VARCHAR NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id),
    CONSTRAINT uc_titles_title UNIQUE (
        title)
);


ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE DepartmentEmployee ADD CONSTRAINT fk_DepartmentEmployee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DepartmentEmployee ADD CONSTRAINT fk_DepartmentEmployee_dept_no FOREIGN KEY(dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

--Select * from each table
SELECT * FROM Employees;
SELECT * FROM Department;
SELECT * FROM DepartmentManager;
SELECT * FROM DepartmentEmployee;
SELECT * FROM Titles;
SELECT * FROM Salaries;
--SELECT COUNT(emp_no) FROM salaries;
--SELECT COUNT(emp_no) FROM employee;

-- QUERIES
-- 1 -- Salary by employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee e, salaries s
WHERE s.emp_no = e.emp_no
ORDER BY e.emp_no;
-- 2-- Employees hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;
-- 3-- Manager of each department
SELECT d.dept_no, dp.dept_name, d.emp_no, e.last_name, e.first_name
FROM departmentmanager d, employees e, department dp
where d.emp_no = e.emp_no and d.dept_no = dp.dept_no;
-- 4-- Department of each employee
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departmentemployee de, employee e, department d
WHERE de.emp_no = e.emp_no AND de.dept_no = d.dept_no
ORDER BY e.emp_no;
-- 5-- Employees whose first name is "Hercules" and last name begins with "B"
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;
-- 6-- Employees in the Sales department
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departmentemployee de
JOIN employees e
ON (e.emp_no = de.emp_no)
JOIN department d
ON (d.dept_no = de.dept_no)
WHERE d.dept_name = 'Sales';
-- 7-- Employees in Sales and Development departments
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departmentemployee de
JOIN employees e
ON (e.emp_no = de.emp_no)
JOIN department d
ON (d.dept_no = de.dept_no)
WHERE d.dept_name = 'Development' OR d.dept_name = 'Sales';
-- 8-- The frequency of employee last names
SELECT last_name,
COUNT(last_name) AS "last_name_freq"
FROM employees
GROUP BY last_name
ORDER BY "last_name_freq" DESC;
--Epilogue 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, s.salary, t.title
FROM departmentemployee de
JOIN employees e
ON (e.emp_no = de.emp_no)
JOIN department d
ON (d.dept_no = de.dept_no)
JOIN salaries s
ON (s.emp_no = e.emp_no)
JOIN titles t
ON (t.title_id = e.emp_title_id)
WHERE e.emp_no = 499942

SELECT *
FROM pg_settings
WHERE name = 'port';

