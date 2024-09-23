

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa? -- Aleman

select * from "language";

select * from countrylanguage where isofficial is true;

select * from country;

select * from continent;


-- Solucion

SELECT
	a.name as country_name,
	d."name" as continent_name,
	c.name as "language",
	c.code as language_code
FROM
	country a
	INNER JOIN countrylanguage b ON b.countrycode = a.code
	INNER JOIN "language" c ON c.code = b.languagecode
	INNER JOIN continent d ON a.continent = d.code
WHERE
	b.isofficial IS TRUE AND d."name" = 'Europe';

-- Solucion final 1
SELECT
	count(*),
	"language",
	language_code
FROM (
	SELECT
		a.name AS country_name,
		d. "name" AS continent_name,
		c.name AS "language",
		c.code AS language_code
	FROM
		country a
		INNER JOIN countrylanguage b ON b.countrycode = a.code
		INNER JOIN "language" c ON c.code = b.languagecode
		INNER JOIN continent d ON a.continent = d.code
	WHERE
		b.isofficial IS TRUE
		AND d. "name" = 'Europe') AS totals
GROUP BY
	"language",
	language_code
ORDER BY
	count(*)
	DESC
LIMIT 1;

-- Solucion final 2 (Sin usar subqueries)
SELECT
	count(*),
	b.languagecode,
	b. "language"
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial IS TRUE
GROUP BY
	b.languagecode,
	b. "language"
ORDER BY
	count(*)
	DESC
LIMIT 1;



-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)

-- Solucion (Sin usar subqueries)
SELECT
	a.name,
	b.languagecode,
	b. "language"
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial IS TRUE
	AND b.languagecode = 135;

-- Solucion (Usando subqueries)
SELECT
	a.name,
	b.languagecode,
	b. "language"
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial IS TRUE
	AND b.languagecode = (
		SELECT
			b.languagecode
		FROM
			country a
			INNER JOIN countrylanguage b ON a.code = b.countrycode
		WHERE
			a.continent = 5
			AND b.isofficial IS TRUE
		GROUP BY
			b.languagecode
		ORDER BY
			count(*)
			DESC
		LIMIT 1);



