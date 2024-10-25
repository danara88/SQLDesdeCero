SELECT
	CURRENT_DATE AS "date",
	employee_id,
	salary,
	max_raise (employee_id),
	max_raise (employee_id) * 0.05 as amount,
	5 as percentage
FROM
	employees;

create or replace PROCEDURE control_raise (percentage numeric(4,2)) as
$$
declare
	real_percentage NUMERIC (8,2);
	total_employees int;
begin

	real_percentage = percentage/100;
	
	-- Mantener el historico
	insert into raise_history(date, employee_id, base_salary, amount, percentage)
	SELECT
		CURRENT_DATE AS "date",
		employee_id,
		salary,
		max_raise (employee_id) * real_percentage as amount,
		percentage
	FROM
		employees;

	-- Impactar la table de empleados
	update employees 
		set salary = (max_raise (employee_id) * real_percentage) + salary;

	select count(*) into total_employees from employees;

	raise notice 'Afectados % empleados', total_employees;
		
	COMMIT;

end;
$$
LANGUAGE plpgsql;

call control_raise(1);


select * from employees;

select * from raise_history;