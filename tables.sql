drop database pastelaria_ming_moon;
create database  pastelaria_ming_moon;
use pastelaria_ming_moon;

CREATE TABLE clientes (
id_cliente int primary key auto_increment,
nome varchar(255)  NOT NULL,
apelido VARCHAR(100)  NOT NULL,
data_nascimento DATE  NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table enderecos(
id_endereco int primary key auto_increment,
bairro VARCHAR(50) NOT NULL,
logradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
cep VARCHAR(8) NULL,
municipio VARCHAR(50) NOT NULL,
uf CHAR(2) NOT NULL,
id_cliente INT NOT NULL,
foreign key(id_cliente) references clientes(id_cliente)
);

create table contatos(
id_contato int primary key auto_increment,
email VARCHAR(255) UNIQUE NOT NULL,
telefone VARCHAR(20) UNIQUE NOT NULL,
id_cliente int not null,
foreign key(id_cliente) references clientes(id_cliente)
);

create table categoria_produtos(
id_categoria_prod int primary key not null,
nome varchar(50) UNIQUE NOT NULL
);

create table produtos(
id_produto int auto_increment primary key not null,
nome varchar(255) UNIQUE NOT NULL,
validade_produto date NOT NULL,
quantidade double NOT NULL,
id_categoria_prod int not null,
foreign key(id_categoria_prod) references categoria_produtos(id_categoria_prod)
); 

create table ingredientes(
id_ingrediente int not null auto_increment primary key,
nome varchar(100) NOT NULL,
id_produto int not null,
foreign key(id_produto) references produtos(id_produto)
);
create table categoria_pasteis(
id_categoria_pastel int not null auto_increment primary key,
nome varchar(20)
);

create table pasteis(
id_pastel int not null primary key auto_increment,
nome varchar(200) UNIQUE NOT NULL,
preco double NOT NULL,
id_ingrediente int not null,
id_categoria_pastel int not null,
foreign key(id_categoria_pastel) references categoria_pasteis(id_categoria_pastel),
foreign key(id_ingrediente) references ingredientes(id_ingrediente)
);

create table pagamentos (
id_pagamento int not null primary key auto_increment,
metodo varchar (30) not null
);

create table pedidos(
id_pedido int not null primary key auto_increment,
valor_total double not null,
data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
obs_pedido varchar(50),
id_cliente int not null,
id_pagamento int not null,
foreign key(id_cliente) references clientes(id_cliente),
foreign key(id_pagamento) references pagamentos(id_pagamento)
);