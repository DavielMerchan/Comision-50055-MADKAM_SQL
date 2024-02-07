CREATE DATABASE madkam_2;
USE madkam_2;

-- Tabla Cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20),
    email VARCHAR(30) NOT NULL,
    dni VARCHAR(20),
    telefono VARCHAR(20),
    calle VARCHAR(30),
    ciudad VARCHAR(20),
    cp VARCHAR(10)
);


-- Tabla Tallas
CREATE TABLE tallas (
    id_talla INT AUTO_INCREMENT PRIMARY KEY,
    letra_talla VARCHAR(10),
    num_talla INT
);

-- Tabla Color
CREATE TABLE color (
    id_color INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

-- Tabla categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

-- Tabla Articulo
CREATE TABLE articulo (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40),
    id_categoria INT,
    id_talla INT,
    id_color INT,
    precio INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_talla) REFERENCES Tallas(id_talla),
    FOREIGN KEY (id_color) REFERENCES Color(id_color)
);

-- Tabla Inventario
CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_articulo INT NOT NULL,
    id_categoria INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

-- Tabla Pedido
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE,
    estado_pedido VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Detalle_pedido
CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_articulo INT NOT NULL,
    cantidad_articulo INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo)
);

-- Tabla Envio
CREATE TABLE envio (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_pedido INT NOT NULL,
    e_calle VARCHAR(30),
    e_ciudad VARCHAR(20),
    e_provincia VARCHAR(20),
    e_cp VARCHAR(10),
    fecha_envio DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Tabla Preguntas
CREATE TABLE preguntas (
    id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pregunta VARCHAR(100),
    fecha DATE,
    id_cliente INT,
    nombre VARCHAR(20)
);

-- Modificar la tabla Preguntas para eliminar la columna id_cliente
ALTER TABLE preguntas
DROP COLUMN id_cliente;

