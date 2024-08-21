-- Separe the name into fist_name column and last_name column
UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
	last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);

select * from users;