-- 1 passo:
-- criar a base de dados (create schem ou create databse)
create database if not exists PROVA_SI1N;
-- OU create schema if not exists prova_SI1N;
-- IF NOT EXISTS: NÃO CRIA SE JA HOUVER CRIADO

-- 2 PASSO:
-- CARREGAR A BASE DE DADOS CRIADA PARA O USO
use PROVA_SI1N;

-- 3 PASSO: 
-- CRIAR AS TABELAS SEM CHAVE ESTRANGEIRA
create table if not exists ALUNO(
matricula int primary key,
nome varchar(100) not null,
data_nasc date not null
);
create table if not exists PROFESSOR(
num_id int primary key,
nome varchar(100) not null,
especializacao varchar(100) not null);

create table if not exists CURSO(
cod_curso int primary key,
nome varchar(100),
duracao varchar(50) not null);

-- 4 PASSO:
-- CRIAR AS TABELAS COM CHAVE ETRANGEIRA
create table if not exists DISCIPLINA(
CODIGO int primary key,
noem_disc varchar(100),
carga_horaria int not null,
cod_curso int not null,
constraint cur_dis foreign key(cod_curso) references curso(cod_curso));

-- 5 PASSO:
-- CRIAR AS ENTIDADES ASSOCIATIVAS, SE HOUVER.
create table if not exists ALUNOS_DISCIPLNAS(
matricula int,
codigo int,
primary key(matricula,codigo),
foreign key(matricula) references aluno(matricula),
foreign key(codigo) references disciplina(codigo));

create table if not exists ALUNOS_CURSOS(
matricula int,
cod_curso int,
primary key(matricula,cod_curso),
foreign key(matricula) references aluno(matricula),
foreign key(cod_curso) references curso(cod_curso));

create table if not exists CURSO_PROFESSOR(
num_reg int,
cod_curso int,
primary key(num_reg,cod_curso),
foreign key(num_reg) references professor(num_id),
foreign key(cod_curso) references curso(cod_curso));