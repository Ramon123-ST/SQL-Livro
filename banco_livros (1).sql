create database banco_livros; /*cria o banco de dado*/

drop database banco_livros; /*Exclui fisicamente o banco? */

use banco_livros; /*Entrei no banco*/



create table tb_livro(
	id_livro int primary key auto_increment not null,
    nome_livro varchar (100),
    numero_paginas int,
    genero_livro enum("suspense","terror", "ficção cientifica", "comedia", "ação"),
    preco_livro decimal(8,2),
	capa_dura enum("mole", "pacaná", "cartão","roller"),
    data_leitura date,
    tipo_livro enum("digital","impresso","audiobook"),
    idioma enum("portugues", "ingles","espanhol","alemão","francês"),
    avaliacao_livro enum("otimo","bom","regular","ruim","pessimo"),
    status_livro enum("lido", "lendo", "não lido"),
    edicao_livro varchar (30),
    estado_livro enum ("novo", "usado", "semi-novo"),
    id_autor int, 
    id_editora int
);

alter table tb_livro
drop primary key,
add constraint pk_id_livro primary key (id_livro),
add constraint fk_id_editora foreign key(id_editora) references tb_editora (id_editora),
add constraint fk_id_autor foreign key(id_autor) references tb_autor(id_autor);

/*Lembrando que os nomes das fks não podem ser iguais em cada tabela. Precisa mudar nas outras: Ex, na tabela livro eu tenho
pk_id_editora e pk_id_autor. Agora na tb autor eu precio colocar fk_id_livro_autor e fk_id_editora_autor*/

/*DADOS -------------------------------------------------------------------------------*/
insert into tb_livro (nome_livro,numero_paginas, genero_livro, preco_livro, capa_dura, data_leitura, tipo_livro, idioma, avaliacao_livro, status_livro, edicao_livro, estado_livro) values 
("Harry Potter", 150 , "ficção cientifica", 250.00 , "mole" , '2025-10-21' , "impresso" , "ingles" , "otimo", "lido" , "Primeira edição" , "novo" ),
("O Pequeno Príncipe", 96, "ação", 45.90, "pacaná", '2025-05-10', "impresso", "portugues", "otimo", "lido", "Edição Especial", "usado" ),
("A Garota do Lago", 400, "suspense", 89.90, "cartão", "2025-05-10", "impresso", "portugues", "otimo", "lido", "1ª Edição", "novo"),
("O Iluminado", 600, "terror", 65.50, "mole", "2025-07-25", "impresso", "ingles", "otimo", "lido", "Edição de Bolso", "usado"),
("Androides Sonham com Ovelhas Elétricas?", 256, "ficção cientifica", 49.99, "pacaná", "2025-10-21", "digital", "portugues", "bom", "lendo", "Única", "semi-novo"),
("O Guia do Mochileiro das Galáxias", 224, "comedia", 40.20, "cartão", "2025-06-12", "audiobook", "ingles", "otimo", "lido", "42ª Edição", "usado"),
("O Código Da Vinci", 450, "suspense", 75.75, "roller", "2026-01-15", "impresso", "portugues", "bom", "não lido", "Edição de Cinema", "novo"),
("Cujo", 320, "terror", 55.90, "pacaná", "2025-11-05", "impresso", "ingles", "regular", "lido", "Nova Capa", "novo"),
("Blade Runner", 250, "ficção cientifica", 39.90, "mole", "2026-03-20", "digital", "espanhol", "pessimo", "lendo", "Filme Edition", "semi-novo"),
("Um Estranho Mundo", 200, "ação", 60.00, "roller", "2025-09-01", "impresso", "alemão", "ruim", "lido", "10º Aniversário", "usado");

/*----------------------------------------------------------------------*/
describe tb_livro; /*exibe a estrutura da tabela*/ 
select * from tb_livro; /*Exibe o conteudo da tabela*/	
drop table tb_livro; /*apaga o DB*/

delete from tb_livro where pk_id_livro = 10; /*Apaga o dado do insert apenas. DELETE SEM WHERE NÃO FAZEMOS!!!!!*/
delete from tb_livro where numero_paginas = 96;
delete from tb_livro where genero_livro = "suspense";
delete from tb_livro;


start transaction; /*Habilita comando de retorno*/
rollback; /*É O CRONTOL Z DO BD*/
commit; /*Confirma a execução do delete */

update tb_livro set nome_livro = "Harry Potter e o Prisioneiro de Askaban" where pk_id_livro = 1;
update tb_livro set numero_paginas = 300 where pk_id_livro = 5;


create table tb_editora(
	id_editora int primary key auto_increment not null,
    nome_auditora varchar (100) not null,
    qtnd_autores int not null, 
    qntd_obras int not null, 
    data_fundacao date not null, 
    pais_origem varchar (50) not null, 
    endereco_editora varchar (255) not null,
    id_livro int,
    id_autor int
);

alter table tb_editora 
drop primary key,
add constraint pk_id_editora primary key (id_editora),
add constraint fk_id_livro_editora foreign key(id_livro) references tb_livro (id_livro),
add constraint fk_idautor_editora foreign key(id_autor) references tb_autor(id_autor);

