create database banco_livros; /* cria o banco de dados */

drop database banco_livros; /* exclui fisicamente o banco de dados */

use banco_livros;
create table tb_livro(
pk_id_livro int primary key auto_increment not null,
nome_livro varchar(100),
numero_paginas int,
gereno enum('suspense','terror','ficção cientofica','comédia','ação'),
preco decimal(8,2),
capa_dura enum('mole','paraná','castão','roller'),
data_leitura date,
tipo_livro enum('digital','impresso','audiobuok'),
idioma enum('português','ingês','espanhol','francês'),
avaliacao_livro enum('ótimo','bom','regular','ruim','péssimo'),
status_livro enum('lido','lendo','não lido'),
edicao varchar(40),
estado_livro enum('novo','usado','semi_novo')
);

drop table tb_livro;

describe tb_livro; /* exibe a estrutura da tabela */
select * from tb_livro; /* exibe o conteudo da tabela*/

insert into tb_livro (nome_livro,numero_paginas,gereno,preco,capa_dura,data_leitura,tipo_livro,idioma,avaliacao_livro,status_livro,edicao,estado_livro) values
('o pequenho pricipe',144,'ação',15.00,'mole','2025-10-20','impresso','português','ruim','lido','decima edição','usado');
('a volta dos que nao foram',140,'ação',10.00,'roller','2025-10-20','digital','espanhol','bom','lendo','decima edição','novo');
