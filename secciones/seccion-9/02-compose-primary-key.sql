-- Llave primaria compuesta

CREATE TABLE usersDual (
	id1 int,
	id2 int,
	PRIMARY KEY (id1, id2) -- La combinacion de ambos campos formaran la llave primari
)