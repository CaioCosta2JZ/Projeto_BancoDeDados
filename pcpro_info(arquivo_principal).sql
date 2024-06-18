create database pcpro_info;


--Clientes:
--id, nome, email
create table Clientes (id_cliente int primary key auto_increment, nome varchar(100), email varchar(70));
insert into Clientes (nome, email) values("Helena Maquiavel", "helena@email.com"), ("Marcos Santos", "marquinhos@email.com"),("Rebeca Stahl", "rebeca@email.com");

--Fornecedores:
--id, nome, email, telefone
create table Fornecedores(id_fornecedor int primary key auto_increment, nome varchar(100), email varchar(70), telefone varchar(50));
insert into Fornecedores (nome, email, telefone) values("CJ importações", "cjimportacoes@email.com", "23654902275"), ("Shangai Eletrônicos", "shangaiele@email.com","19639820772"),("AGFR Comércio", "agfrcomercio@email.com", "46392104763");

--Funcionários:
--id, nome, email, telefone
create table Funcionarios(id_funcionario int primary key auto_increment, nome varchar(100), email varchar(70), telefone varchar(50));
insert into Funcionarios (nome, email, telefone) values("Afonso Lucas Brandão", "afonsoo@email.com", "11763086611"), ("José Escarpin", "joseescar@email.com", "15080252937"),("Jefferson Oliveira", "jeff@email.com", "13992110765");

--Produtos: 
--id,id_fornecedor, nome, valor
create table Produtos(id_produto int primary key auto_increment, id_fornecedor int, valor double, foreign key (id_fornecedor) references fornecedores(id_fornecedor));
--esqueci do nome, tive que inserir com o comando:
alter table produtos add column nome varchar(200);
insert into Produtos (id_fornecedor, valor, nome) values(1, 500.00, "Placa de Vídeo GTX 750TI"), (3, 1000.00, "Volante Logitech g29"),(2, 300.00, "Memória RAM 16gb");

--Compras:
id,id_cliente, id_produto, data
create table Compras(id_compra int primary key auto_increment, id_cliente int, id_produto int, data varchar(15), foreign key (id_cliente) references clientes(id_cliente), foreign key (id_produto) references produtos(id_produto)); 
insert into Compras (id_cliente, id_produto, data) values(2,1,'23/05/2023'), (1, 3, '02/06/2023'),(3, 2, '11/30/2022');

--Selects:
select * from Produtos where id_produto=1;
select * from Produtos where valor < 1000.00;
select * from Clientes where email = 'rebeca@email.com';

--Joins:
 select produtos.nome as nome_produtos, produtos.valor as valor_produtos from produtos join fornecedores on produtos.id_produto = fornecedores.id_fornecedor;
select funcionarios.nome as nome_funcionarios, funcionarios.telefone as telefone_funcionarios from funcionarios join compras on funcionarios.id_funcionario = compras.id_compra;
 select clientes.nome as nome_clientes, clientes.email as email.clientes from clientes join compras on clientes.id cliente= compras.id_compra;  

--Updates:
 update produtos set valor = '1250.00' where id_produto = 2;
 update compras set data = '05/01/2024' where id_compra = 1;
 update funcionarios set email = 'jeffoliveira@email.com' where id_funcionario = 3;

--Deletes:  
delete from cliente where id_clientes = '1';
delete from compras where id_compras = '3';

--Alter table:
alter table funcionarios drop column email;
alter table clientes add column endereco varchar(100);
alter table fornecedores drop column email;