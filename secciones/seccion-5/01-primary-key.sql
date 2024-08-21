DELETE FROM country
where code = 'NLD' and code2 = 'NA';

-- Add primary key constraint
ALTER TABLE country
	ADD PRIMARY KEY (code);