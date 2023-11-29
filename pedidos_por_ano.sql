DELIMITER //

CREATE PROCEDURE PedidosPorClienteMes(IN ano_desejado INT)
BEGIN
    SELECT
        MONTH(p.data_pedido) AS mes,
        YEAR(p.data_pedido) AS ano,
        c.idcliente,
        c.nome,
        c.data_nascimento,
        COUNT(p.idpedido) AS total_pedidos
    FROM 
        pedidos p
    INNER JOIN
        clientes c ON p.id_cliente = c.idcliente
    WHERE 
        YEAR(p.data_pedido) = ano_desejado
    GROUP BY 
        ano, mes, p.id_cliente, c.nome, c.data_nascimento
    ORDER BY 
        total_pedidos DESC
    LIMIT 1;
END //

DELIMITER ;

CALL PedidosPorClienteMes(2023);