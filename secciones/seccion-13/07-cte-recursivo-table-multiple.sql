-- Tabla de multiplicar con CTE recursivo

with RECURSIVE multiplication_table(base, idx, result) as (
	-- init
	select 5 as base, 1 as idx, 5 as result
	-- values(5,1,5)
	UNION
	-- Recursiva
	select 5 as base, idx + 1, (idx + 1) * base from multiplication_table where idx < 20
)
select * from multiplication_table;