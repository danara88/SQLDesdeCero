SELECT
	max(hire_date) + 2, -- Puedo sumar 2 dias
	max(hire_date) + INTERVAL '2 days',
	max(hire_date) + INTERVAL '1 month',
	max(hire_date) + INTERVAL '1 year',
	max(hire_date) + INTERVAL '1.1 year' + INTERVAL '1 day', -- Sumar 1 anio y 1 mes y 1 dia
	date_part('year', now()),
	MAKE_INTERVAL(YEARS := date_part('year', now())::integer),
	max(hire_date) + MAKE_INTERVAL(YEARS := 23) -- Manera dinamica
FROM
	employees;