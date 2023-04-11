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
UF char(2),
id_pais int not null,
foreign key (id_pais) references paises(id_pais));
   
create table categorias(
nome varchar(50) not null,
id_categoria int not null auto_increment primary key);

insert into paises values 
(1, "Brasil"), 
(2, "Argentina"),
(3, "Paraguai"), 
(4, "Uruguai"), 
(5, "Colombia");  

insert into paises(nome) values 
("Portugal"), 
("Espanha"),
("Alemanha"), 
("Estados Unidos"), 
("Canadá"),
("Australia"), 
("Belgica"),
("Uganda"), 
("Nigeria"), 
("Tokyo"),
("Porto Rico"), 
("Piru"),
("Paquistão"), 
("Mongolia"), 
("Mexico");

insert into cidades values
(1, "Londrina", "PR", 1),
(2, "Cambé", "PR", 1),
(3, "São Paulo", "SP", 1),
(4, "Campinas", "SP", 1),
(5, "Curitiba", "PR", 1);

insert into cidades(nome, UF, id_pais) values
("Maringá", "PR", 1),
("Barracão", "PR", 1),
("Dionísio Cerqueira", "SC", 1),
("Buenos Aires", NULL, 2),
("Curitiba", NULL, 1);


SELECT * FROM paises;
SELECT * FROM cidades;

describe cidades;
