
DELIMITER //
DROP PROCEDURE IF EXISTS CalcularValorVendaTotalPastels;

DELIMITER //

CREATE PROCEDURE CalcularValorVendaTotalPastels()
BEGIN
    DECLARE total_venda DOUBLE;

    SELECT SUM(it.preco_unitario * it.quantidade) INTO total_venda
    FROM itens_do_pedido it
    JOIN produtos p ON it.id_produto = p.idproduto
    WHERE p.id_categoria_prod = 1;

    SELECT total_venda AS ValorVendaTotal;
END //

DELIMITER ;

CALL CalcularValorVendaTotalPastels();