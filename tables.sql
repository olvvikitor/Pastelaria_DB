DROP DATABASE IF EXISTS pastelaria_ming_moon;
CREATE DATABASE pastelaria_ming_moon;
USE pastelaria_ming_moon;

-- Tabela de Clientes

CREATE TABLE IF NOT EXISTS clientes (
  idcliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  apelido VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  data_nascimento DATE NOT NULL,
  data_cadastro TIMESTAMP NOT NULL
);

-- Tabela de Endereços

CREATE TABLE IF NOT EXISTS enderecos (
  idendereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bairro VARCHAR(50) NOT NULL,
  logradouro VARCHAR(50) NOT NULL,
  numero VARCHAR(6) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  municipio VARCHAR(50) NOT NULL,
  uf CHAR(2) NOT NULL,
  id_cliente INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes (idcliente)
);

-- Tabela de Contatos

CREATE TABLE IF NOT EXISTS contatos (
  idcontato INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  id_cliente INT NOT NULL,
  UNIQUE INDEX email_UNIQUE (email),
  UNIQUE INDEX telefone_UNIQUE (telefone),
  FOREIGN KEY (id_cliente) REFERENCES clientes (idcliente)
);

-- Tabela de Categoria de Produtos

CREATE TABLE IF NOT EXISTS categoria_produtos (
  idcategoria_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  UNIQUE INDEX nome_UNIQUE (nome)
);
-- Tabela de Pagamentos

CREATE TABLE IF NOT EXISTS pagamentos (
  idpagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  metodo VARCHAR(30) NOT NULL
);
-- Tabela de Produtos

CREATE TABLE IF NOT EXISTS produtos (
  idproduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  validade_produto DATE NOT NULL,
  id_categoria_prod INT NOT NULL,
  UNIQUE INDEX nome_UNIQUE (nome),
  FOREIGN KEY (id_categoria_prod) REFERENCES categoria_produtos (idcategoria_produto)
);

-- Tabela de Pedidos

CREATE TABLE IF NOT EXISTS pedidos (
  idpedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  valor_total DOUBLE NOT NULL,
  data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  obs_pedido VARCHAR(50) NOT NULL,
  id_pagamento INT NOT NULL,
  id_endereco INT NOT NULL,
  id_cliente int not null,
FOREIGN KEY (id_pagamento) REFERENCES pagamentos (idpagamento),
FOREIGN KEY (id_endereco) REFERENCES enderecos (idendereco),
FOREIGN KEY (id_cliente) REFERENCES clientes (idcliente)
);

-- ... (seções anteriores permanecem inalteradas)

-- Tabela de Ingredientes

CREATE TABLE IF NOT EXISTS ingredientes (
  id_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   estoque double,
  nome VARCHAR(100) NOT NULL
);

-- Tabela de Tamanhos

CREATE TABLE IF NOT EXISTS tamanhos (
  idtamanho INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tamanho VARCHAR(15) NOT NULL
);

-- Tabela de Relacionamento entre Produtos e Ingredientes  

CREATE TABLE IF NOT EXISTS ingredientes_de_produtos (
  id_produto INT NOT NULL,
  id_ingrediente INT NOT NULL,
  qtd_ingrediente double,
  PRIMARY KEY (id_produto, id_ingrediente),
  FOREIGN KEY (id_produto) REFERENCES produtos (idproduto),
  FOREIGN KEY (id_ingrediente) REFERENCES ingredientes (id_ingrediente)
);

-- Tabela de Relacionamento entre Produtos e Tamanhos

CREATE TABLE IF NOT EXISTS tamanho_de_produtos (
  idproduto INT NOT NULL,
  idtamanho INT NOT NULL,
  preco DOUBLE NOT NULL,
  PRIMARY KEY (idproduto, idtamanho),
  FOREIGN KEY (idproduto) REFERENCES produtos (idproduto),
  FOREIGN KEY (idtamanho) REFERENCES tamanhos (idtamanho)
);

-- Tabela de Relacionamento entre Pedidos e Tamanhos

CREATE TABLE IF NOT EXISTS itens_do_pedido (
  iditens_do_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  id_tamanho INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DOUBLE NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produtos (idproduto),
  FOREIGN KEY (id_tamanho) REFERENCES tamanho_de_produtos (idtamanho),
  FOREIGN KEY (id_pedido) REFERENCES pedidos (idpedido)
);

