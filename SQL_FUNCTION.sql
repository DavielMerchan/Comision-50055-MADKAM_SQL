-- funcion para calcular la cantidad disponible de un aritculo en especifico

DELIMITER //

CREATE FUNCTION obtener_cantidad_disponible(id_articulo_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;

    SELECT cantidad_disponible INTO cantidad
    FROM inventario
    WHERE id_articulo = id_articulo_param;

    RETURN cantidad;
END //

DELIMITER ;

-- Ejemplo de Uso de la Función
SELECT obtener_cantidad_disponible(1) AS cantidad_disponible;


-- funcion calcular dias transcurridos entre un pedido y su envio
DELIMITER //

CREATE FUNCTION fn_calcular_dias_transcurridos_pedido_envio(id_pedido_param INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE fecha_pedido_val DATE;
    DECLARE fecha_envio_val DATE;
    DECLARE dias_transcurridos INT;

    -- Obtener la fecha de pedido
    SELECT fecha_pedido INTO fecha_pedido_val
    FROM pedido
    WHERE id_pedido = id_pedido_param;

    -- Obtener la fecha de envío
    SELECT fecha_envio INTO fecha_envio_val
    FROM envio
    WHERE id_pedido = id_pedido_param;

    -- Calcular los días transcurridos
    SET dias_transcurridos = DATEDIFF(fecha_envio_val, fecha_pedido_val);

    RETURN dias_transcurridos;
END //

DELIMITER ;

-- Ejemplo de Uso de la Función
SELECT
    p.id_pedido,
    p.fecha_pedido,
    e.id_envio,
    e.fecha_envio,
    fn_calcular_dias_transcurridos_pedido_envio(p.id_pedido) AS dias_transcurridos
FROM
    pedido p
LEFT JOIN
    envio e ON p.id_pedido = e.id_pedido
WHERE
    p.id_pedido = 10;

