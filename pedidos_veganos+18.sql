SELECT DISTINCT p.nome
FROM produtos p
JOIN ingredientes_de_produtos ip ON p.idproduto = ip.id_produto
JOIN ingredientes i ON ip.id_ingrediente = i.id_ingrediente
JOIN itens_do_pedido it ON p.idproduto = it.id_produto
JOIN pedidos pe ON it.id_pedido = pe.idpedido
JOIN clientes c ON pe.id_cliente = c.idcliente
WHERE i.nome = 'Vegano' AND p.id_categoria_prod = 1 AND (YEAR(CURRENT_DATE) - YEAR(c.data_nascimento)) > 18;
