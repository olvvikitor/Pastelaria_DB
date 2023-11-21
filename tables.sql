create database pastelaria_ming_moon;
use pastelaria_ming_moon;

CREATE TABLE clientes (
id_cliente int primary key auto_increment,
nome varchar(255) UNIQUE NOT NULL,
apelido VARCHAR(100) UNIQUE NOT NULL,
data_nascimento DATE UNIQUE NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table enderecos(
id_endereco int primary key auto_increment,
bairro VARCHAR(50) NOT NULL,
logradouro VARCHAR(50) NOT NULL,
numero VARCHAR(10) NOT NULL,
cep VARCHAR(8) NULL,
municipio VARCHAR(50) NOT NULL,
uf CHAR(2) NOT NULL,
cod_cliente INT NOT NULL
);

create table contatos(
id_contato int primary key auto_increment,
email VARCHAR(255) UNIQUE NOT NULL,
telefone VARCHAR(20) UNIQUE NOT NULL,
whatsapp VARCHAR(20) UNIQUE NOT NULL,
id_cliente int not null
);

create table categorias(
id_categoria int primary key not null,
nome varchar(50) UNIQUE NOT NULL
);

create table produtos(
id_produto int auto_increment primary key not null,
nome varchar(255) UNIQUE NOT NULL,
validade_produto date UNIQUE NOT NULL,
quantidade double UNIQUE NOT NULL,
id_categoria int not null,
foreign key(id_categoria) references categorias(id_categoria)
); 

create table ingredientes(
id_ingrediente int not null auto_increment primary key,
nome varchar(100) UNIQUE NOT NULL,
id_produto int not null
);

create table pasteis(
id_pastel int not null primary key auto_increment,
nome varchar(200) UNIQUE NOT NULL,
preco double UNIQUE NOT NULL,
id_ingrediente int not null
);

create table pedidos(
id_pedido int not null primary key auto_increment,
valor_total double not null,
data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_clientes int not null,
id_pagamento int not null,
obs_pedido varchar(50)
);

create table pagamento (
id_pagamento int not null pr
);