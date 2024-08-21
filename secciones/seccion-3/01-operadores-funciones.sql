-- UPPER function
SELECT
	id,
	UPPER(name) AS upper_name,
	name
FROM
	users
LIMIT 5;

-- LOWER function
SELECT
	id,
	LOWER(name) AS lower_name,
	name
FROM
	users
LIMIT 5;

-- LENGTH function
SELECT
	id,
	LENGTH(name) AS name_length,
	name
FROM
	users
LIMIT 5;


-- MATH function
SELECT
	id,
	(20 * 20) as suma,
	name
FROM
	users
LIMIT 5;

-- CONCAT function
SELECT
	id,
	CONCAT(id, ' ', name) AS id_and_name,
	'*'||id||'-'||name AS nick_name
FROM
	users
LIMIT 5;