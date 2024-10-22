-- ROW TYPE
--
-- Podemos almacenar toda una linea en una variable. Esto con el objetivo de evitar crear
-- muchas variables en nuestra funcion.


-- Funcion para obtener el posible aumento de un empleado
CREATE OR REPLACE FUNCTION get_employee_max_raise_2 (input_employee_id INT)
	RETURNS NUMERIC(
		8, 2)
	AS $$
DECLARE
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;

	possible_raise NUMERIC(8, 2);
BEGIN
	
	select * from employees into selected_employee where employee_id = input_employee_id;

	select * from jobs into selected_job where job_id = selected_employee.job_id;

	possible_raise = selected_job.max_salary - selected_employee.salary;

	if (possible_raise < 0) then
		RAISE EXCEPTION 'Persona con salario mayor a max_salary: id:%, Name:%', selected_employee.employee_id, selected_employee.first_name;
	end if;
		
	return possible_raise;

END;
$$
LANGUAGE plpgsql;

select employee_id, first_name, salary, get_employee_max_raise_2(employee_id) from employees;