-- Common Table Expressions
-- No son mas que tablas virtualizadas en memoria.
-- La CTE al ejecutarse, postgres crea una tabla temporal en memoria en el servidor.
--
-- Casos para usar:
-- 1. Simplificar nuestros queries.
-- 2. Para realizar queries recursivos.

-- Supongamos que no podemos crear vistas

WITH posts_week_2024_CTE AS (
	SELECT
		date_trunc('week',
			posts.created_at) AS weeks,
		count(DISTINCT posts.post_id) AS post_id,
		sum(claps.counter) AS total_claps
	FROM
		posts
		INNER JOIN claps ON claps.post_id = posts.post_id
	GROUP BY
		weeks
	ORDER BY
		weeks DESC
)

SELECT
	*
FROM
	posts_week_2024
WHERE
	weeks BETWEEN '2024-01-01'
	AND '2024-12-31';
