--
-- Retornar una tabla completa usando una funcion
--
create or replace function country_region()
returns table (id CHARACTER(2), name VARCHAR(40), region VARCHAR(25) )
AS $$
begin
	return query
		SELECT country_id, country_name, region_name from countries 
			INNER JOIN regions on countries.region_id = regions.region_id;
end;
$$ LANGUAGE plpgsql;


select * from country_region();