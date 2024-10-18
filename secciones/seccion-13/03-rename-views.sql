-- Documentacion: https://www.postgresql.org/docs/8.3/sql-alterview.html

select * from posts_per_week;

CREATE OR REPLACE VIEW posts_per_week AS
SELECT
	date_trunc(
		'week' ::text, posts.created_at) AS weeks,
	count(
		DISTINCT posts.post_id) AS post_id,
	sum(
		claps.counter) AS total_claps
FROM
	posts
	JOIN claps ON claps.post_id = posts.post_id
GROUP BY
	(
		date_trunc('week'::text, posts.created_at))
ORDER BY
	(
		date_trunc('week'::text, posts.created_at))
	DESC;

-- Cambiar el nombre de una vista materialzida
-- es mejor no volverla a crear ya que toma tiempo.
ALTER VIEW comments_per_week RENAME TO psots_per_week;

ALTER MATERIALIZED VIEW comments_per_week_mat RENAME TO posts_per_week_mat;