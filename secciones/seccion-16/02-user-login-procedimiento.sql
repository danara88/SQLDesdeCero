-- Procedimiento alamacenado
-- Inserta un nuevo usuario en la tabla de usuarios

create or REPLACE PROCEDURE user_login(input_username VARCHAR, input_password VARCHAR)
as $$
DECLARE
	was_found boolean;
BEGIN
	select count(*) into was_found from "user" 
		where username = input_username and password = crypt(input_password, password);
	
	if(was_found = false) THEN
		insert into session_failed(username, attempt) VALUES(input_username, now());

		-- Impactar la base de datos
		commit;

		-- Cuando lanzamos una excepcion, normalmente se hace un rollback en automatico.
		raise EXCEPTION 'Usuario y password no son correctas';
	end if;
	
	UPDATE "user" set last_login = now() where username = input_username;

	commit;
	
	raise notice 'Usuario encontrado %', was_found;
END;
$$ 
LANGUAGE plpgsql;

call user_login('daniboy', '1234562323');