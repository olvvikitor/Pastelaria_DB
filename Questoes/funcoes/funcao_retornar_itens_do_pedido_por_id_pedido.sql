
DELIMITER //

-- Função para obter itens de um pedido
CREATE FUNCTION obter_itens_do_pedido(pedido_id INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE itens_pedido VARCHAR(255);

    SELECT GROUP_CONCAT(
        CONCAT(produtos.nome, ' (', tamanhos.tamanho, '): ', itens_do_pedido.quantidade, ' unidades')
        ORDER BY itens_do_pedido.iditens_do_pedido SEPARATOR '; '
    ) INTO itens_pedido
    FROM itens_do_pedido
    JOIN produtos ON itens_do_pedido.id_produto = produtos.idproduto
    JOIN tamanhos ON itens_do_pedido.id_tamanho = tamanhos.idtamanho
    WHERE itens_do_pedido.id_pedido = pedido_id;

    RETURN itens_pedido;
END //


DELIMITER ;

SELECT obter_itens_do_pedido(1) AS Resultado;
