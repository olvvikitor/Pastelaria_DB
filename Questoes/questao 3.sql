    SELECT p.nome AS nome_pastel
    FROM produtos p
    JOIN ingredientes_de_produtos ip_bacon ON p.idproduto = ip_bacon.id_produto
    JOIN ingredientes i_bacon ON ip_bacon.id_ingrediente = i_bacon.id_ingrediente
    JOIN ingredientes_de_produtos ip_queijo ON p.idproduto = ip_queijo.id_produto
    JOIN ingredientes i_queijo ON ip_queijo.id_ingrediente = i_queijo.id_ingrediente
    WHERE i_bacon.nome = 'bacon'
        AND i_queijo.nome = 'queijo';
-- Liste todos os pastéis que possuem bacon e queijo em seu recheio.