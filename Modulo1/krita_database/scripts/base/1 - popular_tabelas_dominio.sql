--Insert da tabela de dom�nio tipoTelefone
INSERT INTO dbo.tipoTelefone (id, nome) VALUES
(1, 'Fixo'),
(2, 'Celular');

--Insert da tabela de dom�nio projetoTipo
INSERT INTO dbo.projetoTipo (id, nome) VALUES
(1, 'Requerimento'),
(2, 'Levantamento de Requisitos'),
(3, 'BI - Business Intelligence'),
(4, 'Apontamento de Horas'),
(5, 'Convers�o de Relat�rios');

--Insert da tabela de dom�nio unidade
INSERT INTO dbo.unidade (id, nome) VALUES
(1, 'Passos'),
(2, 'Franca'),
(3, 'Jo�o Pessoa');

/*
--Insert da tabela atividade
INSERT INTO dbo.atividade (id, nome) VALUES 
(1, 'Apova��o'),
(2, 'Homologa��o'),
(3, 'Acompanhamento');

--Insert da tabela etapaTipo
INSERT INTO dbo.etapaTipo (id, nome) VALUES 
(1, 'Escopo'),
(2, 'Or�amento'),
(3, 'Desenvolvimento'),
(4, 'Teste'),
(5, 'Homologa��o'),
(6, 'Implanta��o'),
(7, 'Acompanhamento Produ��o'),
(8, 'Finalizado');

--Insert da tabela documentoTipo (fict�cio)
INSERT INTO dbo.documentoTipo (id, nome) VALUES 
(1, 'Nota Fiscal'),
(2, 'Fatura'),
(3, 'Recibo');
*/