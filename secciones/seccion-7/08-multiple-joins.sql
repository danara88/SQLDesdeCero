-- Tip: Cuando tengamos una query que hay muchas relaciones, 
-- se recomienda desmenuzarla en queries pequenios. Buscar hacer los queries mas pequenios primero.
--
-- Cuando tenemos 3 tablas podemos usar los nombre de: a, b, c
-- pero cuando ya hay una cuarta tabla podemos usar los nombres de country, couyntrylanaguage, etc


-- Quiero sabes los idiomas oficiales que se hablan por continente?

-- 1. Identificar la table donde puedo obtener los idiomas
SELECT
	*
FROM
	countrylanguage
WHERE
	isofficial IS TRUE;

-- 2. Identificar la table donde puedo obtener los paises y relacionarlos con el continente
SELECT
	*
FROM
	country;

-- 3. Identificar la table donde puedo obtener los continentes
SELECT
	*
FROM
	continent;

-- 4. Construir la solucion
SELECT DISTINCT
	d.name AS
	LANGUAGE,
	c. "name" AS continent_name
FROM
	countrylanguage a
	INNER JOIN country b ON a.countrycode = b.code
	INNER JOIN continent c ON c.code = b.continent
	INNER JOIN
	"language" d
	ON d.code = a.languagecode
WHERE
	a.isofficial IS TRUE;

-- Quiero sabes cuantos idiomas oficiales se hablan por continente?
SELECT
	count(*),
	continent_name
FROM ( SELECT DISTINCT
		d.name AS
		LANGUAGE,
		c. "name" AS continent_name
	FROM
		countrylanguage a
		INNER JOIN country b ON a.countrycode = b.code
		INNER JOIN continent c ON c.code = b.continent
		INNER JOIN "language" d ON d.code = a.languagecode
	WHERE
		a.isofficial IS TRUE) AS totals
GROUP BY
	continent_name;


