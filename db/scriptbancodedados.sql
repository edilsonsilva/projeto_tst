create database tstdb;
use tstdb;
create table usuario(
idusuario int auto_increment primary key,
nomeusuario varchar(30) not null unique,
senha varchar(200) not null,
nomecompleto varchar(100) not null,
cpf varchar(20) not null unique,
sexo varchar(15) not null,
idade int not null,
email varchar(100),
telefone varchar(30) not null,
datacriacao timestamp default current_timestamp()
)engine InnoDB;

create table epi(
idepi int auto_increment primary key,
nomeepi varchar(50) not null,
descricao text,
datavalidade date
)engine InnoDB;

create table retirada_devolucao(
idretirada_devolucao int auto_increment primary key,
idepi int,
idusuario int,
dataretirada timestamp default current_timestamp(),
devolvido varchar(10) not null default "Não",
datadevolucao datetime
)engine InnoDB;
