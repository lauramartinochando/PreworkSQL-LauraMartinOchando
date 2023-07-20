/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(20),
	precio DEC
)
/* 2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO productos
VALUES (1,'producto 1', 5.50);
INSERT INTO productos
VALUES (2,'producto 2', 73);
INSERT INTO productos
VALUES (3,'producto 3', 111.99);
INSERT INTO productos
VALUES (4,'producto 4', 1);
INSERT INTO productos
VALUES (5,'producto 5', 22.55)
/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE productos
SET precio = 83
WHERE id = 2;
/* 4. Elimina un producto de la tabla "Productos".*/
DELETE FROM productos
WHERE id = 2;
/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/
ALTER TABLE productos
ADD FOREIGN KEY (id)
REFERENCES usuarios(id);

/*duda: cuando intento enlazar como FK tabla usuarios con tabla productos, pasa esto:*/
ERROR:  La llave (id)=(4) no está presente en la tabla «usuarios».inserción o actualización en la tabla «productos» viola la llave foránea «productos_id_fkey» 
ERROR:  inserción o actualización en la tabla «productos» viola la llave foránea «productos_id_fkey»
SQL state: 23503
Detail: La llave (id)=(4) no está presente en la tabla «usuarios».
