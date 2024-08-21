-- Operador: BETWEEN
SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	followers BETWEEN 4600 AND 4700 -- incluye el 4600 y el 4700
ORDER BY
	followers ASC;