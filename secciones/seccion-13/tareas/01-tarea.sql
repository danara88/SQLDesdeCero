-- CTE recursivo
-- Muy util cuando tenemos una estructura jerarquica
-- Documentacion: https://www.postgresql.org/docs/15/queries-with.html

-- nombre de la tabla en memoria
-- campos que vamos a tener
WITH RECURSIVE countdown( val ) as (
	-- Inicializacion => primer nivel o valores iniciales
	-- values(5) -- establecer el valor al parametro val
	select 1 as val -- empezamos con el valor 5
	UNION
	-- Query recursivo
	select val + 1 from countdown where val < 10 
)
-- Select de los campos
select * from countdown;