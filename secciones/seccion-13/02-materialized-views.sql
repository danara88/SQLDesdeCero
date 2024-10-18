-- Vista materializada
--
-- Es la copia de una vista pero en memoria.
-- La diferencia con la vista tradicional es que esta ejecuta la query y la materialziada no. Una vez generada,
-- la info se queda, sin volver a hacer la query.
-- La desventaja es que la data puede que no este actualizada.
-- La vista materializada es data en memoria. El peso es tangible en la base de datos.
-- Es conveniente usarla para data que no cambia tanto.

CREATE MATERIALIZED VIEW comments_per_week_mat AS
SELECT
	date_trunc(
		'week', posts.created_at) AS weeks,
	count(
		DISTINCT posts.post_id) AS post_id,
	sum(
		claps.counter) AS total_claps
FROM
	posts
	INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY
	weeks
ORDER BY
	weeks DESC;


select * from comments_per_week;

-- La vista materializada es mas rapida (muy eficiente)
select * from comments_per_week_mat;

-- Refrescar nuestra vista materializada
refresh MATERIALIZED view comments_per_week_mat;


select * from posts where post_id = 1;