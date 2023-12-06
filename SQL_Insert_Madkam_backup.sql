CREATE DATABASE madkam_backup;
USE madkam_backup;

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

CREATE TABLE categoria(
id_categoria INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
PRIMARY KEY (id_categoria)
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
id_categoria INT,
id_talla INT,
id_color INT,
cantidad_articulo INT,
precio INT,
PRIMARY KEY (id_articulo),
FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
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

-- insertando datos a las tablas: 

-- Insertar datos en la tabla de clientes
INSERT INTO Cliente (nombre, apellido, email, dni, telefono, calle, ciudad, cp)
VALUES
('Maria', 'Garcia', 'MariaGarcia@email.com', '12345567', '1134567897', 'Callao', 'Caba', '1234'),
('Camila', 'Martinez', 'CamilaMartinez@email.com', '23456789', '1112345678', 'Santa Fe', 'Caba', '1567'),
('Jose', 'Lopez', 'JoseLopez@email.com', '34568011', '1123456789', 'Av De Mayo', 'Caba', '1891'),
('Raul', 'Sanchez', 'RaulSanchez@email.com', '45679233', '1134567900', 'Corrientes', 'Caba', '2221'),
('Juan', 'Gonzalez', 'JuanGonzalez@email.com', '56790455', '1145679011', 'Cordoba', 'Caba', '1234'),
('Carmen', 'Fernando', 'CarmenFernando@email.com', '67901677', '1156790122', 'Azcuenaga', 'Caba', '1567'),
('Lola', 'Moreno', 'LolaMoreno@email.com', '79012899', '1167901233', 'Viamonte', 'Caba', '1891'),
('Josefa', 'Jimenez', 'JosefaJimenez@email.com', '90124121', '1179012344', 'Arenales', 'Caba', '1221'),
('Isabel', 'Perez', 'IsabelPerez@email.com', '10123534', '1190123455', 'Balboa', 'Caba', '1234'),
('Dolores', 'Garcia', 'DoloresGarcia@email.com', '11234656', '1101234566', 'Tucuman', 'Caba', '1567'),
('Antonio', 'Ruiz', 'AntonioRuiz@email.com', '12345778', '1112345677', 'Sarmiento', 'Caba', '1891'),
('Manuel', 'Navarro', 'ManuelNavarro@email.com', '13456900', '1123456788', 'Callao', 'Caba', '1234'),
('Maria', 'Diaz', 'MariaDiaz@email.com', '14568023', '1134567899', 'Santa Fe', 'Caba', '1567'),
('Pilar', 'Muñoz', 'PilarMuñoz@email.com', '15679145', '1145679010', 'Av De Mayo', 'Caba', '1891'),
('Javier', 'Romero', 'JavierRomero@email.com', '16790267', '1156790121', 'Corrientes', 'Caba', '2221'),
('Miguel', 'Alfaro', 'MiguelAlfaro@email.com', '17901389', '1167901232', 'Cordoba', 'Caba', '1234'),
('Angel', 'Rubio', 'AngelRubio@email.com', '19012511', '1179012343', 'Azcuenaga', 'Caba', '1567'),
('Laura', 'Gil', 'LauraGil@email.com', '20123634', '1190123454', 'Viamonte', 'Caba', '1891'),
('Andres', 'Valero', 'AndresValero@email.com', '21234756', '1101234565', 'Arenales', 'Caba', '1221'),
('Angeles', 'Marin', 'AngelesMarin@email.com', '22345878', '1112345676', 'Balboa', 'Caba', '1234'),
('Mercedes', 'Perez', 'MercedesPerez@email.com', '23457000', '1123456787', 'Tucuman', 'Caba', '1567'),
('Alberto', 'Diaz', 'AlbertoDiaz@email.com', '24568122', '1134567898', 'Sarmiento', 'Caba', '1891'),
('Fernando', 'Moreno', 'FernandoMoreno@email.com', '25679245', '1145679009', 'Tucuman', 'Caba', '1567'),
('Raquel', 'Ruiz', 'RaquelRuiz@email.com', '26790367', '1156790120', 'Sarmiento', 'Caba', '1891'),
('Rosa', 'Sanchez', 'RosaSanchez@email.com', '27901489', '1167901231', 'Av De Mayo', 'Caba', '1891'),
('Marta', 'Lopez', 'MartaLopez@email.com', '29012611', '1179012342', 'Corrientes', 'Caba', '2221'),
('Ruben', 'Marin', 'RubenMarin@email.com', '30123733', '1190123453', 'Cordoba', 'Caba', '1234'),
('Andrea', 'Rubio', 'AndreaRubio@email.com', '31234856', '1101234564', 'Azcuenaga', 'Caba', '1567'),
('Alicia', 'Muñoz', 'AliciaMuñoz@email.com', '32345978', '1112345675', 'Viamonte', 'Caba', '1891'),
('Ivan', 'Perez', 'IvanPerez@email.com', '33457100', '1123456786', 'Arenales', 'Caba', '1221');

SELECT * FROM cliente;

-- Insertar datos en la tabla Color
INSERT INTO Color (nombre)
VALUES
('Blanco'),
('Negro'),
('Azul marino'),
('Amarillo'),
('Rosa'),
('Verde'),
('Azul Francia'),
('Rojo'),
('Vinotinto'),
('Gris'),
('Verde Militar'),
('Celeste');

SELECT * FROM color;

-- Insertar datos en la tabla Talla
INSERT INTO tallas (letra_talla, num_talla)
VALUES
('XS', 0),
('S', 1),
('M', 2),
('L', 3),
('XL', 4),
('XXL', 5),
('XXXL', 6);

SELECT * FROM tallas;

-- Insertar datos en la tabla Categoria
INSERT INTO categoria (nombre)
VALUES
('Remera'),
('Buzo'),
('Taza'),
('Mousepad');

SELECT * FROM categoria;

-- Insertar datos en la tabla Articulo
INSERT INTO articulo (nombre, precio, id_categoria, id_talla, id_color, cantidad_articulo)
VALUES
('Remera Spun Mujer', 0, 1, 1, 1, 10),
('Remera Spun Unisex', 0, 1, 1, 2, 20),
('Remera Algodon Mujer', 0, 1, 1, 3, 10),
('Remera Algodon Unisex', 0, 1, 2, 4, 15),
('Remera Algodon Oversize', 0, 1, 2, 5, 13),
('Musculosa Spun', 0, 1, 2, 1, 22),
('Pupera Algodon', 0, 1, 3, 2, 1),
('Buzo Frisa', 0, 2, 3, 3, 1),
('Buzo Algodon', 0, 2, 3, 4, 0),
('Buzo Canguro Frisa', 0, 2, 4, 5, 0),
('Buzo Canguro Algodon', 0, 2, 4, 1, 2),
('Taza Ceramica', 0, 3, NULL, 1, 10),
('Taza Plastica', 0, 3, NULL, 12, 6),
('Mousepad Cuadrado', 0, 4, NULL, 10, 20),
('Mousepad Redondo', 0, 4, NULL, 10, 20);

SELECT * FROM articulo;

-- Insertar datos en la tabla Pedido 
INSERT INTO pedido (id_cliente, id_articulo, fecha_pedido)
VALUES
(1, 1, '2023-04-11'),
(7, 7, '2023-04-11'),
(13, 13, '2023-04-11'),
(11, 11, '2023-04-11'),
(10, 10, '2023-04-11'),
(2, 2, '2023-04-11'),
(4, 4, '2023-04-11'),
(6, 6, '2023-04-11'),
(4, 4, '2023-04-11'),
(4, 4, '2023-04-11'),
(12, 12, '2023-04-11'),
(5, 5, '2023-04-11'),
(13, 13, '2023-04-11'),
(2, 2, '2023-04-11'),
(2, 2, '2023-04-11'),
(3, 3, '2023-04-11'),
(4, 4, '2023-04-11'),
(15, 15, '2023-04-11'),
(8, 8, '2023-04-11'),
(1, 1, '2023-04-11'),
(4, 4, '2023-04-11'),
(6, 6, '2023-04-11'),
(1, 1, '2023-04-11'),
(1, 1, '2023-04-11'),
(4, 4, '2023-04-11'),
(12, 12, '2023-04-11'),
(12, 12, '2023-04-11'),
(10, 10, '2023-04-11'),
(4, 4, '2023-04-11'),
(4, 4, '2023-04-11');

select * from pedido;

-- Insertar datos en la tabla Envio
INSERT INTO envio (id_cliente, id_pedido, e_calle, e_ciudad, e_provincia, e_cp, fecha_envio)
VALUES
(1, 1, 'Callao', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(2, 7, 'Santa Fe', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(3, 13, 'Av De Mayo', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(4, 11, 'Corrientes', 'Caba', 'Buenos Aires', '2221', '2023-11-10'),
(5, 10, 'Cordoba', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(6, 2, 'Azcuenaga', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(7, 4, 'Viamonte', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(8, 6, 'Arenales', 'Caba', 'Buenos Aires', '1221', '2023-11-10'),
(9, 4, 'Balboa', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(10, 4, 'Tucuman', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(11, 12, 'Sarmiento', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(12, 5, 'Callao', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(13, 13, 'Santa Fe', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(14, 2, 'Av De Mayo', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(15, 2, 'Corrientes', 'Caba', 'Buenos Aires', '2221', '2023-11-10'),
(16, 3, 'Cordoba', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(17, 4, 'Azcuenaga', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(18, 15, 'Viamonte', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(19, 8, 'Arenales', 'Caba', 'Buenos Aires', '1221', '2023-11-10'),
(20, 1, 'Balboa', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(21, 4, 'Tucuman', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(22, 6, 'Sarmiento', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(23, 1, 'Tucuman', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(24, 1, 'Sarmiento', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(25, 4, 'Av De Mayo', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(26, 12, 'Corrientes', 'Caba', 'Buenos Aires', '2221', '2023-11-10'),
(27, 12, 'Cordoba', 'Caba', 'Buenos Aires', '1234', '2023-11-10'),
(28, 10, 'Azcuenaga', 'Caba', 'Buenos Aires', '1567', '2023-11-10'),
(29, 4, 'Viamonte', 'Caba', 'Buenos Aires', '1891', '2023-11-10'),
(30, 4, 'Arenales', 'Caba', 'Buenos Aires', '1221', '2023-11-10');

select * from envio;

-- Insertar datos en la tabla Preguntas
INSERT INTO preguntas (tipo_pregunta, fecha_pregunta, id_cliente, nombre)
VALUES
('Talles', '2023-11-04', 1, 'Maria'),
('Precios', '2023-11-04', 2, 'Camila'),
('Tiempo entrega', '2023-11-04', 3, 'Jose'),
('Metodos de pago', '2023-11-04', 4, 'Raul'),
('Envios', '2023-11-04', 5, 'Juan'),
('Precios', '2023-11-04', 6, 'Carmen'),
('Envios', '2023-11-04', 7, 'Lola'),
('Talles', '2023-11-04', 8, 'Josefa'),
('Tiempo entrega', '2023-11-04', 9, 'Isabel'),
('Metodos de pago', '2023-11-04', 10, 'Dolores'),
('Precios', '2023-11-04', 11, 'Antonio'),
('Talles', '2023-11-04', 12, 'Manuel');

select * from preguntas;
