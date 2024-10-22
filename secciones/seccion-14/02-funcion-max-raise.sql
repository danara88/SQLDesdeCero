

-- Funcion para obtener el posible aumento de un empleado
CREATE OR REPLACE FUNCTION get_employee_max_raise (input_employee_id INT)
	RETURNS NUMERIC(
		8, 2)
	AS $$
DECLARE
	-- Aqui podemos declarar todas las variables que querramos
	possible_raise NUMERIC(8, 2);
BEGIN
	SELECT
		max_salary - salary INTO possible_raise
	FROM
		employees
		INNER JOIN jobs ON jobs.job_id = employees.job_id
	WHERE
		employee_id = input_employee_id;
	RETURN possible_raise;
END;
$$
LANGUAGE plpgsql;


SELECT
	get_employee_max_raise (employee_id)
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id;