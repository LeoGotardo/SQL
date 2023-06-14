-- DDL - Verifica se o banco loja_2022
-- existe, caso exista vai removê-lo, caso contrário
-- apresenta uma advertência que indica que o banco
-- ainda não existe
drop schema if exists loja_2022_ABD;

-- DDL - Cria o BD loja_2022
create schema loja_2022_ABD;

-- DDL - Seleciona - habilita o BD loja_2022 para o uso
use loja_2022_ABD;


-- DDL - Criação tabela Paises
create table Paises(
	ID_pais int not null auto_increment,
    nome varchar(50) not null,
    primary key (ID_pais)
);

-- DDL - Criação tabela Cidades
create table Cidades(
	ID_cidade int not null auto_increment primary key,
    nome varchar(50) not null,
    UF char(2),
    ID_pais int not null,
    foreign key(ID_pais) references Paises(ID_pais)
);


create table Categorias(
	ID_categoria int not null auto_increment primary key,
    nome varchar(50) not null
);

-- DML - inserção de registros na tabela de Paises
insert into Paises values (1, "Brasil");
insert into Paises values (2, "Argentina");
insert into Paises values (3, "Paraguai");
insert into Paises values (4, "Uruguai");
insert into Paises values (5, "Chile");


-- DML - Segunda forma de inserção 
insert into Paises(nome) values
	("Portugal"),("Espanha"),("Alemanha"),("Estados Unidos"),("Canadá");
    

insert into Cidades values
	(1, "Londrina", "PR", 1);
    
insert into Cidades values
	(2, "Cambé", "PR", 1);    
    
insert into Cidades values
	(3, "São Paulo", "SP", 1);
    
insert into Cidades values
	(4, "Campinas", "SP", 1);
    
insert into Cidades values
	(5, "Curitiba", "PR", 1);
    
-- select * from Cidades;    

insert into Cidades (nome, UF, ID_pais) values
	("Maringá", "PR", 1),
    ("Barracão", "PR", 1),
    ("Dionísio Cerqueira", "SC", 1),
    ("Buenos Aires", null, 2),
    ("Salto", null, 2);
    

insert into Paises(nome) values
	("Inglaterra"),
    ("Japao"),
    ("Mexico"),
    ("Dinamarca"),
    ("França");

insert into Cidades (nome, UF, ID_pais) values
	("Porto Alegre", "RS", 1),
    ("Rio de Janeiro", "RJ", 1),
    ("Caxias do Sul", "RS", 1),
    ("Palmas", "PR", 1),
    ("Palmas", "TO", 1),
    ("Paris", null, 15),
    ("Londres", null, 11),
    ("Berlim", null, 8),
    ("Madrid", null, 7),
    ("Santiago", null, 5);


insert into Paises(nome) values
	("Camaroes"),
    ("Madagascar");

-- DML - update (atualiza) - um registro
update Paises 
set nome = "Camarões"
where ID_pais = 21;

update Paises 
set nome = "Madagáscar" 
where ID_pais = 22;    

-- DML - Inserção de registros na tabela de Categorias
insert into Categorias (nome) values
("Eletrônicos"), ("ALimentos e Bebidas"),
("Cama, mesa e banho"), ("Esporte e lazer"),
("Emalagens"),("Materiais de Limpeza"),
("Bebês e crianças"),("Brinquedos"),
("Games"),("Livros");

-- select * from Categorias;

update Categorias 
set nome = "Alimentos e Bebidas" 
where ID_categoria = 2;    

update Categorias 
set nome = "Embalagens" 
where ID_categoria = 5;


update Categorias 
set nome = "Jogos" 
where ID_categoria = 9;

insert into Categorias (nome) values
("Perfumaria"), ("Moda Mulher"),
("Moda Homem"), ("Moda Infantil"),
("Comésticos"),("Produtos para o cabelo"),
("Medicamentos"),("Produtos naturais"),
("Produtos veganos"),("Medicamentos naturais");

-- DDL - Criação da tabela de Produto
create table if not exists Produto(
	ID_produto int not null auto_increment primary key,
    nome varchar(50) not null,
    qtd int not null,
    qtd_min int not null,
    valor decimal(6,2) not null,
    ID_categoria int not null,
    foreign key (ID_categoria) references Categorias(ID_categoria)
);


