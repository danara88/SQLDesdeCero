

--- Create functions
CREATE OR REPLACE FUNCTION sayHello (username VARCHAR)
	RETURNS varchar
	AS $$
BEGIN
	return 'Hola ' || username;
end;
$$
LANGUAGE plpgsql;

-- Invoke function
select sayHello(users."name"), users."name" from users;

CREATE OR REPLACE FUNCTION comment_replies (id INTEGER)
	RETURNS json
	AS $$
	-- Aqui puedes declarar tus variables
DECLARE
	result json;
BEGIN
	-- Aqui va la logica de la funcion
	SELECT
		JSON_AGG(json_build_object('user', user_id, 'comment', CONTENT)) INTO result -- Almacenar el resultado
	FROM
		comments
	WHERE
		comment_parent_id = id;
	RETURN result;
END;
$$
LANGUAGE plpgsql;

select comment_replies(5);


-- Query antes de la mejora
SELECT
	a.*,
	(
		SELECT
			JSON_AGG(json_build_object('user', b.user_id, 'comment', b."content"))
		FROM
			"comments" b
		WHERE
			b.comment_parent_id = a.comment_id) as replies
	FROM
		"comments" a
	WHERE
		comment_parent_id IS NULL;

-- Query despues de la mejora
SELECT
	a.*,
	comment_replies(a.comment_id) as replies
	FROM
		"comments" a
	WHERE
		comment_parent_id IS NULL;






