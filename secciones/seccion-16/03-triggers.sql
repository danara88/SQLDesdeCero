-- Triggers: Son prodcedimientos automaticos.
-- Documentacion: https://www.postgresql.org/docs/current/sql-createtrigger.html

call user_login('daniboy', '123456');

-- 1. Create the trigger
CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE ON "user" FOR EACH ROW -- El trigger hara las modificiaciones a cada fila.
WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
EXECUTE FUNCTION create_session_log ();

-- 2. Create the function that the trigger will return.
CREATE OR REPLACE FUNCTION create_session_log ()
	RETURNS TRIGGER
	AS $$
BEGIN
	INSERT INTO "session" (user_id, last_login)
		VALUES(NEW.id, now());
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;