-- Sacar todos los registros que tengan un match donde a.continent = b.code
SELECT
	count(*) AS total_countries,
	b.name AS continent_name
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
GROUP BY
	b.name
UNION
-- Sacar aquellos continentes que no estan asignados a un pais
SELECT
	0 AS total_countries,
	b.name AS continent_name
FROM
	country a
	RIGHT JOIN continent b ON a.continent = b.code
WHERE
	a.continent IS NULL
GROUP BY
	b.name)
ORDER BY total_countries asc;