-- Funcion Group BY aggregate function
-- Cuando usamos una funcion de agregacion, no podemos incluir una columna sin usar el Group By.
SELECT
	count(*),
	followers
FROM
	users
WHERE
	followers BETWEEN 4800 AND 4999
GROUP BY
	followers
ORDER BY
	followers DESC;