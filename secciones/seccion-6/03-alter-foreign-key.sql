SELECT
	*
FROM
	country;

-- Castear de text a int
ALTER TABLE country ALTER COLUMN continent TYPE int4
USING continent::integer;