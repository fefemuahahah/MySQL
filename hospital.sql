create database hospital;
use hospital;

create table if not exists pacientes(
cpf_paciente varchar(15) primary key,
nome varchar(45) not null,
data_nasc date not null,
telefone varchar(45) not null,
email varchar(45));

create table if not exists departamentos(
cod_especialidade int primary key,
nome_especialidade varchar(45));

create table if not exists medicos(
crm int,
uf char(2),
primary key(crm, uf),
nome varchar(45) not null,
email varchar(45) not null,
telefone varchar(45) not null,
depto_cod_espec int not null,
constraint depto_med foreign key(depto_cod_espec) references departamentos(cod_especialidade));

create table if not exists consultas(
anamnese text not null,
data_cons date not null,
hora_cons time not null,
crm int not null,
uf char(2) not null,
cpf_paciente varchar(15) not null,
constraint med_cons foreign key(crm, uf) references medicos(crm, uf),
constraint pac_cons foreign key (cpf_paciente) references pacientes(cpf_paciente));

