-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, apelido, data_nascimento) VALUES
('João Silva', 'Joãozinho', '1985-03-15'),
('Maria Oliveira', 'Mariazinha', '1992-09-22');

-- Inserir dados na tabela enderecos
INSERT INTO enderecos (bairro, logradouro, numero, cep, municipio, uf, id_cliente) VALUES
('Centro', 'Rua Principal', '123', '12345678', 'Cidade1', 'UF1', 1),
('Vila Alegre', 'Avenida Central', '456', '87654321', 'Cidade2', 'UF2', 2);

-- Inserir dados na tabela contatos
INSERT INTO contatos (email, telefone, id_cliente) VALUES
('joao.silva@email.com', '123456789', 1),
('maria.oliveira@email.com', '987654321', 2);

-- Inserir dados na tabela categoria_produtos
INSERT INTO categoria_produtos (id_categoria_prod, nome) VALUES
(1, 'Carnes'),
(2, 'Vegetais'),
(3, 'Refrigereantes'),
(4, 'Doces');

-- Inserir dados na tabela produtos
INSERT INTO produtos (nome, validade_produto, quantidade, id_categoria_prod) VALUES
('Carne Bovina', '2023-01-01', 10.5, 1),
('Brócolis', '2023-02-01', 15.0, 2),
('Substituto de Carne Vegana', '2023-03-01', 20.0, 3),
('Leite Sem Lactose', '2023-04-01', 5.0, 4);

-- Inserir dados na tabela ingredientes
INSERT INTO ingredientes (nome, id_produto) VALUES
('Ingrediente Carne', 1),
('Ingrediente Brócolis', 2),
('Ingrediente Vegano', 3),
('Ingrediente Sem Lactose', 4);

-- Inserir dados na tabela categoria_pasteis
INSERT INTO categoria_pasteis (nome) VALUES
('Normal'),
('Vegano'),
('Vegetariano'),
('Sem Lactose');

-- Inserir dados na tabela pasteis
INSERT INTO pasteis (nome, preco, id_ingrediente, id_categoria_pastel) VALUES
('Pastel de Carne', 5.99, 1, 1), -- Normal
('Pastel de Legumes', 6.99, 2, 3), -- Vegetariano
('Pastel de Frango Vegano', 7.99, 3, 2), -- Vegano
('Pastel Sem Lactose', 8.99, 4, 4); -- Sem Lactose

