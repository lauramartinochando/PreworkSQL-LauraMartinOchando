/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(50),
	email VARCHAR (50)
)
/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/
INSERT INTO public.clientes(id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com')
/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE public.clientes2
SET email = 'juan@gmail.com'
WHERE id = 1;
/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE id = 1;
/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS pedidos(
	id INT PRIMARY KEY,
	cliente_id INT,
	cantidad INT,
  productos VARCHAR(50)
)
/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos
VALUES(1, 1, 2, 'camiseta')
/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos
SET cantidad = 3
WHERE id = 1;
/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE id = 1;
/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE IF NOT EXISTS productos2(
	id INT PRIMARY KEY,
	nombre VARCHAR (50),
	precio DEC
)
/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO public.productos
VALUES(1, 'laptop', 850);
INSERT INTO public.productos
VALUES(2, 'nevera', 1060.99);
INSERT INTO public.productos
VALUES(3, 'mesita', 33.50);
INSERT INTO public.productos
VALUES(4, 'robot cocina', 100);
/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/
/*primero añado la FK ya que antes no lo he hecho porque no había datos en las tablas.*/
ALTER TABLE pedidos
ADD FOREIGN KEY (cliente_id)
REFERENCES clientes(id)
ON DELETE SET NULL;
/*junto con los nombres de los
clientes correspondientes. -> INNER JOIN*/
SELECT p.id, p.cliente_id, p.cantidad, p.productos, c.nombre
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.id
/*más fácil y directo:*/
SELECT p.*, c.nombre
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.id
/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM public.productos
WHERE precio > 50
/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/
SELECT * FROM public.pedidos
WHERE cantidad > 5
/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/
SELECT * FROM public.clientes
WHERE nombre LIKE 'A%%'
/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/
SELECT p.cantidad, c.nombre
FROM pedidos p
INNER JOIN clientes c
ON p.cliente_id = c.id
/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/
/*para eso primero tendríamos que unir las tablas productos y pedidos*/
ALTER TABLE pedidos
ADD FOREIGN KEY (cantidad)
REFERENCES productos(id);

SELECT pedidos.cantidad, productos.nombre
FROM pedidos
INNER JOIN productos
ON pedidos.cantidad = productos.id
/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE pedidos
ADD COLUMN fecha DATE
/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/
/*no había columna "productos", la creamos*/
ALTER TABLE productos
ADD COLUMN producto VARCHAR(50)
/*he añadido algunos datos a la nueva colum. productos con INSERT INTO*/
ALTER TABLE pedidos
ADD FOREIGN KEY (id)
REFERENCES productos(id);
/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.*/


/* Se puede hace Update a varias filas a la vez? Es decir, cuál sería la forma correcta de hacer algo parecido lo siguiente?:*/
/*UPDATE public.nombretabla
SET cantidad = 3, 7, 10.5
WHERE id = 1, 2, 3;*/