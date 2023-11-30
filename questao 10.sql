-- view que mostra os nomes dos clientes
CREATE VIEW view_nomes_clientes AS
SELECT
    idcliente,
    nome,
    apelido
FROM clientes;
SELECT * FROM view_nomes_clientes;



-- view que mostra os endereços dos clientes
CREATE VIEW view_enderecos_clientes AS
SELECT
    c.idcliente,
    c.nome,
    c.apelido,
    e.bairro,
    e.logradouro,
    e.numero,
    e.cep,
    e.municipio,
    e.uf
FROM clientes c
JOIN enderecos e ON c.idcliente = e.id_cliente;
SELECT * FROM view_enderecos_clientes;



-- view que mostra os contatos dos clientes
CREATE VIEW view_contatos_clientes AS
SELECT
    c.idcliente,
    c.nome,
    c.apelido,
    co.email,
    co.telefone
FROM clientes c
JOIN contatos co ON c.idcliente = co.id_cliente;
SELECT * FROM view_contatos_clientes;


-- view que mostra os produtos
CREATE VIEW view_produtos AS
SELECT
    p.idproduto,
    p.nome AS nome_produto,
    p.validade_produto,
    cp.nome AS categoria,
    ip.id_ingrediente,
    i.nome AS ingrediente
FROM produtos p
JOIN categoria_produtos cp ON p.id_categoria_prod = cp.idcategoria_produto
LEFT JOIN ingredientes_de_produtos ip ON p.idproduto = ip.id_produto
LEFT JOIN ingredientes i ON ip.id_ingrediente = i.id_ingrediente;
SELECT * FROM view_produtos;


-- view que mostra os tipos de ingredientes
CREATE VIEW view_tipos_ingredientes AS
SELECT
    DISTINCT i.nome AS tipo_ingrediente
FROM ingredientes i;
SELECT * FROM view_tipos_ingredientes;


-- view que mostra pasteis que tem tomate e banana
    Create or replace view view_pastel_tomateebanana as
    SELECT p.nome AS nome_pastel
    FROM produtos p
    JOIN ingredientes_de_produtos ip_tomate ON p.idproduto = ip_tomate.id_produto
    JOIN ingredientes i_tomate ON ip_tomate.id_ingrediente = i_tomate.id_ingrediente
    JOIN ingredientes_de_produtos ip_banana ON p.idproduto = ip_banana.id_produto
    JOIN ingredientes i_banana ON ip_banana.id_ingrediente = i_banana.id_ingrediente
    WHERE i_tomate.nome = 'tomate'
        AND i_banana.nome = 'banana';
select * from view_pastel_tomateebanana;


-- view que mostra pasteis Brocolis e vegano
    Create or replace view view_pastel_Brocolisevegano as
    SELECT p.nome AS nome_pastel
    FROM produtos p
    JOIN ingredientes_de_produtos ip_Brocolis ON p.idproduto = ip_Brocolis.id_produto
    JOIN ingredientes i_Brocolis ON ip_Brocolis.id_ingrediente = i_Brocolis.id_ingrediente
    JOIN ingredientes_de_produtos ip_vegano ON p.idproduto = ip_vegano.id_produto
    JOIN ingredientes i_vegano ON ip_vegano.id_ingrediente = i_vegano.id_ingrediente
    WHERE i_Brocolis.nome = 'Brocolis'
        AND i_vegano.nome = 'vegano';
select * from view_pastel_Brocolisevegano;


-- view que mostra clientes com a letra R
CREATE OR REPLACE VIEW view_clientes_com_r AS
SELECT
    idcliente,
    nome,
    apelido,
    cpf,
    data_nascimento,
    data_cadastro
FROM
    clientes
WHERE
    nome LIKE 'R%';
SELECT * FROM view_clientes_com_r;




-- view que mostra os logradouros com a letra A 
CREATE OR REPLACE VIEW view_logradouros_com_a AS
SELECT
    idendereco,
    bairro,
    logradouro,
    numero,
    cep,
    municipio,
    uf,
    id_cliente
FROM
    enderecos
WHERE
    logradouro LIKE 'A%';
SELECT * FROM view_logradouros_com_a;




-- view que mostra os produtos que começam com a letra S 
CREATE OR REPLACE VIEW view_produtos_com_s AS
SELECT
    idproduto,
    nome,
    validade_produto,
    id_categoria_prod
FROM
    produtos
WHERE
    nome LIKE 'S%';
SELECT * FROM view_produtos_com_s;


