-- CLAUSULA CASE - THEN
--
SELECT
	first_name,
	last_name,
	hire_date,
	CASE
		when hire_date > NOW() - INTERVAL '1 year' -- menos de 1 año de trabajar en la empresa asignar rango A
		then '1 año o menos'
		
		when hire_date > NOW() - INTERVAL '3 year' -- entre 1 y 3 años de trabajar en la empresa asignar rango B
		then '1 a 3 años'
		
		when hire_date > NOW() - INTERVAL '6 year' -- más 3 y 6 años de trabajar en la empresa asignar rango C
		then '3 a 6 años'
		
		else 'más de 6 años' -- Todos los demas asignar rango D
	END AS rango_antiguedad
FROM
	employees ORDER BY hire_date DESC;