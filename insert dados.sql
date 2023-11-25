-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, apelido, data_nascimento) VALUES
('João Silva', 'Joãozinho', '123.456.789-10', '1985-03-15'),
('Maria Oliveira', 'Mariazinha', '019.876.543-21', '1992-09-22');

-- Inserir dados na tabela enderecos
INSERT INTO enderecos (bairro, logradouro, numero, cep, municipio, uf, id_cliente) VALUES
('Centro', 'Rua Principal', '123', '12345678', 'Cidade1', 'BA', 1),
('Vila Alegre', 'Avenida Central', '456', '87654321', 'Cidade2', 'SP', 2);

-- Inserir dados na tabela contatos
INSERT INTO contatos (email, telefone, id_cliente) VALUES
('joao.silva@email.com', '123456789', 1),
('maria.oliveira@email.com', '987654321', 2);

-- Inserir dados na tabela categoria_produtos
INSERT INTO categoria_produtos (id_categoria_prod, nome) VALUES
(1, 'Pasteis'),
(2, 'Refrigereantes'),
(3, 'Sucos'),
(4, 'Doces');

-- Inserir dados na tabela produtos
INSERT INTO produtos (nome, validade_produto, id_categoria_prod) VALUES
('Nordestino', '2024-01-01', 1),
('Coca-cola', '2024-02-01', 2),
('Suco de Laranja', '2024-03-01', 3),
('Pudim', '2024-04-01', 4);

-- Ligação entre produtos e os seus ingredientes
INSERT INTO ingredientes_de_produtos (id_produto, id_ingredientes) VALUES
(1, 2), -- Nordestino(ADD = Carne Seca)
(1, 6); -- Nordestino(Carne Seca,ADD = Frango)

-- Inserir dados na tabela ingredientes
INSERT INTO ingredientes (nome) VALUES
('Carne'),
('Carne Seca'),
('Brócolis'),
('Vegano'),
('Sem Lactose'),
('Frango');

INSERT INTO tamanho_de_produtos(id_produto, id_tamanho, preco) VALUES
-- Maneira errada do insert, pois esta faltando uma (tabela itens_do_pedido) para informa o tamanho do pedido
(1, 1), -- Nordestino(ADD =Pequeno)
(1, 2), -- Nordestino(Pequeno, ADD = Medio)
(1, 3), -- Nordestino(Pequeno, Medio, ADD = GRANDE)
(2, 4), -- Coca-cola(200ml)
(2, 5), -- Coca-cola(500ml)
(2, 6); -- Coca-cola(1L)

INSERt INTO tamanhos (tamanho) VALUES
('Pequeno'),
('Medio'),
('Grande'),
('200ml'),
('500ml'),
('1L');

-- Inserir dados na tabela pagamentos
INSERT INTO pagamentos (metodo) VALUES
('Cartão de Crédito'),
('Dinheiro'),
('PIX');

-- Inserir dados na tabela pedidos
INSERT INTO pedidos (valor_total, obs_pedido, id_pagamento, id_endereco, id_cliente) VALUES
(25.5, 'Pedido normal', 1, 1, 1, 1), -- (1 - Nordestino, 1 - Cartao de credito, 1 - Rua Principal, 1 - Joao)
(32.0, 'Pedido urgente', 2, 2, 2, 2), -- (2 - Coca-cola, 2 - Dinheiro, 2 - Avenida Central, 1 - Maria)
(15.99, 'Pedido vegano', 4, 3, 1, 1); -- (1 - Pudim, 1 - Pix, 1 - Rua principal, 1 - Joao);

INSERT INTO itens_do_pedido (id_pedido, id_produto, id_tamanho, quantidade) VALUES
(1, 1, 2, 2.0), -- 1 = pedido(1), 1 = Nordestino, 2 = medio, 2.0 = quantidade
(2, 2, 5, 3.0), -- 2 = pedido(2), 2 = Coca-cola, 5 = 500ml, 3.0 = quantidade
(3, 4, 1, 1.0); -- 3 = pedido(3), 4 = Pudim, 1 = pequeno, 1.0 = quantidade

