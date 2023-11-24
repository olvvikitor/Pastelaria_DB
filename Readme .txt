
Pastelaria Ming Moon - Banco de Dados
Descrição
Este é um banco de dados relacional para uma pastelaria fictícia chamada "Ming Moon". O banco de dados modela informações sobre clientes, endereços, contatos, categorias de produtos, produtos, ingredientes, categorias de pasteis, pasteis, pagamentos e pedidos.

Estrutura do Banco de Dados
O banco de dados consiste nas seguintes tabelas:

clientes:

Armazena informações sobre os clientes, como nome, apelido, data de nascimento e data de cadastro.
enderecos:

Contém informações de endereços associados a clientes.
contatos:

Mantém informações de contato, como e-mail e telefone, vinculadas aos clientes.
categoria_produtos:

Categoriza os produtos disponíveis na pastelaria.
produtos:

Armazena informações sobre os produtos, como nome, validade, quantidade e categoria.
ingredientes:

Registra os ingredientes usados na produção dos produtos.
categoria_pasteis:

Define categorias específicas para os pasteis, como normal, vegano, vegetariano, sem lactose, etc.
pasteis:

Contém dados sobre os pasteis, incluindo nome, preço, ingrediente e categoria.
pagamentos:

Registra os métodos de pagamento aceitos na pastelaria.
pedidos:

Armazena informações sobre os pedidos feitos pelos clientes, incluindo valor total, data do pedido, observações, cliente associado, método de pagamento e produtos pedidos.