rename table Produto to Produtos;	

-- DDL - Alter table - Alteração na tabela de Produtos - Adição de campo
alter table Produtos
	add observacao varchar(50) not null;

-- DDL - Alter table - Alteração na tabela de Produtos - Remoção de campo
alter table Produtos
	drop observacao;

-- DDL - Alter table - Alteração na tabela de Produtos - Remoção de campo
alter table Produtos
	drop valor;

-- DDL - Alter table - Alteração na tabela de Produtos - Remoção de campo
alter table Produtos
	add valor decimal(10,2) not null;

-- DML - Inserção de registros na tabelas de Produtos    
insert into Produtos values 
(1, "Harry Potter e a Pedra Filosofal", 50, 10, 10, 28.50);    
    
insert into Produtos values 
(2, "A culpa é das Estrelas", 40, 15, 10, 20.79);

insert into Produtos values 
(3, "FIFA 2021", 100, 30, 9, 130.90);    
    
insert into Produtos values 
(4, "iPhone 12", 20, 5, 1, 6890.99); 

insert into Produtos values 
(5, "A menina que Roubava Livros", 40, 10, 10, 28.50);    
    
insert into Produtos values 
(6, "Introdução a sistemas de bancos de dados", 20, 5, 10, 280.69);

insert into Produtos values 
(7, "Bola de futebol", 100, 30, 4, 117.98);    
    
insert into Produtos values 
(8, "PS5", 20, 5, 1, 6658.20);    

insert into Produtos values 
(9, "Fortnite", 80, 40, 9, 249.99);    
    
insert into Produtos values 
(10, "Samsung Galaxy S20", 200, 50, 1, 3250.50);    


-- DDL - Criação da tabela de Pessoas
create table Pessoas(
	ID_pessoa int not null auto_increment primary key,
    nome varchar(50) not null,
    rua varchar(30) not null,
    ID_cidade int not null,
    CEP varchar(10),
    telefone varchar(20),
    email varchar(80),
    foreign key (ID_cidade) references Cidades(ID_cidade)
);

-- DDL - Alter table - alteração da estrutura física da tabela
-- Inclusão do atributo numero - varchar (15) - não nulo
alter table Pessoas
add numero varchar(15) not null;

-- Inclusão do atributo complemento - varchar (20) e do atributo observacao 
-- varchar (80)
alter table Pessoas
	add complemento varchar(20),
    add observacao varchar(80);


-- Remover o atributo observacao da tabela de Pessoas
alter table Pessoas
	drop observacao;

    
-- DML - Inserção de registros na tabela de Pessoas
insert into Pessoas values
(1, "João Lucas Freitas","Rua das Flores", 1, "86666-001",
"(43)3376-9876","jl_freitas@email.com", "12", "casa");

insert into Pessoas values
(2, "Juliana Pires","Rua Alagoas", 1, "86555-001",
"(43)3323-6776","j_pires@email.com", "102", "ap 704");    

insert into Pessoas values
(3, "Betina Nunes", "Avenida JK", 1, "86987-121", "(43)3386-5567",
 "b_nunes@email.com", 987, "casa");

insert into Pessoas values
(4, "Antonio Gonzaga", "Calle de Mejico", 19, "27813", "+34 922 84 9410", 
"antonio_gonzaga@email.com", 34, "ap 102");

insert into Pessoas values
(5, "Marina Freitas", "Avenida JK", 1, "86987-121", "(43)3379-7576", 
"m_freitas@empresa.com", 1256, "ap 1004");

insert into Pessoas values
(6, "Juan Gomes", "Av. Corrientes", 9, "C1193 CABA", "+54 800-222-2299", 
"m_gomes@email.com", 2321, null);

insert into Pessoas values
(7, "João Paulo Gonçalves", "Rua João XXIII", 1, "86060-050", "(43)3378-8765", 
"jp_goncalves@email.com", 200, null);

insert into Pessoas values
(8, "Rita Farias", "Rua Lina Nazatto", 1, "86088-400", "(43)3801-6419", 
"r_farias@email.com", 352, "casa");

