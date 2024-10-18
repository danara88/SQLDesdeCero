-- Recursividad de niveeles sin limite
WITH RECURSIVE bosses as (
	--init
	select id, name, reports_to from employees where id = 7
	UNION
	-- recursive
	select employees.id, employees.name, employees.reports_to from employees inner join bosses on bosses.id = employees.reports_to
)
select * from bosses;

-- Recursividad de niveles con limite
-- Limitar el query recursivo adentro del CTE para evitar que se procesen todos los niveles
WITH RECURSIVE bosses as (
	--init
	-- primer nivel de produndidad
	select id, name, reports_to, 1 as depth from employees where id = 1
	UNION
	-- recursive
	select employees.id, employees.name, employees.reports_to, depth + 1 from employees inner join bosses on bosses.id = employees.reports_to
	where "depth" < 2 -- Dame los resultados hasta 2 niveles
)
select * from bosses;