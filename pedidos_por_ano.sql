DROP VIEW pedidos_por_cliente_mes;
CREATE VIEW pedidos_por_cliente_mes AS
SELECT
    MONTH(data_pedido) AS mes,
    YEAR(data_pedido) AS ano,
    id_cliente,
    COUNT(*) AS total_pedidos
FROM pedidos
WHERE YEAR(data_pedido) = 2023  -- Substitua 2023 pelo ano desejado
GROUP BY ano, mes, id_cliente
ORDER BY total_pedidos DESC
LIMIT 1; -- Mostrar apenas o cliente com a maior quantidade de pedidos


select * from pedidos_por_cliente_mes;