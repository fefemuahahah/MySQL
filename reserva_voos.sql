create database reserva_voos;
use reserva_voos;

create table if not exists passageiros(
cod_passageiro varchar(15) primary key not null,
nome varchar(20),
sobrenome varchar(50),
data_nasc date,
nacionalidade varchar(45));

create table if not exists cias_aereas(
id_cia int primary key not null,
nome varchar(45),
cnpj varchar(45));

create table if not exists reservas_voo(
cod_reserva int primary key not null,
data_reserva varchar(45),
forma_pagamento enum("dinheiro", "pix", "credito", "debito"),
valor_total decimal(10,2));

create table if not exists aeroportos(
cod_aeroporto varchar(50));

create table if not exists aeronave(
cod_aeronave int primary key not null,
modelo varchar(45),
fabricante varchar(45),
ano year,
quantidade_assentos int,
aero_id_cia int not null,
constraint aereas_id_cia foreign key(aero_id_cia) references cias_aereas(id_cia));

create table if not exists passageiros_reserva(
cod_passageiro varchar(15),
cod_reserva int,
primary key(cod_passageiro, cod_reserva),
constraint passageiros_cod_passageiro foreign key(cod_passageiro) references passageiros(cod_passageiro));

create table if not exists voos(
id_voo int,
assento varchar(45),
data_partida date,
data_chegada_prev date,
hora_partida time,
hora_chegada_prev time,
cod_aeronave int not null,
cia_aerea int not null,
primary key(id_voo, assento),
constraint cia_voos foreign key (cia_aerea)references cias_aereas(id_cia),
constraint aeronavets foreign key(cod_aeronave)references aeronave(cod_aeronave));

