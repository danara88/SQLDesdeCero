-- SECUENCIAS
--
-- Nos permite asignar algun numero de una manera correlativa.

-- Por defecto las secuencias se crean de uno en uno
CREATE SEQUENCE user_sequence;

-- Eliminar una secuencia
DROP SEQUENCE user_sequence;

-- Obtener el siguiente valor de la secuencia
select 
	currval('user_sequence'), -- Obtener el valor de la secuencia actual
	nextval('user_sequence'), -- Llamar al siguiente valor de la secuencia
	currval('user_sequence'); -- Obtener el valor de la secuencia actual
	
	
CREATE TABLE users6 (
	"user_id" INTEGER PRIMARY KEY DEFAULT nextval('user_sequence'),
	"username" varchar
);