insert into Pessoas values
(9, "Camila Rodrigues", "Rua Belo Horizonte", 1, "86055-120", "(43)3870-8471", 
"c_rodrigues@email.com", 395, "ap 1001");

insert into Pessoas values
(10, "Paulo Souza", "Rua Antonio Rasteiro", 2, "86192-189", "(43)99789-8989", 
"p_souza@email.com", 575, null);

insert into Pessoas values
(11, "Gabrielly Aline Araújo","Avenida 7 de setembro", 5, "80230-085",
"(41) 99456-8909","ga_araujo@email.com", "1270", "ap 1003");

insert into Pessoas values
(12, "Lucas Viana","Rua Padre Germano Mayer", 6, "87014-987",
"(44)3221-5678","l_viana@email.com", "1089", null);   	

insert into Pessoas values
(13, "Paulo Fogaça", "Avenida Colombo", 6, "87654-987", "(44)3286-1268",
 "p_fogaca@email.com", "987", "casa");

insert into Pessoas values
(14, "Paloma Castro", "Plaza de Cibelles", 19, "28005", "+34 987 32 3416", 
"p_castro@email.com", "34", null);

insert into Pessoas values
(15, "Bruno Medeiros", "Rua Ibiporã", 1, "86765-234", "(43)3361-3443", 
"b_medeiros@empresa.com", "876", "ap 104");

insert into Pessoas values
(16, "Pablo Gomes", "Migueletes", 9, "C1426 CABA", "+54 11-272-1990", 
"p_gomes@email.com", "1075", null);

insert into Pessoas values
(17, "Júlio Cabral", "Rua Clevelândia", 1, "86068-152", "(43)3368-4343", 
"j_cabral@email.com", "276", null);

insert into Pessoas values
(18, "Rosana Antunes", "Rua Goiás", 1, "86077-403", "(43)3801-6419", 
"r_antunes@email.com", "1234", "casa");

insert into Pessoas values
(19, "Kátia Gulart", "Rua Paranaguá", 1, "86765-876", "(43)3361-1571", 
"k_gulart@email.com", "987", "ap 101");

insert into Pessoas values
(20, "João Paulo Andrade", "Avenida Inglaterra", 2, "86184-310",
"(43)99123-1212", "jp_andrade@email.com", "300", null);

insert into Pessoas values
(21, "Fatima Mendes","Conjunto Vivi Xavier", 1, "86230-085",
"(41) 3824-2914","f_mendes@email.com", "830", null);

insert into Pessoas values
(22, "Pietro Gráfica","Estrada Brasílio de Lima", 3, "09822-020",
"(44)3221-5678","p_grafica@email.com", "784", "Parque Botujuru");   
	
insert into Pessoas values
(23, "Natália e Kevin Pizzaria Ltda", "Rua Said Mansur", 3, 
"09822-020", "(11) 3668-2621", "nk_pizzaria@email.com", "2345", null);

insert into Pessoas values
(24, "Marli e Paulo Buffet ME", "Rua das Araucárias", 5, 
"80304-320", "(41) 3791-7057", "mp_buffet@email.com", "34", null);

insert into Pessoas values
(25, "Thomas e Anthony Adega ME", "Jardinete Dom Krause", 5, 
"82640-182", "(41) 3610-4786", "ta_adega@empresa.com", "303", "Santa Cândida");

insert into Pessoas values
(26, "Vinicius e Levi Telas Ltda", "Rua Anita Ribeiro Fontes", 5, 
"83215-550", "(41) 2557-376", "vl_telas@email.com", "833", null);

insert into Pessoas values
(27, "Giovanna e Rafael Ferragens ME", "Rua Nhambu", 6, 
"83123-432", "(44) 2877-6724", "gr_ferragens@email.com", "309", null);

insert into Pessoas values
(28, "Pedro e Lara Doces & Salgados ME", "Avenida Colombo", 6, 
"83077-403", "(44) 3948-2074", "pl_docesesalgados@email.com", "124", null);

insert into Pessoas values
(29, "Corretores Associados", "Rua Paranaguá", 1, 
"86234-834", "(43)3361-1690", "c_associados@email.com", "547", "sala 5");

