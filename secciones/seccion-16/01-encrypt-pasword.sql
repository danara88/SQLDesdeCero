-- Encriptar passwords

-- Paquete utilizado para encriptar 
create extension pgcrypto;

insert into "user"(username, password) 
	values ('daniboy', crypt('123456', gen_salt('bf')));

-- Comparar passwords
select * from "user" where username = 'daniboy' and password = crypt('123456', password);