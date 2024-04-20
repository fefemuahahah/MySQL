create database rede_social;
use rede_social;

create table if not exists usuarios(
id_usuario int not null primary key,
nome varchar(45),
sobrenome varchar(45),
email varchar(45));

create table if not exists grupos(
id_group int not null primary key,
nome_grupo varchar(45),
descricao text);

-- com chaves
create table if not exists usuarios_grupos(
id_usuario int,
id_group int,
primary key(id_usuario, id_group),
constraint usuarios_id_usuario foreign key(id_usuario)
references usuarios(id_usuario),
constraint grupos_id_group foreign key (id_group)
references grupos(id_group));

create table if not exists postagens(
id_post int,
texto text,
imagem blob,
data_hora datetime,
id_usuario int,
primary key(id_post, id_usuario),
constraint postagens_id_usuario foreign key (id_usuario)
references usuarios(id_usuario));

create table if not exists comentarios(
id_comment int,
texto text,
datahora datetime,
id_usuario int,
id_post int,
primary key(id_comment, id_usuario, id_post),
constraint coment_id_usuario foreign key (id_usuario)
references usuarios(id_usuario),
constraint coment_id_post foreign key (id_post)
references postagens(id_post));
