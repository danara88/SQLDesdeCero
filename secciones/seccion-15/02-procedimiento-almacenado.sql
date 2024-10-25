-- Procedimientos almacenados:
--
-- Normalmente, son utilizados para centralizar procedimientos para inserciones y actualizaciones.
--
-- Ejmplo: Si queremos insertar algun tipo de data en una tabla, podemos usar PA para hacerlo de manera controlaba.
-- Los PA no necesarimente regresan algo. Todas las funciones regresan algo.
--
-- Este PA se lo puedo dar a mis juniors para que no tengan acceso directo a la insercion de mis tablas.
CREATE OR REPLACE PROCEDURE insert_region_proc(int, varchar)
as $$
BEGIN

	INSERT INTO regions(region_id, region_name)
		VALUES($1, $2);

	raise notice 'Variable 1: %', $1;
	raise notice 'Variable 2: %', $2;

	
	-- Le dice a la base de datos que se reviertan los cambios
	-- rollback;
	
	-- Impacta la base de datos (si hay un error, aqui se va a devolver)
	commit;
END;
$$
LANGUAGE plpgsql;

-- Llamar a un procedimineto alamcenado
call insert_region_proc(5, 'Central America');


select * from regions;
