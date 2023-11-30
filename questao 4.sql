  SELECT SUM(it.preco_unitario * it.quantidade)
    FROM itens_do_pedido it
    JOIN produtos p ON it.id_produto = p.idproduto
    WHERE p.id_categoria_prod = 1;

-- Mostre o valor de venda total de todos os pastéis cadastrados no sistema.

