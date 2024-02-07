USE madkam_2;

-- TRIGGER ACTUALIZAR INVENTARIO POST VENTA

DELIMITER //
CREATE TRIGGER after_insert_actualizar_inventario
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
    -- Actualiza la cantidad disponible en la tabla inventario
    UPDATE inventario
    SET cantidad_disponible = cantidad_disponible - NEW.cantidad_articulo
    WHERE id_articulo = NEW.id_articulo;
END;
//
DELIMITER ;

-- Probando el trigger: Insertar un nuevo pedido
INSERT INTO pedido (id_cliente, fecha_pedido, estado_pedido) VALUES (1, '2024-02-02', 'En preparacion');

-- Insertar un nuevo detalle de pedido
INSERT INTO detalle_pedido (id_pedido, id_articulo, cantidad_articulo) VALUES (1, 138, 1);

Select * From inventario where id_inventario = 138;

-- Trigger backup clientes al elimnar un registro
-- Crear la tabla de respaldo cliente_backup si no existe
CREATE TABLE IF NOT EXISTS cliente_backup AS SELECT * FROM cliente WHERE 1 = 0;

-- Crear el trigger
DELIMITER //
CREATE TRIGGER T_respaldo_clientes
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN
    -- Copiar el registro a la tabla de respaldo antes de eliminar
    INSERT INTO cliente_backup SELECT * FROM cliente WHERE id_cliente = OLD.id_cliente;
END;
//
DELIMITER ;


-- Supongamos que eliminamos un cliente
DELETE FROM cliente WHERE id_cliente = 100;

-- Verificar¿mos si el registro eliminado se ha copiado a cliente_backup
SELECT * FROM cliente_backup;

-- Restauramos el cliente borrado
INSERT INTO cliente (nombre, apellido, email, dni, telefono, calle, ciudad, cp)
SELECT nombre, apellido, email, dni, telefono, calle, ciudad, cp
FROM cliente_backup
WHERE id_cliente = 100;
