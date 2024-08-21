
-- Function having
-- El having trabaja de la mano con el group by

SELECT
	count(*) AS total_users, -- Aggregate function
	country -- Column country
FROM
	users
GROUP BY
	country
HAVING
	count(*) BETWEEN 5 AND 9
ORDER BY
	count(*) ASC;