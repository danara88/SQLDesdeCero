SELECT
	COUNT(*) AS total_users,
	SUBSTRING(email, POSITION('@' IN email) + 1) AS domain_email -- Genera una columna llamda "domain"
FROM
	users
GROUP BY
	SUBSTRING(email, POSITION('@' IN email) + 1)
HAVING
	COUNT(*) > 1
ORDER BY
	SUBSTRING(email, POSITION('@' IN email) + 1) DESC;