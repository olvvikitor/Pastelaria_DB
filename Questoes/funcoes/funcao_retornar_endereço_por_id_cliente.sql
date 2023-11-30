DELIMITER //

-- Função para obter endereço e idade do cliente de um pedido
CREATE FUNCTION obter_endereco_e_idade(pedido_id INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE endereco_cliente VARCHAR(255);
    DECLARE idade_cliente INT;

    -- Obter endereço do cliente
    SELECT CONCAT(enderecos.logradouro, ', ', enderecos.numero, ', ', enderecos.bairro, ', ', enderecos.municipio, ', ', enderecos.uf)
    INTO endereco_cliente
    FROM pedidos
    JOIN enderecos ON pedidos.id_endereco = enderecos.idendereco
    WHERE pedidos.idpedido = pedido_id;

    SELECT TIMESTAMPDIFF(YEAR, clientes.data_nascimento, CURRENT_DATE)
    INTO idade_cliente
    FROM pedidos
    JOIN clientes ON pedidos.id_cliente = clientes.idcliente
    WHERE pedidos.idpedido = pedido_id;

    RETURN CONCAT('Endereço: ', endereco_cliente, '; Idade do Cliente: ', idade_cliente);
END //

DELIMITER ;

SELECT obter_endereco_e_idade(1) AS Resultado;
