

-- Funcion para obtener el posible aumento de un empleado
CREATE OR REPLACE FUNCTION get_employee_max_raise_2 (input_employee_id INT)
	RETURNS NUMERIC(
		8, 2)
	AS $$
DECLARE
	-- Aqui podemos declarar todas las variables que querramos
	employee_job_id int;
	current_salary NUMERIC (8, 2);
	job_max_salary NUMERIC (8, 2);
	possible_raise NUMERIC(8, 2);
BEGIN
	--Tomar el puesto y el salario
	select job_id, salary into employee_job_id, current_salary from employees where employee_id = input_employee_id;

	-- Tomar el max salary, acorde a su job
	select max_salary into job_max_salary from jobs where job_id = employee_job_id;
	
	-- Calculos
	possible_raise = job_max_salary - current_salary;

	IF (possible_raise < 0) THEN
		-- possible_raise = 0;

		-- Lanzar excepcion y que no se ejecute la funcion
		RAISE EXCEPTION 'Persona con salario mayor max_salary: %', input_employee_id;
	END IF;
	
	return possible_raise;

END;
$$
LANGUAGE plpgsql;

select employee_id, first_name, salary, get_employee_max_raise_2(employee_id) from employees