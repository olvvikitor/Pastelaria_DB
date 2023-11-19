use pastelaria_ming_moon;

CREATE TABLE clientes (
id_client int primary key auto_increment,
nome varchar(255) not null,
sobrenome VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
telefone VARCHAR(20),
data_nascimento DATE,
endereco VARCHAR(255),
cidade VARCHAR(100),
estado VARCHAR(50),
cep VARCHAR(10),
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table categorias(
id_categoria int primary key not null,
nome varchar(50)
);

create table produtos(
id_produto int auto_increment primary key not null,
nome varchar(255),
validade_produto date,
quantidade double,
id_categoria int,
foreign key(id_categoria) references categorias(id_categoria)
); 
create table ingredientes(
id_ingrediente int not null auto_increment primary key,
nome varchar(100) not null,
id_produto int,
foreign key(id_produto) references produtos(id_produto)
);

create table pasteis(
id_pastel int not null primary key auto_increment,
nome varchar(200) unique,
preco double,
id_ingrediente int,
foreign key(id_ingrediente) references ingredientes(id_ingrediente));













