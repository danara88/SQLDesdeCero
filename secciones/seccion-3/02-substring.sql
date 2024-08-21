SELECT
	name,
	SUBSTRING(name, 0, 5), -- Cortar desde la posicion 0 hasta la 5
	POSITION('E' in name) -- Dame la posicion donde se encuentra la letra 'E'
FROM
	users
LIMIT 10;

SELECT
	name,
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
	SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name,
	TRIM(SUBSTRING(name, POSITION(' ' IN name))) AS last_name_v2
FROM
	users
LIMIT 10;