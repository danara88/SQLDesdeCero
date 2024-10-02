-- uuid: Identificadores unicos para los registros
--
-- El cliente puede generar el uuid y puede mandarlo al backend
-- Documentacion: https://www.postgresql.org/docs/current/uuid-ossp.html

-- Instalar uuid-ossp
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Desintalar uuid-ossp
DROP EXTENSION "uuid-ossp";

select gen_random_uuid(), uuid_generate_v4();


CREATE TABLE users5 (
	"user_id" UUID DEFAULT uuid_generate_v4 () PRIMARY KEY,
	"username" VARCHAR
);