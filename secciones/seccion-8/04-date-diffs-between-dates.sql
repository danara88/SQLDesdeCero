
select date_part('years', CURRENT_DATE)::INTEGER as current_year


SELECT
	hire_date,
	MAKE_INTERVAL (YEARS := date_part('years', CURRENT_DATE)::integer - EXTRACT(YEARS FROM hire_date)::integer)
FROM
	employees
ORDER BY
	hire_date DESC