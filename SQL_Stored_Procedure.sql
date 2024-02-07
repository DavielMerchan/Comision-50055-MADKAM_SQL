-- SP REGISTRAR ENVIOS

DELIMITER //

CREATE PROCEDURE sp_registrar_envio(
    IN p_id_pedido INT,
    IN p_id_cliente INT,
    IN p_calle VARCHAR(30),
    IN p_ciudad VARCHAR(20),
    IN p_provincia VARCHAR(20),
    IN p_cp VARCHAR(10)
)
BEGIN
    -- Registra un nuevo envío
    INSERT INTO envio (id_cliente, id_pedido, e_calle, e_ciudad, e_provincia, e_cp, fecha_envio)
    VALUES (p_id_cliente, p_id_pedido, p_calle, p_ciudad, p_provincia, p_cp, NOW());

    -- Actualiza el estado del pedido a "Enviada"
    UPDATE pedido SET estado_pedido = 'Enviada' WHERE id_pedido = p_id_pedido;
    
    
END //

DELIMITER ;

-- Prueba SP 
CALL sp_registrar_envio(2, 40, 'Ecuardor', 'Quito', 'Ecuador', '12345');
Select * From envio;

-- Stored_Procedure Actualizar Precio de Articulos
DELIMITER //

CREATE PROCEDURE sp_actualizar_precio_articulo(
    IN p_id_articulo INT,
    IN p_nuevo_precio INT
)
BEGIN
    UPDATE articulo
    SET precio = p_nuevo_precio
    WHERE id_articulo = p_id_articulo;
END //

DELIMITER ;

-- Prueba SP 
CALL SP_actualizar_precio_articulo(138, 6000);
Select * From articulo where id_articulo = 138;

-- SP calcular total del pedido
DELIMITER //

CREATE PROCEDURE sp_calcular_total_pedido(IN pedido_id INT)
BEGIN
    SELECT
        p.id_pedido AS PedidoID,
        c.nombre AS Cliente,
        d.id_articulo AS ArticuloID,
        a.nombre AS Articulo,
        d.cantidad_articulo AS Cantidad,
        a.precio AS PrecioUnitario,
        (d.cantidad_articulo * a.precio) AS Subtotal
    FROM
        pedido p
    INNER JOIN
        cliente c ON p.id_cliente = c.id_cliente
    INNER JOIN
        detalle_pedido d ON p.id_pedido = d.id_pedido
    INNER JOIN
        articulo a ON d.id_articulo = a.id_articulo
    WHERE
        p.id_pedido = pedido_id;
END //

DELIMITER ;

-- Prueba SP calcular total pedido
CALL sp_calcular_total_pedido(1);


