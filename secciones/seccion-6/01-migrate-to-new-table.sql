-- Get all the continents in country table
SELECT DISTINCT
	continent
FROM
	country
ORDER BY
	continent ASC;

-- Insert the continents in the continent table
INSERT INTO continent (name)
SELECT DISTINCT
	continent
FROM
	country
ORDER BY
	continent ASC;

-- Verify that the contitnent table has the correct values
SELECT
	*
FROM
	continent;


