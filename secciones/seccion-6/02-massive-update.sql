-- Consejos al hacer actualizaciones masivas de una base de datos.
-- 1. Hablar con el adminsitrador de bases de datos para que haga un backup de la tabla impactada.
-- 2. Probar los cambios antes de llegar a produccion. Haver una copia de la tabla en desarrollo y probemos el query.
-- Siempre tener una forma revertir los cambios por si algo sale mal.

-- Crear una copia de la tabla de "country" ejecutando el script de creacion
CREATE TABLE "public"."country_bk" (
    "code" bpchar NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL CHECK ((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR (continent = 'Central America'::text)),
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL CHECK (surfacearea >= (0)::double precision),
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric,
    "gnpold" numeric,
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar NOT NULL,
    PRIMARY KEY ("code")
);

-- Hacer el volcado de informacion de la tabla "country" a la tabla "country_bk"
INSERT INTO country_bk
SELECT
	*
FROM
	country;

-- Verificar que la informacion de haya volcado de manera correcta
SELECT
	*
FROM
	country_bk;

-- Quitar el constraint CHECK de la columna "conitnent" llamado "country_continent_check"
ALTER TABLE country DROP CONSTRAINT country_continent_check;


-- Probar el query antes de hacer la actualizacion masiva
SELECT
	a.name,
	a.continent,
	(
		SELECT
			code
		FROM
			continent b
		WHERE
			b.name = a.continent)
	FROM
		country a;

-- Hacer la actualizacion masiva
UPDATE
	country a
SET
	continent = (
		SELECT
			code
		FROM
			continent b
		WHERE
			b.name = a.continent);

select * from country;

