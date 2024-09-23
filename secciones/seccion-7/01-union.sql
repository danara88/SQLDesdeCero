-- UNION
SELECT
	*
FROM
	continent
WHERE
	name LIKE '%America%'
UNION -- Une los dos queries en un solo result set
SELECT
	*
FROM
	continent
WHERE
	code in(3, 5)
ORDER BY
	name DESC;