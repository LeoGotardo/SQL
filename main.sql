drop schema if exists loja2022;

create schema loja2023;

use loja2023;

create table paises(
id_pais int not null  auto_increment,
nome varchar(50) not null,
primary key (id_pais));

create table cidades(
id_cidade int not null auto_increment primary key,
nome varchar(50) not null,
    id_pais int not null,
UF char(2),
foreign key (id_pais) references paises(id_pais));
   
create table categorias(
nome varchar(50) not null,
    id_categoria int not null auto_increment primary key);

insert into paises values (1, "Brasil");
insert into paises values (2, "Argentina");
insert into paises values (3, "Paraguai");
insert into paises values (4, "Uruguai");
insert into paises values (5, "Colombia");  

SELECT id_pais FROM paises;
