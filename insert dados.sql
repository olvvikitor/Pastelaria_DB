
-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, apelido, cpf, data_nascimento, data_cadastro) VALUES
('João Silva', 'Joãozinho', '123.456.789-10', '1985-03-15', CURRENT_TIMESTAMP),
('Maria Oliveira', 'Mariazinha', '019.876.543-21', '1992-09-22', CURRENT_TIMESTAMP),
('Carlos Pereira', 'Carlinhos', '987.654.321-01', '1980-07-10', CURRENT_TIMESTAMP),
('Ana Souza', 'Aninha', '234.567.890-12', '1995-05-18', CURRENT_TIMESTAMP),
('Roberto Santos', 'Beto', '876.543.210-34', '1988-12-03', CURRENT_TIMESTAMP),
('Luciana Lima', 'Lu', '543.210.987-45', '1990-02-28', CURRENT_TIMESTAMP),
('Ricardo Costa', 'Rick', '765.432.109-56', '1982-06-07', CURRENT_TIMESTAMP),
('Fernanda Rodrigues', 'Fê', '321.098.765-67', '1998-11-14', CURRENT_TIMESTAMP),
('Pedro Almeida', 'Pedrinho', '654.321.098-78', '1987-04-25', CURRENT_TIMESTAMP),
('Gisele Oliveira', 'Gi', '210.987.654-89', '1993-08-31', CURRENT_TIMESTAMP);
select * from clientes;

-- Inserir dados na tabela enderecos
INSERT INTO enderecos (bairro, logradouro, numero, cep, municipio, uf, id_cliente) VALUES
('Centro', 'Rua Principal', '123', '12', 'Cidade1', 'BA', 1),
('Vila Alegre', 'Avenida Central', '456', '87654321', 'Cidade2', 'SP', 2),
('Jardim Floresta', 'Rua das Flores', '789', '98765432', 'Cidade3', 'RJ', 3),
('Parque das Aves', 'Alameda dos Pássaros', '101', '12345678', 'Cidade4', 'MG', 4),
('Centro Histórico', 'Praça da Independência', '234', '87654321', 'Cidade5', 'SP', 5),
('Bela Vista', 'Avenida Panorâmica', '567', '45678901', 'Cidade6', 'RS', 6),
('Jardim Primavera', 'Travessa das Tulipas', '303', '23456789', 'Cidade7', 'SC', 7),
('Campo Verde', 'Estrada Rural', '999', '34567890', 'Cidade8', 'PR', 8),
('Vista Linda', 'Rua dos Mirantes', '808', '56789012', 'Cidade9', 'GO', 9),
('Monte Azul', 'Avenida das Montanhas', '111', '67890123', 'Cidade10', 'PA', 10);
select * from enderecos;

-- Inserir dados na tabela contatos
INSERT INTO contatos (email, telefone, id_cliente) VALUES
('joao.silva@email.com', '123456789', 1),
('maria.oliveira@email.com', '987654321', 2),
('carlos.pereira@email.com', '876543210', 3),
('ana.souza@email.com', '234567890', 4),
('roberto.santos@email.com', '765432103', 5),
('luciana.lima@email.com', '543210987', 6),
('ricardo.costa@email.com', '321098765', 7),
('fernanda.rodrigues@email.com', '654321098', 8),
('pedro.almeida@email.com', '210987654', 9),
('gisele.oliveira@email.com', '789012345', 10);
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
('Pudim', '2024-04-01', 4),
("Capim santo",'2024-04-01', 1),
('Cachorro diferente', '2024-05-01', 1),
('Pepsi', '2024-06-01', 2),
('Suco de Limão', '2024-07-01', 3),
('Brigadeiro', '2024-08-01', 4),
('Delícia Paulista', '2024-09-01', 1),
('Queijo Maravilha', '2024-10-01', 1),
('Frango da Alegria', '2024-11-01', 1),
('Rei Banana', '2024-12-01', 1),
("Mario faminto",'2024-04-01',1);
select * from produtos;

-- Inserir dados na tabela ingredientes
INSERT INTO ingredientes (nome) VALUES
('Carne'), 
('Carne Seca'),
('Brócolis'),
('Vegano'),
('Sem Lactose'),
('Frango'),
('Queijo'),
('Presunto'),
('Tomate'),
('Molho Barbecue'),
('Calabresa'),
('Catupiry'),
('Milho'),
('Banana'),
('Morango'),
('Bacon'),
('Cogumelo vermelho');
select * from ingredientes;

