-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, apelido, cpf, data_nascimento, data_cadastro) VALUES
('João Silva', 'Joãozinho', '123.456.789-10', '1985-03-15', CURRENT_TIMESTAMP),
('Maria Oliveira', 'Mariazinha', '019.876.543-21', '1992-09-22', CURRENT_TIMESTAMP);
select * from clientes;


-- Inserir dados na tabela enderecos
INSERT INTO enderecos (bairro, logradouro, numero, cep, municipio, uf, id_cliente) VALUES
('Centro', 'Rua Principal', '123', '12345678', 'Cidade1', 'BA', 1),
('Vila Alegre', 'Avenida Central', '456', '87654321', 'Cidade2', 'SP', 2);
select * from enderecos;

-- Inserir dados na tabela contatos
INSERT INTO contatos (email, telefone, id_cliente) VALUES
('joao.silva@email.com', '123456789', 1),
('maria.oliveira@email.com', '987654321', 2);
select * from contatos;

-- Inserir dados na tabela categoria_produtos
INSERT INTO categoria_produtos (idcategoria_produto, nome) VALUES
(1, 'Pasteis'),
(2, 'Refrigereantes'),
(3, 'Sucos'),
(4, 'Doces');
select * from categoria_produtos;

-- Inserir dados na tabela produtos
INSERT INTO produtos (nome, validade_produto, id_categoria_prod) VALUES
('Nordestino', '2024-01-01', 1),
('Coca-cola', '2024-02-01', 2),
('Suco de Laranja', '2024-03-01', 3),
('Pudim', '2024-04-01', 4);
select * from produtos;

-- Inserir dados na tabela ingredientes
INSERT INTO ingredientes (nome) VALUES
('Carne'),
('Carne Seca'),
('Brócolis'),
('Vegano'),
('Sem Lactose'),
('Frango');
select * from ingredientes;

-- Ligação entre produtos e os seus ingredientes
INSERT INTO ingredientes_de_produtos (idproduto, idingrediente) VALUES
(1, 2), -- Nordestino(ADD = Carne Seca)
(1, 6); -- Nordestino(Carne Seca,ADD = Frango)
select * from ingredientes_de_produtos;

INSERt INTO tamanhos (tamanho) VALUES
('Pequeno'),
('Medio'),
('Grande'),
('200ml'),
('500ml'),
('1L');
select * from tamanhos;

INSERT INTO tamanho_de_produtos(idproduto, idtamanho, preco) VALUES
(1, 1, 5.00), -- Nordestino (Pequeno)
(1, 2, 7.00), -- Nordestino (Médio)
(1, 3, 10.00), -- Nordestino (Grande)
(2, 4, 3.00), -- Coca-cola (200ml)
(2, 5, 5.00), -- Coca-cola (500ml)
(2, 6, 8.00); -- Coca-cola (1L)
select * from tamanho_de_produtos;

-- Inserir dados na tabela pagamentos
INSERT INTO pagamentos (metodo) VALUES
('Cartão de Crédito'),
('Dinheiro'),
('PIX');
select * from pagamentos;

-- Inserir dados na tabela pedidos
INSERT INTO pedidos (valor_total, obs_pedido, id_pagamento, id_endereco, id_cliente) VALUES
(25.5, 'Pedido normal', 1, 1, 1), --  (1 - Cartao de credito, 1 - Rua Principal, 1 - Joao)
(32.0, 'Pedido urgente', 2, 2, 2), -- (2 - Dinheiro, 2 - Avenida Central, 1 - Maria)
(15.99, 'Pedido vegano', 3, 1, 1); -- (3 - Pix, 1 - Rua principal, 1 - Joao);
select * from pedidos;

INSERT INTO itens_do_pedido (idpedido, id_produto, id_tamanho, quantidade, preco_unitario) VALUES
-- Nordestino (Médio)
(1, 1, 2, 2.0, CONCAT('R$', COALESCE((SELECT preco FROM tamanho_de_produtos WHERE id_produto = 1 AND id_tamanho = 2 LIMIT 1), 0.0))),
-- Coca-cola (500ml)
(2, 2, 5, 3.0, CONCAT('R$', COALESCE((SELECT preco FROM tamanho_de_produtos WHERE id_produto = 2 AND id_tamanho = 5 LIMIT 1), 0.0))),
-- Pudim (Pequeno)
(3, 4, 1, 1.0, CONCAT('R$', COALESCE((SELECT preco FROM tamanho_de_produtos WHERE id_produto = 4 AND id_tamanho = 1 LIMIT 1), 0.0)));
select * from itens_do_pedido;