insert into Pessoas values
(30, "Editora Arqueiro", "Rua Albert Leimer", 3, 
"07140-020", "(11)2538-4100", "e_arqueiro@email.com", "300", null);


-- DDL - Criação da tabela Clientes
create table Clientes
(
	ID_cliente int not null auto_increment primary key,
    ID_pessoa int not null,
    CPF varchar(14) not null,
    renda_familiar decimal(10,2) not null,
    RG varchar(20),
    data_nas date not null,
    estado_civil varchar(30),
    foreign key(ID_pessoa) references Pessoas(ID_pessoa)
);

-- DDL - Remover o atributo estado_civil
alter table Clientes
drop estado_civil;

-- DML - Inserção de registros na tabela de Clientes
insert into Clientes values
(1, 1, "279.003.016-23", 5000.50, null, "1989/07/29");

insert into Clientes values
(2, 2, "283.425.731-09", 6000.78, "84383976", "1986/08/03");

insert into Clientes values
(3, 3, "982.275.644-53", 4000.30, null, "1995/07/20");

insert into Clientes values
(4, 4, "764.221.897-45", 4560.50, null, "1989/07/21");

insert into Clientes values
(5, 5, "161.266.352-48", 5200.78, "04545678", "1996/08/04");

insert into Clientes values
(6, 6, "923.973.622-01" , 4390.30, null, "1997/07/30");

insert into Clientes values
(7, 7, "489.392.099-58", 8000.00,null, "1972/10/27");

insert into Clientes values
(8, 8, "978.898.929-26", 9560.50,null, "1960/10/27");

insert into Clientes values
(9, 9, "297.008.959-98", 4200.78,"04545678", "1996/03/22");

insert into Clientes values
(10, 10, "508.081.439-05", 4800.00,null, "1978/07/23");

insert into Clientes values
(11, 11, "663.686.775-20", 10000.50, null, "1950/12/31");

insert into Clientes values
(12, 12, "282.986.979-60", 4000.00, "108402095", "1960/09/30");

insert into Clientes values
(13, 13, "542.062.419-29", 9000.70, null, "1980/08/01");

insert into Clientes values
(14, 14, "231.229.719-17", 9450.50, null, "1958/10/27");

insert into Clientes values
(15, 15, "004.857.069-97", 8200.00, "41868678", "1999/10/27");		

-- DDL - Criação da tabela de Fornecedores
create table Fornecedores(
	ID_fornecedor int not null auto_increment primary key,
    ID_pessoa int not null,
    CNPJ varchar(18) not null,
    responsavel varchar(50) not null,
    foreign key(ID_pessoa) references Pessoas(ID_Pessoa)
);

-- DML - Inserção de registros na tabela de Fornecedores
insert into Fornecedores values
(1,11, "13.851.585/0001-03","Fátima M. Santos");

insert into Fornecedores values
(2,12, "38.365.759/0001-40","Tatiane M. Souza");

insert into Fornecedores values
(3,13, "01.486.800/0001-27","Luiza Costa");

insert into Fornecedores values
(4,14, "80.228.542/0001-55","Lorenzo Drumond");

insert into Fornecedores values
(5,15, "40.210.583/0001-08","Carlos Nascimento");

insert into Fornecedores values
(6, 16, "56.097.339/0001-02", "Cecília M. Portela");

insert into Fornecedores values
(7, 17, "05.861.190/0001-55", "Emanuel Goulart");

insert into Fornecedores values
(8, 18, "18.863.728/0001-02", "Daniel Amaral");

insert into Fornecedores values
(9, 19, "05.210.453/0001-66", "Augusto Golveia");

insert into Fornecedores values
(10, 20, "37.536.517/0001-00", "Carlos Eduardo Lopes");

-- DDL - Criação da tabela de Pedidos
create table Pedidos(
	ID_pedido int not null auto_increment primary key,
    ID_fornecedor int not null,
    data_pedido date not null,
    data_recebimento date,
    foreign key(ID_fornecedor) references Fornecedores(ID_fornecedor)
);

