-- Doble relacion a una misma tabla
SELECT
	followers.*,
	leader.name AS leader,
	follower.name AS FOLLOWING
FROM
	followers
	INNER JOIN "user" leader ON leader.id = followers.leader_id
	INNER JOIN "user" follower ON follower.id = followers.follower_id;

-- Estos son las personas que sigue el leader_id = 1
SELECT
			follower_id FROM followers
		WHERE
			leader_id = 1;

-- Este query sacar los followeres de leader_id = 1
SELECT
	followers.leader_id AS follower_level_1,
	followers.follower_id AS follower_level_2
FROM
	followers
WHERE
	leader_id in(
		SELECT
			follower_id FROM followers
		WHERE
			leader_id = 1)