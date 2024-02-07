-- VISTA INVENTARIO COMPLETO 

CREATE VIEW vista_inventario_completo AS
SELECT
    i.id_inventario,
    a.nombre AS nombre_articulo,
    c.nombre AS categoria,
    t.letra_talla AS talla,
    co.nombre AS color,
    a.precio,
    i.cantidad_disponible
FROM inventario i
LEFT JOIN articulo a ON i.id_articulo = a.id_articulo
LEFT JOIN categoria c ON i.id_categoria = c.id_categoria
LEFT JOIN tallas t ON a.id_talla = t.id_talla
LEFT JOIN color co ON a.id_color = co.id_color;

-- Consulta de la vista de inventario completo
SELECT * FROM vista_inventario_completo;

-- VISTA PEDIDOS POR CLIENTE
CREATE VIEW vista_pedidos_por_cliente AS
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    p.id_pedido,
    p.fecha_pedido,
    p.estado_pedido,
    d.id_detalle,
    a.nombre AS nombre_articulo,
    d.cantidad_articulo
FROM
    cliente c
JOIN
    pedido p ON c.id_cliente = p.id_cliente
JOIN
    detalle_pedido d ON p.id_pedido = d.id_pedido
JOIN
    articulo a ON d.id_articulo = a.id_articulo;

-- CONSULTA PEDIDOS POR CLIENTE
SELECT * FROM vista_pedidos_por_cliente;

-- VISTA REABASTECER ARITCULO
CREATE VIEW vista_reabastecer AS
SELECT
    I.id_inventario,
    A.id_articulo,
    A.nombre AS nombre_articulo,
    C.nombre AS categoria,
    T.letra_talla,
    CO.nombre AS color,
    I.cantidad_disponible
FROM
    inventario I
JOIN
    articulo A ON I.id_articulo = A.id_articulo
JOIN
    categoria C ON A.id_categoria = C.id_categoria
LEFT JOIN
    tallas T ON A.id_talla = T.id_talla
LEFT JOIN
    color CO ON A.id_color = CO.id_color
WHERE
    I.cantidad_disponible <= 5;

-- Consulta de la Vista Reabastecer
SELECT * FROM vista_reabastecer;

-- Vista de Envíos Pendientes
CREATE VIEW vista_envios_pendientes AS
SELECT
    E.id_envio,
    C.nombre AS cliente,
    P.id_pedido,
    A.nombre AS articulo,
    DP.cantidad_articulo,
    E.e_calle,
    E.e_ciudad,
    E.e_provincia,
    E.e_cp,
    E.fecha_envio
FROM
    envio E
JOIN
    cliente C ON E.id_cliente = C.id_cliente
JOIN
    pedido P ON E.id_pedido = P.id_pedido
JOIN
    detalle_pedido DP ON P.id_pedido = DP.id_pedido
JOIN
    articulo A ON DP.id_articulo = A.id_articulo
WHERE
    (P.estado_pedido IN ('Listo', 'En Preparacion') OR E.fecha_envio IS NULL)
    AND P.estado_pedido <> 'Entregada';

-- Consulta Vista Envíos Pendientes
SELECT * FROM vista_envios_pendientes;


-- Vista de Artículos Más Vendidos
CREATE VIEW vista_mas_vendidos AS
SELECT 
    a.id_articulo,
    a.nombre AS nombre_articulo,
    c.nombre AS categoria,
    SUM(dp.cantidad_articulo) AS cantidad_vendida
FROM
    articulo a
JOIN 
    categoria c ON a.id_categoria = c.id_categoria
LEFT JOIN 
    detalle_pedido dp ON a.id_articulo = dp.id_articulo
GROUP BY 
    a.id_articulo
ORDER BY 
    cantidad_vendida DESC;

SELECT * FROM vista_mas_vendidos;

