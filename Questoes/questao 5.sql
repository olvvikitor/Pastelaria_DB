SELECT DISTINCT p.*
FROM pedidos p
JOIN itens_do_pedido ip ON p.idpedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.idproduto
JOIN categoria_produtos cp ON pr.id_categoria_prod = cp.idcategoria_produto
WHERE cp.nome IN ('Pasteis', 'Refrigerantes', 'Sucos');
