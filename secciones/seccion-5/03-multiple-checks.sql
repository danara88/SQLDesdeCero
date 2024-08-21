-- CHECK constraint
-- Son verificaciones que hacemos a uno o varios campos.
select DISTINCT continent from country;Asia
-- Asia
--South America
--North America
--Oceania
--Antarctica
--Africa
--Europe

--::TEXT Significa que estamos casteando a text (opcional)
ALTER TABLE country
	ADD CHECK ((continent = 'Asia'::TEXT)
			or(continent = 'South America'::TEXT)
				or(continent = 'North America'::TEXT)
					or(continent = 'Oceania'::TEXT)
						or(continent = 'Antarctica'::TEXT)
							or(continent = 'Africa'::TEXT)
								or(continent = 'Europe'::TEXT));

select * from country;

-- Drop constraint
ALTER TABLE country DROP CONSTRAINT "country_continent_check2";