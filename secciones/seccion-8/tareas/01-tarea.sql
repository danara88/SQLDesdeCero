select date_part('years', CURRENT_DATE)::INTEGER as current_year


SELECT
	hire_date,
	MAKE_INTERVAL (YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT(YEARS FROM hire_date)::integer)
FROM
	employees
ORDER BY
	hire_date DESC;

-- Hacer backup
CREATE TABLE employees_bk (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

-- Hacer volcado de datos a la tabla backup de employees
INSERT INTO employees_bk
SELECT
	*
FROM
	employees;

-- Comprobar que la tabla employees backup tenga todo
select * from employees_bk;

-- Antes de la actualización masiva, probar el query
SELECT
	hire_date,
	hire_date + INTERVAL '24 years' AS new_date
FROM
	employees;

-- Hacer una actualización masiva en la tabla de employees
UPDATE
	employees
SET
	hire_date = hire_date + INTERVAL '24 year';


-- Si todo sale bien, borrar la tabla backup
DROP TABLE employees_bk;
