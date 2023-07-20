/*1. Crea una base de datos llamada "MiBaseDeDatos".*/
/* No existe código en esta acción*/

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(20),
	edad INT
)
/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO usuarios
VALUES (1,'Laura', 32)
INSERT INTO usuarios
VALUES (2,'Carol', 30)
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad = 29
WHERE id = 2
/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios
WHERE id = 1
/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR(50),
	pais VARCHAR(50)
)
/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO ciudades VALUES (1,'Valencia', 'España');
INSERT INTO ciudades VALUES (2,'Lyon', 'Francia');
INSERT INTO ciudades VALUES (3,'Napoles', 'Italia')
/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/
ALTER TABLE pedidos
ADD FOREIGN KEY (id)
REFERENCES productos(id);
/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
LEFT JOIN ciudades
ON usuarios.id = ciudades.id
/*duda: por qué si digo left join a ciudades, no lo posiciona a la izq?*/

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
SELECT * FROM public.usuarios
INNER JOIN public.ciudades
ON usuarios.id = ciudades.id

