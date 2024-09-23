-- Quiero que me muestren el pais con mas ciudades.
-- Campos: total de ciudades y el nombre del pais.
-- Usar inner join

SELECT
	count(*) AS total_cities,
	b. "name" AS country_name
FROM
	city a
	INNER JOIN country b ON a.countrycode = b.code
GROUP BY
	b. "name"
ORDER BY
	count(*)
	DESC
limit 1;∫