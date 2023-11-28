DELIMITER //

CREATE PROCEDURE CalcularValorVendaTotalPastels()
BEGIN
    DECLARE total_venda DOUBLE;

    SELECT SUM(preco_unitario * quantidade) INTO total_venda
    FROM itens_do_pedido
    where id_produto = 1;

    SELECT total_venda AS ValorVendaTotal;
END //

DELIMITER ;
CALL CalcularValorVendaTotalPastels();

