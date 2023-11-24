-- Criar a view
CREATE VIEW v_pasteis_veganos_maiores18 AS
SELECT
    p.id_pastel,
    p.nome AS nome_pastel,
    p.preco,
    c.id_cliente,
    c.nome AS nome_cliente,
    c.apelido,
    c.data_nascimento,
    TIMESTAMPDIFF(YEAR, c.data_nascimento, CURRENT_DATE()) AS idade
FROM
    pasteis p
JOIN
    ingredientes i ON p.id_ingrediente = i.id_ingrediente
JOIN
    produtos prod ON i.id_produto = prod.id_produto
JOIN
    categoria_pasteis cp ON p.id_categoria_pastel = cp.id_categoria_pastel
JOIN
    pedidos pe ON p.id_pastel = pe.id_pedido
JOIN
    clientes c ON pe.id_cliente = c.id_cliente
WHERE
    cp.nome = 'Vegano' AND TIMESTAMPDIFF(YEAR, c.data_nascimento, CURRENT_DATE()) >= 18;

-- Consultar a view
SELECT * FROM v_pasteis_veganos_maiores18;
