CREATE TABLE dbo.cliente
	(
	id int NOT NULL,
	nome varchar(50) NOT NULL,
	cpf bigint NOT NULL,
	rua varchar(50) NOT NULL,
	numero varchar(50) NOT NULL,
	complemento varchar(50) NOT NULL,
	bairro varchar(50) NOT NULL,
	cidade varchar(50) NOT NULL,
	uf char(10) NOT NULL,
	cep int NOT NULL
	) 

CREATE TABLE dbo.contato
	(
	id int NOT NULL,
	nome varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	endereco_eletronico varchar(50) NOT NULL,
	perfil_rede_social varchar(50) NULL
	) 

CREATE TABLE dbo.contatoTelefone
	(
	id smallint NOT NULL,
	DDD smallint NULL,
	numero int NULL,
	tipo_telefone varchar(50) NULL,
	[qualquer coisa] varchar(50) NULL
	)

INSERT INTO cliente(id ,nome, cpf, rua, numero, complemento, bairro, cidade, uf, cep) VALUES
(1, 'CAIO', 0845885480, 'RUA SILVIA', 222, 'VDVDDVD', 'JARDIM P', 'JOAO PESSOA', 'PB', 557783856)
INSERT INTO cliente(id ,nome, cpf, rua, numero, complemento, bairro, cidade, uf, cep) VALUES
(2,'CHAVES', 544575757575, 'RUA GUEDES', 333, 'FGFDGFG', ' P JARDIM', 'CAMPINA GRANDE', 'PB',25355755)

SELECT id, bairro FROM cliente
SELECT * FROM cliente
SELECT * FROM cliente
WHERE id = 2

UPDATE cliente
SET nome = 'VITOR' 

UPDATE cliente
SET cpf = 27524244363767 

DELETE FROM cliente
WHERE id = 2

DELETE TABLE cliente

DROP DATABASE revisao