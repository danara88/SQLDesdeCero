-- Recomendacion: Es mejor usar los JOINS
--
-- Tip: Para nombrar las tabals podemo usar a, b, c pero cuando son mas de 3 tablas 
-- es mejor usar nombres mas explicitos.

-- Con este query, obtendremos 8 resultados por cada registro en la table country.
-- Esto es porque le estoy diciendo que intente hacer un macth de todos los registros de ambas tablas.
-- Esta informacion no me sirve.
SELECT
	a.name,
	a.continent
FROM
	country a,
	continent b
ORDER BY
	name ASC;

-- Para obtener la informacion correct, ocupo hacer el match uno a uno.
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