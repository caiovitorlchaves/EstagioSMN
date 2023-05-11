--Caio

--Questao 1
SELECT * FROM cliente

--Questao 2
SELECT * FROM cliente
WHERE id = 1 

--Questao 3
SELECT * FROM colaborador 
WHERE nome LIKE  'a%'

SELECT * FROM colaborador 
WHERE nome LIKE  'A_e'

SELECT * FROM colaborador 
WHERE nome LIKE  'a_%'

--Questao 4
SELECT DDD FROM contatoTelefone
WHERE DDD IN (11)

SELECT * FROM contatoTelefone
WHERE DDD IN (14) AND idContato IN (2)

SELECT * FROM contatoTelefone
WHERE DDD IN (11) OR idContato IN (6)

--Questao 5
SELECT DDD FROM contatoTelefone
WHERE NOT DDD = 11

SELECT nome FROM colaborador
WHERE NOT nome = 'Emerson'

--Questao 6
SELECT nome FROM colaborador
SELECT TOP 3 nome
FROM colaborador
ORDER BY nome DESC

SELECT * FROM colaborador
SELECT DISTINCT nome,email
FROM colaborador;


--------------------------------------------------------------------------------

--Questao 1
INSERT INTO colaborador (nome, email, dataAdmissao, usuarioCadastro)
VALUES ('Caio Vitor Lopes Chaves', 'caio.chaves@smn.com.br', '20220117', 10)

--Questao 2
SELECT * FROM projeto
INSERT INTO projeto (idPreco, nome, descricao, dataEntrada, quantidadeTotalMinutos, usuarioCadastro)
VALUES (5 , 'kreta', 'projeto para avaliar algo', '20220310', 6000, 10)

SELECT * FROM cliente
INSERT INTO projetoEtapa(idEtapaTipo, idProjeto, dataInicioPrevista, dataTerminoPrevista, dataInicio, usuarioCadastro)
VALUES (3 , 5, '20220310', '20220610', '20220312', 10)

-------------------------------------------------------------------------------------------------------------------------

--Questao 1
SELECT * FROM colaborador
UPDATE colaborador
SET nome = 'Caio V L Chaves'
WHERE id = 15

UPDATE colaborador
SET nome = 'Caio Vitor Lopes Chaves', email = 'caio.chaves@smn.com.br'
WHERE id IN (15)

UPDATE colaborador
SET nome = 'Rayssa Mendes'
WHERE id IN (11)

UPDATE colaborador
SET nome = 'Caio V L Chaves', email = 'caiovitor993@gmail.com'
WHERE id = 15

----------------------------------------------------------------------------------
--Questao 1
SELECT * FROM colaborador

DELETE FROM colaborador 
WHERE id = 6
