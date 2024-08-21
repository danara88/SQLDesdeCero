-- Add foreign key for city table
ALTER TABLE city
	ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code);

SELECT
	*
FROM
	country
WHERE
	code = 'AFG';

-- Añadir el pais faltante para poder crear el foreigh key 
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 
        652860, 1919, 40000000, 62, 69000000, NULL, 
        'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');