/*Lembrando que os nomes das fks não podem ser iguais em cada tabela. Precisa mudar nas outras: Ex, na tabela livro eu tenho
pk_id_editora e pk_id_autor. Agora na tb autor eu precio colocar fk_id_livro_autor e fk_id_editora_autor*/

describe tb_editora;
select * from tb_editora;
drop table tb_editora;
describe tb_editora;

update tb_editora set cnpj = "56.887.499/0001-65" where pk_id_editora = 1; /*Altera o valor do campo da tabela*/

alter table tb_editora modify column cnpj char(20); /*Modifica a estrutura do campo na tabela*/

alter table tb_editora add column cnpj char(18) not null; /*Adiciona um campo em uma tabela*/ 
alter table tb_editora drop column cnpj; /*Apaga um campo fisicamente da tabela*/

insert into tb_editora (nome_auditora,qtnd_autores,qntd_obras,data_fundacao,pais_origem,endereco_editora) values
("Principes", 20 , 60 , '1981-10-25' , "Brasil", "R. José Albino Pereira, 54 - Jardim Alvorada, Jandira - SP, 06612-001" ),
("HarperCollins Publishers", 150, 750, '1817-01-01', "EUA", "195 Broadway, 22nd Floor, New York, NY 10007 - EUA"),
("Pearson Education", 300, 1500, '1844-01-01', "Reino Unido", "80 Strand, London, WC2R 0RL - Reino Unido"),
("Hachette Livre", 180, 900, '1826-01-01', "França", "58 Rue Jean Bleuzen, 92170 Vanves - França"),
("Penguin Random House", 250, 1200, '2013-07-01', "EUA", "1745 Broadway, New York, NY 10019 - EUA"),
("Wiley", 100, 500, '1807-01-01', "EUA", "111 River Street, Hoboken, NJ 07030 - EUA"),
("Simon & Schuster", 130, 650, '1924-01-01', "EUA", "1230 Avenue of the Americas, New York, NY 10020 - EUA"),
("Springer Nature", 95, 480, '1842-01-01', "Alemanha", "Heidelberger Platz 3, 14197 Berlin - Alemanha"),
("Oxford University Press", 70, 350, '1478-01-01', "Reino Unido", "Great Clarendon Street, Oxford, OX2 6DP - Reino Unido"),
("Elsevier", 110, 550, '1880-01-01', "Países Baixos", "Radarweg 29, 1043 NX Amsterdam - Países Baixos");


create table tb_autor (
	id_autor int primary key auto_increment not null,
    nome_autor varchar (40) not null, 
    data_nasc date not null,
    livros_lancados int not null,
    nacionalidade_autor varchar (50) not null,
    sexo_autor enum ("Masculino", "Feminino"),
    id_livro int,
    id_editora int
);

alter table tb_autor
drop primary key, 
add constraint pk_id_autor primary key (id_autor),
add constraint fk_id_livro_autor foreign key(id_livro) references tb_livro (id_livro),
add constraint fk_id_editora_autor foreign key(id_editora) references tb_editora(id_editora);

/*Lembrando que os nomes das fks não podem ser iguais em cada tabela. Precisa mudar nas outras: Ex, na tabela livro eu tenho
pk_id_editora e pk_id_autor. Agora na tb autor eu precio colocar fk_id_livro_autor e fk_id_editora_autor*/

describe tb_autor;
select * from tb_autor;
drop table tb_autor;

alter table tb_autor add column cpf char(11);
alter table tb_autor add column premiacoes int;
alter table tb_autor modify column cpf char(14);

update tb_autor set nome_autor = "Jane Alderson" where pk_id_autor = 2; /*Mudei o nome do autor*/
update tb_autor set nome_autor = "Jujutsu Kaizen" where pk_id_autor = 7;
update tb_autor set cpf = "563.878.528-03" where pk_id_autor = 1;
update tb_autor set premiacoes = "2" where pk_id_autor = 1;

alter table tb_autor change column nacionalidade_autor nacionalidade varchar (50) not null; /*Change Column ele altera o nome de uma tabela*/
alter table tb_autor drop column livros_lancados; /*Esse comando esta dando um drop na culuna livros lançados, tirou fisicamente*/ 



insert into tb_autor (nome_autor, data_nasc, livros_lancados, nacionalidade_autor, sexo_autor) values
('Gabriel García Márquez', '1927-03-06', 15, 'Colombiano', 'Masculino'),
('Jane Austen', '1775-12-16', 6, 'Britânica', 'Feminino'),
('Jorge Amado', '1912-08-10', 32, 'Brasileiro', 'Masculino'),
('Clarice Lispector', '1920-12-10', 25, 'Brasileira', 'Feminino'),
('Ernest Hemingway', '1899-07-21', 10, 'Americano', 'Masculino'),
('Machado de Assis', '1839-06-21', 10, 'Brasileiro', 'Masculino'),
('Agatha Christie', '1890-09-15', 66, 'Britânica', 'Feminino'),
('J.R.R. Tolkien', '1892-01-03', 6, 'Britânico', 'Masculino'),
('Virginia Woolf', '1882-01-25', 9, 'Britânica', 'Feminino'),
('Fernando Pessoa', '1888-06-13', 4, 'Português', 'Masculino');