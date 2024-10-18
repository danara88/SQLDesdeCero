WITH RECURSIVE bosses as (
	--init
	-- primer nivel de profundidad
	select employees.id, employees.name, employees.reports_to, 1 as depth, null as reports_to_name from employees where id = 1
	UNION
	-- recursive
	select employees.id, employees.name, employees.reports_to, depth + 1, bosses.name::text from employees inner join bosses on bosses.id = employees.reports_to
	where "depth" < 10 -- Dame los resultados hasta 10 niveles
)
select * from bosses;