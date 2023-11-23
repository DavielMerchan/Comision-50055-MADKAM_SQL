CREATE DATABASE madkam;
USE madkam;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
apellido VARCHAR (20),
email VARCHAR (30) NOT NULL,
dni VARCHAR (20),
telefono INT,
calle VARCHAR (30),
ciudad VARCHAR (20),
cp VARCHAR (10),
PRIMARY KEY (id_cliente)
);

CREATE TABLE tipo_articulo(
id_tipo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
precio INT,
PRIMARY KEY (id_tipo)
);

CREATE TABLE tallas(
id_talla INT NOT NULL AUTO_INCREMENT,
letra_talla VARCHAR (10),
num_talla INT,
PRIMARY KEY (id_talla)
);

CREATE TABLE color(
id_color INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20),
PRIMARY KEY (id_color)
);

CREATE TABLE articulo(
id_articulo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (30) NOT NULL,
id_tipo INT,
id_talla INT,
id_color INT,
cantidad_articulo INT,
PRIMARY KEY (id_articulo),
FOREIGN KEY (id_tipo) REFERENCES tipo_articulo(id_tipo),
FOREIGN KEY (id_talla) REFERENCES tallas(id_talla),
FOREIGN KEY (id_color) REFERENCES color(id_color)
);

CREATE TABLE Pedido(
id_pedido INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_articulo INT NOT NULL,
fecha_pedido DATE,
PRIMARY KEY (id_pedido),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_articulo) REFERENCES articulo(id_articulo)
);

CREATE TABLE envio(
id_envio INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_pedido INT NOT NULL,
e_calle VARCHAR (30),
e_ciudad VARCHAR (20),
e_provincia VARCHAR (20),
e_cp VARCHAR (10),
fecha_envio DATE, 
PRIMARY KEY (id_envio),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE preguntas(
id_pregunta INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
nombre VARCHAR (20),
tipo_pregunta VARCHAR (20),
fecha_pregunta DATE,
PRIMARY KEY (id_pregunta),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


SELECT * FROM CLIENTE;
SELECT * FROM articulo;
SELECT * FROM color;
SELECT * FROM preguntas;
SELECT * FROM pedido;
SELECT * FROM envio;
SELECT * FROM tallas;
SELECT * FROM tipo_articulo;