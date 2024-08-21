-- Funcion agregada: Distinc
-- Dictinct: Te ayuda a no tener duplicados en tu lista.
-- Hojo: Almacenar el pais en string no es bueno, ya que si tenemos dos paises pero
-- con con algun espacio, no funcionaria. Mejor alamcenar los IDs.
select DISTINCT country from users;