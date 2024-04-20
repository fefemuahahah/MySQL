create database gerenciamente_estoque;
use gerenciamente_estoque;

create table if not exists fornecedores(
id_fornecedor int not null primary key,
cnpj varchar(20),
nome varchar(45),
cidade varchar(45));

create table produtos(
id_produto int not null primary key,
nome varchar(45),
descricao text,
preco decimal(10,2),
produtoscol varchar(45));

create table if not exists armazens(
id_armazen int not null primary key,
nome_armazen varchar(45),
logradouro varchar(45),
numero int,
bairro varchar(45),
cidade varchar(45),
uf char(2));

create table if not exists produtos_armazens(
id_produto int,
id_armazen int,
primary key(id_produto, id_armazen),
constraint prod_id_prod foreign key (id_produto)
 references produtos(id_produto),
constraint arma_id_arma foreign key (id_armazen)
references armazens(id_armazen));
 
create table if not exists produtos_fornecedores(
id_produto int,
id_fornecedor int,
primary key(id_produto, id_fornecedor),
constraint prod_id_prodforn foreign key (id_produto) 
references produtos(id_produto),
constraint forn_id_forn foreign key(id_fornecedor) 
references fornecedores(id_fornecedor));

create table if not exists pedidos_compra(
id_pedido int,
data_pedido datetime,
id_fornecedor int,
primary key (id_pedido, id_fornecedor),
constraint ped_forn foreign key (id_fornecedor) 
references fornecedores(id_fornecedor));

create table if not exists pedidos_produtos(
id_pedido int,
id_fornecedor int,
id_produto int,
primary key(id_pedido, id_fornecedor, id_produto),
foreign key (id_pedido) references pedidos_compra(id_pedido),
foreign key (id_fornecedor) references fornecedores(id_fornecedor),
foreign key (id_produto)references produtos(id_produto));