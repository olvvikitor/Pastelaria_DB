DELIMITER //

CREATE PROCEDURE InformacoesPedidoPorCPF(IN p_cliente_cpf VARCHAR(20))
BEGIN
    DECLARE cliente_id INT;

    -- Obter o ID do cliente com base no CPF
    SELECT idcliente INTO cliente_id FROM clientes WHERE cpf = p_cliente_cpf;

    -- Verificar se o cliente existe
    IF cliente_id IS NOT NULL THEN
        -- Retornar o ID do pedido e o nome do cliente associado ao cliente
        SELECT p.idpedido, c.nome AS nome_cliente
        FROM pedidos p
        JOIN clientes c ON p.id_cliente = c.idcliente
        WHERE p.id_cliente = cliente_id;
    ELSE
        SELECT 'Cliente não encontrado.' AS mensagem;
    END IF;
END //

DELIMITER ;

CALL InformacoesPedidoPorCPF ('987.654.321-01'); -- Substitua '12345678901' pelo CPF desejado
