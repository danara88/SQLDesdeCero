-- Creando indices
-- Se que alguien me va a preguntar: Cuales son todos los paises de Europa?
-- o Cuales son los paises de Asia?
-- 
-- Podemos crear indices para mejorar la velocidad de nuestras queries a la base de datos.
-- 
-- Los indices unicos son mas rapidos que los indices donde podemos tener mas de 1 registro.
--
-- Los indices son constraints
--

select * from country where continent = 'Africa';


CREATE UNIQUE INDEX "unique_country_name" ON country (
-- Puedo crear indices compuestos. Ejemplo: name + country (Esto es un indice compuesto)
	name
);

CREATE INDEX "country_continent" ON country (continent);

-- Crear un unique index
CREATE UNIQUE INDEX "unique_name_countrycode_district" ON city (name, countrycode, district);

-- District for district column to make faster queries in district column
CREATE INDEX "index_district" ON city (district);