SELECT
	a.name as country_name,
	a.continent as continent_id,
	b.name as continent_name
FROM
	country a,
	continent b
WHERE
	a.continent = b.code -- Establecer una relacion uno a uno
ORDER BY
	a.name ASC;

-- Usando INNER JOIN
SELECT
	a.name AS country_name,
	a.continent,
	b.name AS continent_name
FROM
	country a 
	INNER JOIN continent b ON a.continent = b.code
ORDER BY
	a.name ASC;