-- DML - Inserção na tabela de Pedidos
insert into Pedidos values
	(1, 1, "2021-09-08","2021-09-10");
insert into Pedidos values
	(2, 1, "2021-09-13","2021-09-14"); 
    
-- DDL - Criação da tabela de Itens_Pedidos 
create table Itens_Pedidos(
	ID_Itens_pedido int not null auto_increment primary key,
    ID_pedido int not null,
    ID_produto int not null,
    qtd int not null,
    valor decimal(10,2),
    foreign key(ID_pedido) references Pedidos(ID_pedido),
    foreign key(ID_produto) references Produtos(ID_produto)
);   

-- DML - Inserção de regsitros na tabela de Itens_Pedidos
insert into Itens_Pedidos values
	(1, 2, 1, 10, 28.50);
insert into Itens_Pedidos values
	(2, 2, 2, 20, 20.79);
insert into Itens_Pedidos values
	(3, 2, 5, 15, 28.50);
insert into Itens_Pedidos values
	(4, 2, 6, 5, 280.70);
insert into Itens_Pedidos values
	(5, 2, 7, 50, 117.98);
insert into Itens_Pedidos values
	(6, 1, 4, 2, 6890.50);
    

-- DDL - Criação da tabela de Vendas
create table Vendas(
	ID_venda int not null auto_increment primary key,
    ID_cliente int not null,
    data_venda date not null,
    foreign key(ID_cliente) references Clientes(ID_cliente)
);


-- DML - Exercício - Inserção de 10 registros na tabela de Vendas
insert into Vendas values
	(1, 1, "2021-09-20");
insert into Vendas values
	(2, 1, "2021-09-21");    
insert into Vendas values
	(3, 2, "2021-10-08");
insert into Vendas values
	(4, 2, "2021-10-13");    
insert into Vendas values
	(5, 3, "2021-10-13");
insert into Vendas values
	(6, 3, "2021-10-20");    
insert into Vendas values
	(7, 4, "2021-11-03");
insert into Vendas values
	(8, 4, "2021-11-04");    
insert into Vendas values
	(9, 6, "2021-11-05");
insert into Vendas values
	(10, 6, "2021-11-17");    


insert into Vendas values
	(11, 1, "2021-07-20");
insert into Vendas values
	(12, 1, "2022-07-21");    
insert into Vendas values
	(13, 3, "2022-07-21");
insert into Vendas values
	(14, 4, "2022-07-22");    
insert into Vendas values
	(15, 5, "2022-08-01");
insert into Vendas values
	(16, 6, "2022-08-02");    
insert into Vendas values
	(17, 7, "2022-08-03");
insert into Vendas values
	(18, 8, "2022-08-04");    
insert into Vendas values
	(19, 9, "2022-08-05");
insert into Vendas values
	(20, 10, "2022-08-06");  

-- DDL - criação da tabela de Itens_vendas
create table Itens_Vendas(
	ID_itens_venda int not null auto_increment primary key,
    ID_venda int not null,
    ID_produto int not null,
    qtd int not null,
    valor decimal(10,2),
    foreign key(ID_venda) references Vendas(ID_venda),
    foreign key(ID_produto) references Produtos(ID_produto)
);

insert into Itens_Vendas values
	(1, 2, 1, 1, 58.50);
insert into Itens_Vendas values
	(2, 2, 2, 1, 50.79);
insert into Itens_Vendas values
	(3, 2, 5, 1, 38.50);    
insert into Itens_Vendas values
	(4, 2, 6, 1, 600.00);
insert into Itens_Vendas values
	(5, 2, 7, 2, 190.00);
insert into Itens_Vendas values
	(6, 1, 4, 1, 8900.00);
insert into Itens_Vendas values
	(7, 1, 10, 1, 5250.50);    
insert into Itens_Vendas values
	(8, 4, 3, 1, 200.90);
insert into Itens_Vendas values
	(9, 5, 8, 1, 60.50);
insert into Itens_Vendas values
	(10, 6, 9, 1, 350.99);
insert into Itens_Vendas values
	(11, 2, 1, 1, 60.50);    
insert into Itens_Vendas values
	(12, 2, 2, 1, 50.79);
