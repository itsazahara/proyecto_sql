DROP DATABASE IF EXISTS raccoon;
CREATE DATABASE raccoon;
USE raccoon;

SHOW DATABASES;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	dni CHAR(9) UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	piso_puerta VARCHAR(5),
	ciudad VARCHAR(100) NOT NULL,
	provincia VARCHAR(100) NOT NULL,
	pais VARCHAR(100) NOT NULL,
	codigo_postal CHAR(5) NOT NULL,
	telefono CHAR(9) NOT NULL,
	movil CHAR(9),
	email VARCHAR(100) NOT NULL,
	contrasenia VARCHAR(60) NOT NULL,
	repetir_contrasenia VARCHAR(60) NOT NULL,
	CONSTRAINT chk_contrasenia CHECK (contrasenia = repetir_contrasenia)
);

DESCRIBE usuario;

CREATE TABLE producto(
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	referencia INT NOT NULL UNIQUE,
	nombre VARCHAR(100) NOT NULL,
	precio DECIMAL(6,2) NOT NULL,
	descripcion VARCHAR(500) NOT NULL,
	tipo VARCHAR(100) NOT NULL,
	stock CHAR(2),
	CONSTRAINT chk_stock CHECK (stock = 'SI' OR stock = 'NO')
);

DESCRIBE producto;

CREATE TABLE pedido(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_producto INT,
	id_usuario INT,
	cantidad_producto VARCHAR(30),
	total_compra DECIMAL(6,2),
	tarjeta CHAR(16),
	fecha_compra DATE,
	CONSTRAINT fk_pedido_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
	CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

DESCRIBE pedido;

CREATE TABLE oferta(
	id_oferta INT PRIMARY KEY AUTO_INCREMENT,
	id_producto INT,
	porcentaje_descuento DECIMAL(2,0),
	fecha_inicio DATE,
	fecha_fin DATE,
	CONSTRAINT fk_oferta_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

DESCRIBE oferta;