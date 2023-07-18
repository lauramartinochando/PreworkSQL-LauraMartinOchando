/*1*/
CREATE TABLE IF NOT EXISTS clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
)
#2
INSERT INTO public.clientes(id, nombre)
VALUES (1, 'John')
#3
UPDATE public.clientes
SET nombre = 'John Doe'
WHERE id = 1
#4
DELETE from public.clientes
WHERE id = 1;
#5
SELECT * FROM public.clientes
#6
CREATE TABLE IF NOT EXISTS pedidos(
	id INT PRIMARY KEY,
	cliente_id INT
)
#7
INSERT INTO public.pedidos(id, cliente_id)
VALUES (1, 1)
#8
UPDATE public.pedidos
SET cliente_id = 2
WHERE id = 1;
#9
DELETE FROM public.pedidos
WHERE id = 1;
#10
SELECT * FROM public.pedidos
#11
CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255)
)
#12
INSERT INTO public.productos(id, nombre)
VALUES (1, 'camisa')
#13
UPDATE public.productos
SET nombre = 'pantalón'
WHERE id = 1;
#14
DELETE FROM public.productos
WHERE id = 1;
#15
SELECT * FROM public.productos
#16
CREATE TABLE IF NOT EXISTS DetallesPedido(
	pedido_id INT,
	producto_id INT
)
#17
INSERT INTO public.detallespedido(pedido_id, producto_id)
VALUES(1, 1)
18
UPDATE public.detallespedido
SET producto_id = 2
WHERE pedido_id = 1;
19
DELETE FROM public.detallespedido
WHERE pedido_id = 1;
20
SELECT * FROM public.detallespedido
/* 21 Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join. */
ALTER TABLE public.clientes
ADD CONSTRAINT FK_id FOREIGN KEY (id) REFERENCES pedidos(id)

INSERT INTO public.pedidos(id, cliente_id)
VALUES (1, 525)
INSERT INTO public.pedidos(id, cliente_id)
VALUES (2, 13)
INSERT INTO public.pedidos(id, cliente_id)
VALUES (3, 209)

INSERT INTO public.clientes(id, nombre)
VALUES (1, 'Lucas M.')
INSERT INTO public.clientes(id, nombre)
VALUES (2, 'Daniel S.')
INSERT INTO public.clientes(id, nombre)
VALUES (3, 'Lucía A.')

SELECT * FROM public.detallespedido
INNER JOIN public.productos
ON public.detallespedido.pedido_id = public.productos.id
/* 22 Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join. */
SELECT * FROM public.pedidos
LEFT JOIN public.clientes
ON public.pedidos.id = public.clientes.id
/* 23 Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join. */
ALTER TABLE public.detallespedido
ADD CONSTRAINT FK_pedido_id FOREIGN KEY (pedido_id) REFERENCES productos(id)

INSERT INTO public.productos(id, nombre)
VALUES (1, 'camisa')
INSERT INTO public.productos(id, nombre)
VALUES (2, 'pantalón')
INSERT INTO public.productos(id, nombre)
VALUES (3, 'zapatos')

INSERT INTO public.detallespedido(pedido_id, producto_id)
VALUES (1, 93)
INSERT INTO public.detallespedido(pedido_id, producto_id)
VALUES (2, 101)
INSERT INTO public.detallespedido(pedido_id, producto_id)
VALUES (3, 24)

SELECT * FROM public.detallespedido
INNER JOIN public.productos
ON public.detallespedido.pedido_id = public.productos.id

/* 24 Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join. */
SELECT * FROM public.detallespedido
LEFT JOIN public.productos
ON public.detallespedido.pedido_id = public.productos.id
/* 25 Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes". */
ALTER TABLE public.clientes
ADD COLUMN teléfono VARCHAR(255)
/* 26 Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero. */
ALTER TABLE public.clientes
ALTER COLUMN teléfono TYPE INT
/* ERROR:  la columna «teléfono» no puede convertirse automáticamente al tipo integer
HINT:  Puede ser necesario especificar «USING "teléfono"::integer». */

/* 27 Elimina la columna "telefono" de la tabla "Clientes".*/






