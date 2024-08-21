-- CHECK constraint
-- Son verificaciones que hacemos a uno o varios campos.
select * from country;

ALTER TABLE country
	ADD CHECK (surfacearea >= 0);