-- Ligação entre produtos e os seus ingredientes
INSERT INTO ingredientes_de_produtos (id_produto, id_ingrediente) VALUES
(1, 2), -- Nordestino(ADD = Carne Seca)
(1, 6), -- Nordestino(Carne Seca,ADD = Frango)
(5, 3), -- Capim santo(ADD = Brocolis)
(5, 4), -- Capim santo(Brocolis, Add = vegano)
(6, 8), -- Cachorro diferente(ADD = Presunto)
(6, 11), -- Cachorro diferente(Presunto, ADD = Calabresa)
(6, 12), -- Cachorro diferente(Presunto, Calabresa, ADD = Catupiry)
(10, 7), -- Delícia Paulista(ADD = Queijo)
(10, 16), -- Delícia Paulista(Queijo, ADD = Bacon)
(10, 10), -- Delícia Paulista(Queijo, Bacon, ADD = Molho Barbecue)
(11, 7), -- Queijo Maravilha(ADD = Queijo)
(11, 8), -- Queijo Maravilha(Queijo, ADD = Presunto)
(11, 12), -- Queijo Maravilha(Queijo, Presunto, ADD = Catupiry)
(11, 13), -- Queijo Maravilha(Queijo, Presunto, Catupiry, ADD = Milho)
(12, 6), -- Frango da Alegria(ADD = Frango)
(12, 2), -- Frango da Alegria(Frango, ADD = Carne Seca)
(12, 11), -- Frango da Alegria(Frango, Carne Seca, ADD = Calabresa)
(13, 9), -- Rei Banana(ADD = Tomate)
(13, 14), -- Rei Banana(Tomate, ADD = Banana)
(14,17),-- Mario faminto(ADD = Cogumelo vermelho)
(14,9); -- Mario faminto(Cogumelo vermelho, add = tomate)

select * from ingredientes_de_produtos;

INSERt INTO tamanhos (tamanho) VALUES
('Pequeno'),
('Medio'),
('Grande'),
('200ml'),
('500ml'),
('1L');
select * from tamanhos;

INSERT INTO tamanho_de_produtos (idproduto, idtamanho, preco) VALUES
(1, 1, 5.00), -- Nordestino (Pequeno)
(1, 2, 7.00), -- Nordestino (Médio)
(1, 3, 10.00), -- Nordestino (Grande)
(2, 4, 3.00), -- Coca-cola (200ml)
(2, 5, 5.00), -- Coca-cola (500ml)
(2, 6, 8.00), -- Coca-cola (1L)
(5, 1, 6.00), -- Capim santo (Pequeno)
(5, 2, 9.00), -- Capim santo (Médio)
(5, 3, 13.00), -- Capim santo (Grande)
(6, 1, 4.00), -- Cachorro Diferente(Pequeno)
(6, 2, 6.00), -- Cachorro Diferente(Medio)
(6, 3, 7.00), -- Cachorro Diferente(Grande)
(10, 1, 6.50), -- Delícia Paulista(Pequeno)
(10, 2, 7.50), -- Delícia Paulista(Medio)
(10, 3, 8.50), -- Delícia Paulista(Grande)
(11, 1, 4.99), -- Queijo Maravilha(Pequeno)
(11, 2, 6.99), -- Queijo Maravilha(Medio)
(11, 3, 7.99), -- Queijo Maravilha(Grande)
(12, 1, 4.99), -- Frango da Alegria(Pequeno)
(12, 2, 6.99), -- Frango da Alegria(Medio)
(12, 3, 7.99), -- Frango da Alegria(Grande)
(13, 1, 4.99), -- Rei Banana(Pequeno)
(13, 2, 6.99), -- Rei Banana(Medio)
(14 ,1, 7.99),  -- Mario faminto(pequeno)
(14 ,2, 7.99),  -- Mario faminto(medio)
(14 ,3, 7.99);  -- Mario faminto(grande)
select * from tamanho_de_produtos;

-- Inserir dados na tabela pagamentos
INSERT INTO pagamentos (metodo) VALUES
('Cartão de Crédito'),
('Dinheiro'),
('PIX'),
('Cartão de Debito');


-- Inserir dados na tabela pedidos
INSERT INTO pedidos (valor_total, obs_pedido, id_pagamento, id_endereco, id_cliente) VALUES
(0, 'Pedido normal', 1, 1, 1),
(0, 'Pedido urgente', 2, 2, 2),
(0, 'Pedido rapido', 3, 1, 1),
(0, 'Pedido especial', 4, 3, 3),
(0, 'Pedido festivo', 3, 4, 4),
(0, 'Pedido surpresa', 2, 2, 2),
(0, 'Pedido tranquilo', 1, 5, 5),
(0, 'Pedido único', 3, 6, 6),
(0, 'Pedido misterioso', 1, 7, 7),
(0, 'Pedido especial', 4, 3, 1);
-- Inserir dados na tabela itens_do_pedido
INSERT INTO itens_do_pedido (id_pedido, id_produto, id_tamanho, quantidade, preco_unitario) VALUES
-- Nordestino (Médio)
(1, 1, 2, 2, 7.00),
(1, 1, 2, 5, 7.00),
-- Coca-cola (500ml)
(2, 2, 5, 5, 5.00),
-- Pudim (Pequeno)
(3, 4, 1, 1, 6.00),
-- Capim santo(Grande)
(4, 5, 3, 3, 13.00),
(4, 5, 5, 2, 5.00),
-- Cachorro diferente(Pequeno, Medio)
(5, 6, 1, 1, 4.00),
(5, 6, 2, 2, 6.00),
-- Delicia Paulista(Grande)
(6, 10, 3, 4, 8.50),
-- Queijo Maravilha(Medio)
(7, 11, 2, 1, 6.99),
-- Frango da Alegria
(8, 12, 1, 2, 4.99),
-- Rei Banana
(9, 13, 3, 4, 7.99),
(9, 13, 3, 2, 7.99);

select * from pedidos;
