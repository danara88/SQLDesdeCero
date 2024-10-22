-- FUNCIONES
-- El lenguaje utilizado para escribir funciones es plpgsql

SELECT
	GREATEST(1, 2, 3);

SELECT
	COALESCE(NULL, NULL, 1);


select first_name, greet_employee(first_name) from employees;


-- Es recomendable utilizar el snake case para usar todo en minusculas
CREATE OR REPLACE FUNCTION greet_employee (employee_name VARCHAR)
	RETURNS VARCHAR
	AS $$
-- Declare
BEGIN
	RETURN 'Hola ' || employee_name;
END
$$
LANGUAGE plpgsql;