-- 1. Ver todos los registros
SELECT
	name
FROM
	users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT
	*
FROM
	users
WHERE
	id = 10;


-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT
	*
FROM
	users
WHERE
	name LIKE 'Jim %';


-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT
	*
FROM
	users
WHERE
	name LIKE '% Alexander';


-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE
	users
SET
	name = 'Fernando Herrera'
WHERE
	id = 1;


-- 6. Borrar el último registro de la tabla
/*DO $$
DECLARE
	last_record_id INTEGER;
BEGIN
	-- Find the highest id
	SELECT
		MAX(id) INTO last_record_id
	FROM
		users;
	-- Delete the record with the highest id
	DELETE FROM users
	WHERE id = last_record_id;
END
$$;*/

DELETE FROM users
WHERE id = (
		SELECT
			max(id)
		FROM
			users);
