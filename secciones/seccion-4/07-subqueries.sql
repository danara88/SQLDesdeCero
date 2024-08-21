-- Subquery: Es un query que se ejecuta dentro de otr query. Lo podemos poner en donde queramos.
-- Son muy ineficientes. Ejemplo: Thengo dos tablas A con 1 millon de resultados y otra tabla con 10 registros.
-- Si eejcuta el subquery en la tabla A, se va a ejecutar 1 millon de veces.

-- Normalemente no se hacen estas subqueries. Mejor crearse una tabla virtual. Hay mas soluciones
SELECT
	domain_email
FROM (
	SELECT
		COUNT(*) AS total_users,
		SUBSTRING(email, POSITION('@' IN email) + 1) AS domain_email,
		'Daniel' AS name,
		23 AS age
	FROM
		users
	GROUP BY
		SUBSTRING(email, POSITION('@' IN email) + 1)
	HAVING
		COUNT(*) > 1
	ORDER BY
		SUBSTRING(email, POSITION('@' IN email) + 1)
		DESC
	) as email_domains;