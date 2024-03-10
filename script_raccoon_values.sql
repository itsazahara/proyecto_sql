USE raccoon;

INSERT INTO usuario (nombre, apellidos, dni, telefono, direccion, piso_puerta, ciudad, provincia, país, codigo_postal, movil, email, contrasenia, repetir_contrasenia) VALUES
	('Susana','Ortiz Montes','59227311B','696229465','calle Bonotuba', '1', 'Sevilla', 'Sevilla', 'España', '41520', '111111111', 'persona1@gmail.com', 'usuario1', 'usuario1'),
	('Pedro','Hernandez Ruiz','96941845G','574267228','avenida Limosna', '56', 'Sevilla', 'Sevilla', 'España', '41520', '222222222', 'persona2@gmail.com', 'usuario2', 'usuario2'),
	('Angela','Perez Romero','24308314F','722723128','calle Callejera', '7', 'Sevilla', 'Sevilla', 'España', '41520', '333333333', 'persona3@gmail.com', 'usuario3', 'usuario3'),
	('Enrique','Moreno Gutierrez','38432538K','906780038','calle SinPri', '5', 'Sevilla', 'Sevilla', 'España', '41520', '444444444', 'persona4@gmail.com', 'usuario4', 'usuario4'),
	('Jorge','Santos Calderon','98074041V','446246772','avenida Masalla', '2', 'Sevilla', 'Sevilla', 'España', '41520', '555555555', 'persona5@gmail.com', 'usuario5', 'usuario5'),
	('Carmen','Herrera Molina','00862488B','253762092','calle Mañana', '2', 'Sevilla', 'Sevilla', 'España', '41520', '666666666', 'persona6@gmail.com', 'usuario6', 'usuario6'),
	('Maria','Bermejo Cortes','43263423D','269630119','calle Tarde', '3', 'Sevilla', 'Sevilla', 'España', '41520', '777777777', 'persona7@gmail.com', 'usuario7', 'usuario7'),
	('Erika','Torres Cortes','98680279K','016703354','calle Noche', '6', 'Sevilla', 'Sevilla', 'España', '41520', '888888888', 'persona8@gmail.com', 'usuario8', 'usuario8'),
	('Emilia','Aguilar Prieto','73379330S','033605892','calle Posible', '66', 'Sevilla', 'Sevilla', 'España', '41520', '999999999', 'persona9@gmail.com', 'usuario9', 'usuario9'),
	('Luis','Borrego Jimenez','24281177P','390460322','calle Impresionante', '9', 'Sevilla', 'Sevilla', 'España', '41520', '000000000', 'persona0@gmail.com', 'usuario0', 'usuario0');

SELECT * FROM usuario;

INSERT INTO producto (referencia, nombre, precio, descripcion, tipo, stock) VALUES
	('11111', 'Pop! Movies: The Godfather 2 - Vito Corleone w/ Towel Silencer', 16.95, 'Del divertido fabricante Funko, 
		nos llegan las irresistibles Pop! figuras de colección de Videojuegos, Cine, Televisión...', 'Figura', 'Si'),
	('22222', 'Tokyo Revengers 8', 15.20, 'El objetivo de Takemichi es convertirse en el líder de la Toman, 
		pero en su vuelta al pasado se encontrará con una nueva banda gigantesca… la Tenjiku. Recuerda bien este 
		nombre porque va a dar lugar al mayor enfrentamiento de la historia de la Toman: el incidente de Kantô. 
		A todo esto se le sumará otra dificultad, la imposibilidad de Takemichi de volver al presente.', 'Comic', 'No'),
	('33333', 'Loungefly - Mini Mochila Lilo & Stitch - Stitch Devil Cosplay', 79.95, 'Mochila del increíble fabricante 
		Loungefly hecha en piel sintética con asas y cremallera con detalles de Stitch de la película Lilo & Stitch', 'Ropa', 'Si'),
	('44444', 'Exploding Kittens Edición 2 Jugadores', 10.00, 'Un juego de cartas para los amantes de los gatos y de las explosiones: 
		¡Ahora para dos jugadores!', 'Juegos', 'No'),
	('55555', 'Pop! Keychain: Demon Slayer - Kanao Tsuyuri', 9.95, 'Del divertido fabricante Funko nos llega la nueva colección de llaveros 
		Pocket Pop! para llevar contigo en el día a día los personajes más carismáticos de Funko en su versión Pop!', 'Merchandising', 'Si'),
	('66666', 'Loungefly - Disney: Minnie Mouse - Diadema Minnie Mouse Embroidered Flowers', 29.95, 'Diadema de alta calidad, Licencia oficial, 
		Material: PVC / Cuero PU, Dimensiones: 26 x 21 cm', 'Cosmetica', 'No'),
	('77777', 'Dragon Ball Candy Star', 4.95, 'Lata de con caramelos con forma de Bola de Dragon de la serie Dragon Ball Z.', 'Alimentacion', 'Si'),
	('88888', 'Pop! Animation: The Seven Deathly Sins - Estarossa', 16.95, 'Del divertido fabricante Funko, nos llegan 
		las irresistibles Pop! figuras de colección de Videojuegos, Cine, Televisión...', 'Figura', 'No'),
	('99999', 'Dragon Ball - Camiseta Kimono', 19.95, 'Camiseta de alta calidad, Licencia oficial, Material: 100% Algodón', 'Ropa', 'Si'),
	('00000', 'Wednesday - Bolso Bowling Fashion Varsity Casual Miércoles', 32.95, 'Bolso Bowling FashionVarsity 
		Casual con compartimentos y cierre de cremallera. ', 'Ropa', 'No');


SELECT * FROM producto;

INSERT INTO pedido (cantidad_producto, total_compra, tarjeta, fecha_compra, id_producto, id_usuario) VALUES
	(1, 29.99, '1234567899876543', '2024-03-01', 1, 1),
	(1, 11.00, '1234567899876543', '2024-02-11', 2, 9),
	(1, 23.65, '1234567899876543', '2024-02-21', 3, 8),
	(1, 78.99, '1234567899876543', '2024-02-01', 4, 7),
	(1, 17.25, '1234567899876543', '2024-01-01', 5, 6),
	(1, 99.92, '1234567899876543', '2024-03-01', 6, 5),
	(1, 13.11, '1234567899876543', '2024-02-29', 7, 4),
	(1, 57.89, '1234567899876543', '2024-01-01', 8, 3),
	(1, 34.34, '1234567899876543', '2024-01-30', 9, 2),
	(1, 10.00, '1234567899876543', '2024-03-01', 1, 2);


SELECT * FROM pedido;

INSERT INTO oferta (porcentaje_descuento, fecha_inicio, fecha_fin, id_producto) VALUES
	(10, '2024-01-01', '2024-01-10', 1),
	(20, '2024-01-02', '2024-01-11', 2),
	(30, '2024-01-03', '2024-01-12', 3),
	(40, '2024-01-04', '2024-01-13', 4),
	(50, '2024-01-05', '2024-01-14', 5),
	(15, '2024-01-06', '2024-01-15', 6),
	(25, '2024-01-07', '2024-01-16', 7),
	(35, '2024-01-08', '2024-01-17', 8),
	(45, '2024-01-09', '2024-01-18', 9),
	(55, '2024-01-10', '2024-01-19', 2);

SELECT * FROM oferta;