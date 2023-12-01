-- uma procedure que retorna os pedidos feitos por um cliente
DELIMITER //

CREATE PROCEDURE ObterPedidosPorIdCliente(IN p_cliente_id INT)
BEGIN
    -- Verificar se o cliente existe
    IF EXISTS (SELECT 1 FROM clientes WHERE idcliente = p_cliente_id) THEN
        -- Retornar todos os pedidos do cliente
        SELECT * FROM pedidos WHERE id_cliente = p_cliente_id;
    ELSE
        SELECT 'Cliente não encontrado.' AS mensagem;
    END IF;
END //

DELIMITER ;

CALL ObterPedidosPorIdCliente(1); -- Substitua 1 pelo ID do cliente desejado