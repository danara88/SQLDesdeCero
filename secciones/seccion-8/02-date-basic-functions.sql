-- Funciones basicas de fechas
--
-- Documentacion: https://www.postgresql.o
-- Mejor dcos: https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_part/

select 'Daniel' as nombre;

select (select count(*) from employees) as total;


-- now
-- example: 2024-09-24 21:33:05.535248+00
select now();

-- CURRENT_DATE
-- example: 2024-09-24
select CURRENT_DATE;

-- CURRENT_TIME
-- example: 21:34:09.718759+00
select CURRENT_TIME;

-- Get the minutes from datetime
SELECT
	date_part('hours', now()) as hours,
	date_part('minutes', now()) as minutes,
	date_part('secs', now()) as seconds,
	date_part('days', now()) as days,
	date_part('months', now()) as months,
	date_part('years', now()) as years;
