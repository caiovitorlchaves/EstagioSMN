--Insert da tabela de domínio tipoTelefone
INSERT INTO dbo.tipoTelefone (id, nome) VALUES
(1, 'Fixo'),
(2, 'Celular');

--Insert da tabela de domínio projetoTipo
INSERT INTO dbo.projetoTipo (id, nome) VALUES
(1, 'Requerimento'),
(2, 'Levantamento de Requisitos'),
(3, 'BI - Business Intelligence'),
(4, 'Apontamento de Horas'),
(5, 'Conversão de Relatórios');

--Insert da tabela de domínio unidade
INSERT INTO dbo.unidade (id, nome) VALUES
(1, 'Passos'),
(2, 'Franca'),
(3, 'João Pessoa');

/*
--Insert da tabela atividade
INSERT INTO dbo.atividade (id, nome) VALUES 
(1, 'Apovação'),
(2, 'Homologação'),
(3, 'Acompanhamento');

--Insert da tabela etapaTipo
INSERT INTO dbo.etapaTipo (id, nome) VALUES 
(1, 'Escopo'),
(2, 'Orçamento'),
(3, 'Desenvolvimento'),
(4, 'Teste'),
(5, 'Homologação'),
(6, 'Implantação'),
(7, 'Acompanhamento Produção'),
(8, 'Finalizado');

--Insert da tabela documentoTipo (fictício)
INSERT INTO dbo.documentoTipo (id, nome) VALUES 
(1, 'Nota Fiscal'),
(2, 'Fatura'),
(3, 'Recibo');
*/