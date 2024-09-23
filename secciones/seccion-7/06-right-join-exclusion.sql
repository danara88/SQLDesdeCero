-- Listado de todos los continentes que no tienen registros asignados
-- a la tabla de paises.
--
-- RIGHT OUTER JOIN with exclusion
SELECT
	a.name AS country_name,
	a.continent AS continent_id,
	b.name AS continent_name
FROM
	country a
	RIGHT OUTER JOIN continent b ON a.continent = b.code
WHERE 
a.continent IS null
ORDER BY
	a.name DESC;