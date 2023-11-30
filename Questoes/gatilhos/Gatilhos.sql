-- gatilho para calcular valor total do pedido
DELIMITER //
CREATE TRIGGER calcular_valor_total
AFTER INSERT ON itens_do_pedido
FOR EACH ROW
BEGIN
    DECLARE total_pedido DOUBLE;

    -- Calcular o valor total do pedido
    SELECT SUM(quantidade * preco_unitario) INTO total_pedido
    FROM itens_do_pedido
    WHERE id_pedido = NEW.id_pedido;

    -- Atualizar o valor total na tabela de pedidos
    UPDATE pedidos
    SET valor_total = total_pedido
    WHERE idpedido = NEW.id_pedido;
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER reduzir_estoque
AFTER INSERT ON ingredientes_de_produtos
FOR EACH ROW
BEGIN
    DECLARE quantidade_em_estoque DOUBLE;

    -- Obter a quantidade atual em estoque
    SELECT estoque INTO quantidade_em_estoque
    FROM ingredientes
    WHERE id_ingrediente = NEW.id_ingrediente;

    -- Verificar se há estoque suficiente
    IF quantidade_em_estoque >= NEW.qtd_ingrediente THEN
        -- Reduzir a quantidade em estoque
        UPDATE ingredientes
        SET estoque = quantidade_em_estoque - NEW.qtd_ingrediente
        WHERE id_ingrediente = NEW.id_ingrediente;
    ELSE
        UPDATE ingredientes
        SET estoque = 0
        WHERE id_ingrediente = NEW.id_ingrediente;
    
    END IF;
END //
DELIMITER ;
-- Gatilho para impedir o método de pagamento "Dinheiro" se o valor total for maior que 50
DELIMITER //

CREATE TRIGGER impedir_pagamento_dinheiro
BEFORE INSERT ON pedidos
FOR EACH ROW
BEGIN
    DECLARE total_pedido DOUBLE;

    -- Obter o valor total do pedido
    SELECT valor_total INTO total_pedido
    FROM pedidos
    WHERE idpedido = NEW.idpedido;

    -- Verificar se o valor total é maior que 50
    IF total_pedido > 50.0 AND NEW.id_pagamento = (SELECT idpagamento FROM pagamentos WHERE metodo = 'Dinheiro') THEN
        SET NEW.id_pagamento = (SELECT idpagamento FROM pagamentos WHERE metodo = 'PIX');
    END IF;
END //

DELIMITER ;
