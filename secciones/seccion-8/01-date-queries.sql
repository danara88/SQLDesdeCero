-- Consiltas sobre fechas
--

SELECT
	*
FROM
	employees
WHERE
	hire_date > '1998-02-05'
ORDER BY
	hire_date ASC;


SELECT
	max(hire_date) as mas_nuevo_fecha,
	min(hire_date) as primer_empleado_fecha
FROM
	employees;

SELECT
	*
FROM
	employees
WHERE
	hire_date BETWEEN '1990-01-01' and '2000-01-01'
ORDER BY
	hire_date ASC;

