-- Funciones agregadas
-- Ir al sheet cheat pagina 4

-- Function agregada: COUNT
SELECT
	COUNT(*) as total_users
FROM
	users;

-- Funcion agregada: MIN
SELECT
	MIN(followers) as min_followers
FROM
	users;

-- Funcion agregada: MAX
SELECT
	MAX(followers) AS max_followers
FROM
	users;

-- Funcion agregada: AVG and ROUND
SELECT
	AVG(followers) as followers_average,
	ROUND(AVG(followers)) as followers_average_round
FROM
	users;

-- Funcion agregada: SUM
SELECT
	sum(followers) as followers_sum
 FROM
	users;

