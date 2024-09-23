-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

SELECT
	count(*) AS total_countries,
	b. "name" AS continent_name
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
WHERE
	b. "name" NOT LIKE '%America'
GROUP BY
	b. "name"
UNION
SELECT
	count(*) AS total_countries,
	'America' AS continent_name
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
WHERE
	b. "name" LIKE '%America'
ORDER BY continent_name DESC;
