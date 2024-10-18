-- Vistas
-- Es un alias a un query.
-- Las vistas nos van a ayudar a no repetir queries una y otra vez. Sirve para reutilizar queries.
-- Las vistas no son tablas, simplemente son vistas de result sets.
-- Nos ayuda a ahorrarnos en escribir queries muy complejos.

-- Agrupar los registro por año
select date_trunc('year', created_at), created_at from posts order by created_at desc;

-- Agrupar los registro por semana
select date_trunc('week', created_at), created_at from posts order by created_at desc;


-- Crear vista para agrupar los posts por semana
CREATE OR REPLACE VIEW comments_per_week AS
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

-- Esto no es una tabla, si no que se ejecuta el query
-- Para generar la vista, se ejecuta el query.
select * from comments_per_week;

-- Esto es ineficiente, ya que estamos ejecutando la query y ademas
-- estamos sumando los resultados de esa vista. 
select sum(total_claps) from comments_per_week;


-- Si quitamos algo de la vista, primero tenemos que hacer un drop
-- y luego volverla a crear.
drop view comments_per_week;