drop schema if exists NomeDoBanco; -- Deleta o Banco de Dados (Se ja existir um), desnecessario.

create schema NomeDoBanco;  -- Cria o Banco de Dados.

use NomeDoBanco; -- Usa o Banco.

create table NomeDaTabela( -- Cria uma tabela.
	NomeDoAtributo int  not null  auto_increment,  -- Define um atributo como INT, não permite ser vazio e habilita o Auto-conplete.
    NomeDoOutroAbributo varchar(50), -- Define um atributo como char(50 espaços).
    primary key (NomeDoAtributo) -- Define o atributo como chave primaria.
);

create table OutraTabela(
	NomeDoAtributo varchar(50), -- 
    NomeDoOutroAtributo int  not null  auto_increment primary key, -- Define um atributo como INT, não permite ser vazio, habilita o Auto-conplete e defeine como chave primaria.
	
    foreign key(NomeDoAtributo) references NomeDaTabela(NomeDoAtributo) -- Define o atributo como uma chave primaria.
);

insert into NomeDaTabela values(1, "Colombia"); -- Adiciona valores a uma tabela.

select * from NomeDaTabela; -- Mostra a tabela selecionada.

show schemas; -- Mostra os esquemas.
show databases; -- Mostra as data baases.

show table status; -- Mostra  info.

show create table NomeDaTabela; -- Monstra info.

show columns from NomeDaTabela; -- Mostra colunas da tabela.

describe NomeDaTabela; -- Mostra tabela.

desc NomeDaTbela; -- Mesma coisa do describe.
