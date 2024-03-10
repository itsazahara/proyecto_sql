USE raccoon;

-- CONSULTAS SIMPLES 


-- TABLA USUARIO
-- Muestra toda la información sobre los usuario que residan en la ciudad Sevilla.
SELECT * FROM usuario WHERE ciudad = 'Sevilla';


-- Muestra toda la información que no se repita sobre los usuarios que en su email tengan el número 9.
SELECT DISTINCT email FROM usuario WHERE email LIKE '%9%';


-- Muestra toda la información sobre los usuarios que la longitud de su nombre sea mayor que la longitud de sus apellidos.
SELECT * FROM usuario WHERE LENGTH(nombre) > LENGTH(apellidos);




-- TABLA PRODUCTO
-- Muestra toda la información de todos aquellos productos que no superen los 50.00 euros de precio.
SELECT * FROM producto WHERE precio < 50.00;


-- Muestra toda la información de todos aquellos productos que estén en stock.
SELECT * FROM producto WHERE stock = 'SI';


-- Muestra toda la información de todos aquellos productos ordenados de manera descendente por su precio.
SELECT * FROM producto ORDER BY precio DESC;




-- TABLA PEDIDO
-- Muestra los pedidos realizados entre el 1 de enero de 2024 y el 1 de marzo de 2024.
SELECT * FROM pedido WHERE fecha_compra BETWEEN '2024-01-01' AND '2024-03-01';


-- Muestra la fecha y el total de compra para cada pedido ordenados de manera descendente por fecha.
SELECT id_pedido, fecha_compra, total_compra FROM pedido ORDER BY fecha_compra ASC;


-- Muestra la fecha y el total de compra para los pedidos realizados durante el último mes.
SELECT id_pedido, fecha_compra, total_compra FROM pedido WHERE fecha_compra >= DATE_SUB(NOW(), INTERVAL 1 MONTH);




-- TABLA OFERTA
-- Muestra las ofertas de un producto específico.
SELECT * FROM oferta WHERE id_producto = 1;


-- Muestra las ofertas que tienen un porcentaje mayor o igual a 20%.
SELECT * FROM oferta WHERE porcentaje_descuento >= 20;


-- Muestra el mayor porcentaje de descuento que hay entre todas las ofertas.
SELECT MAX(porcentaje_descuento) AS maximo_descuento FROM oferta;
----------------------------------------------------------------------------------

-- CONSULTAS COMPLEJAS

-- Obtén el precio medio de los productos comprados en cada ciudad. 
-- Muestra la ciudad y el precio promedio correspondiente. Se quiere saber la ciudad de residencia de los usuarios.
-- Además, agrupa los resultados por ciudad.
SELECT u.ciudad, AVG(pr.precio) AS avg_price
FROM usuario u
JOIN pedido pd ON u.id_usuario = pd.id_usuario
JOIN producto pr ON pd.id_producto = pr.id_producto
GROUP BY u.ciudad;


-- Selecciona el nombre de los productos y la suma total de las compras realizadas para cada producto. 
-- Agrupa los resultados por el nombre del producto. Ordena el conjunto de resultados en orden descendente según las ventas totales y 
-- solo deben ser los 5 primeros.
SELECT pr.nombre, SUM(pd.total_compra) AS total
FROM producto pr
JOIN pedido pd ON pr.id_producto = pd.id_producto
GROUP BY pr.nombre
ORDER BY total DESC
LIMIT 5;

-- Muestra los usuarios que han realizado compras con la tarjeta de crédito con el número 1234567899876543.
SELECT u.nombre, u.apellidos, p.id_pedido
FROM usuario u
JOIN pedido p ON u.id_usuario = p.id_usuario
WHERE p.tarjeta = '1234567899876543';

-- Muestra el nombre y los apellidos de los usuarios que no han realizado ninguna compra.
SELECT u.nombre, u.apellidos
FROM usuario u
LEFT JOIN pedido p ON u.id_usuario = p.id_usuario
WHERE p.id_pedido IS NULL;


-- Muestra los usuarios que han comprado más de un producto en un solo pedido.
SELECT u.nombre, u.apellidos, p.id_pedido, COUNT(pd.id_producto) AS num_produ
FROM usuario u
JOIN pedido p ON u.id_usuario = p.id_usuario
JOIN pedido pd ON p.id_pedido = pd.id_pedido
GROUP BY u.nombre, u.apellidos, p.id_pedido
HAVING num_produ > 1;


-- Muestra los productos que tengan una oferta aplicada, es decir, que su oferta sea mayor del 0%.
SELECT pr.nombre, of.porcentaje_descuento
FROM producto pr
JOIN oferta of ON pr.id_producto = of.id_producto
WHERE of.porcentaje_descuento > 0;



-- Muestra el precio medio de los productos que han sido pedidos en cada ciudad.
SELECT u.ciudad, AVG(pr.precio) AS avg_price
FROM usuario u
JOIN pedido pd ON u.id_usuario = pd.id_usuario
JOIN producto pr ON pd.id_producto = pr.id_producto
GROUP BY u.ciudad;



-- Muestra el nombre del usuario, el nombre del producto y su precio para aquellos productos 
-- que están en stock, ordenados por precio de forma descendente.
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_producto, p.precio
FROM usuario u
JOIN producto p ON u.id_usuario = p.id_producto
WHERE p.stock = 'SI'
ORDER BY p.precio DESC;


-- Muestra el nombre del usuario, el nombre del producto, el porcentaje de descuento y el precio con descuento para los 
-- productos comprados entre el 1 de enero y el 31 de marzo de 2024, ordenados por precio con descuento de forma ascendente.
SELECT u.nombre AS nombre_usuario, p.nombre AS nombre_producto, o.porcentaje_descuento, p.precio * (1 - o.porcentaje_descuento / 100) AS precio_descuento
FROM pedido pd
JOIN usuario u ON pd.id_usuario = u.id_usuario
JOIN producto p ON pd.id_producto = p.id_producto
LEFT JOIN oferta o ON pd.id_producto = o.id_producto
WHERE pd.fecha_compra BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY precio_descuento ASC;