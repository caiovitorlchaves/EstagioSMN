--insert da tabela de usuario
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'waldson123', @email = 'waldson.henrique@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'ane123', @email = 'ane.duarte@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'matheus123', @email = 'matheus.nascimento@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'mariana123', @email = 'mariana.alves@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'anefranca123', @email = 'ane.franca@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'sorrentino123', @email = 'sorrentino@gmail.com',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'cayo123', @email = 'cayo.jm@gmail.com',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'ianko123', @email = 'iankilo_dellano@gmail.com',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'joao123', @email = 'joao.carlos@smn.com.br',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_InsUsuario]  @apelido = 'emerson123', @email = 'emersinhobarreto7x@smn.com.br',  @usuarioCadastro = 007

--Insert da tabela colaborador
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 1, @nome = 'Waldson Henrique de Lima', @dataAdmissao = '20220117',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 2, @nome = 'Ane Beatriz Silva Duarte', @dataAdmissao = '20220117',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 3, @nome = 'Matheus Sousa do Nascimento', @dataAdmissao = '20220116',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 4, @nome = 'Mariana Alves da Silva dos Santos', @dataAdmissao = '20220116',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 5, @nome = 'Ane de Franca', @dataAdmissao = '20210101',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 6, @nome = 'Daniel Sorrentino', @dataAdmissao = '20210501',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 7, @nome = 'João Cayo', @dataAdmissao = '20210117',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 8, @nome = 'Ianko Derek', @dataAdmissao = '20220812',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 9, @nome = 'João Carlos', @dataAdmissao = '20220117',  @usuarioCadastro = 007
EXEC [dbo].[KRTSP_Inscolaborador] @idUsuario = 10, @nome = 'Emerson Barreto', @dataAdmissao = '20220117',  @usuarioCadastro = 007

--Insert da tabela projeto
INSERT INTO projeto (idPreco, nome, descricao, dataEntrada, quantidadeTotalMinutos, usuarioCadastro) VALUES 
(3, 'Oxalá', 'Projeto desenvolvido a fim de encontrar o verdadeiro significado da palavra Oxalá por meio de pesquisas na web', '20201120', 5000, 001),
(6, 'Lemon Nada', 'Projeto voltado ao desenvolvimento de um sistema onde serão selecionados limões de primeira qualidade para a fabricação de limonada', '20140324', 8000, 001),
(5, 'Frescor', 'Projeto administrado pela editora de livros didáticos Frescor, sistema voltado ao cadastro de alunos na sua instituição', '20100510', 5500, 001),
(6, 'Xcelis 2.0', 'Projeto para refatoração de código de todos os sistemas Xcelis', '20220309', 12000, 003);

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

--Insert de popular tabela projetoEtapa
INSERT INTO projetoEtapa (idEtapaTipo, idProjeto, dataInicio, dataInicioPrevista, dataTerminoPrevista, usuarioCadastro) VALUES 
(3, 1, '20200405', '20200405', '20210101', 001),
(3, 2, '20170614', '20170614', '20210608', 001),
(2, 3, '20200405', '20200405', '20210101', 003),
(1, 4, '20170614', '20170614', '20210608', 003);

--Insert de popular tabela Atividade
INSERT INTO dbo.atividade (id, nome) VALUES
(1, 'Requisição'),
(2, 'Aprovação'),
(3, 'Homologação');

--Insert de popular tabela projetoAtividade
INSERT INTO projetoAtividade(idContato, idProjeto, idAtividade, usuarioCadastro) VALUES 
(1, 1, 2, 001),
(2, 2, 1, 001),
(3, 2, 2, 001),
(4, 1, 1, 003),
(5, 1, 3, 003),
(6, 2, 3, 003),
(7, 3, 2, 003),
(8, 3, 1, 003),
(9, 3, 3, 003),
(10, 4, 1, 003),
(10, 4, 2, 003),
(10, 4, 3, 003);

--Insert de popular tabela documentoTipo
INSERT INTO dbo.documentoTipo (id, nome) VALUES
(1, 'Relatório de projeto'),
(2, 'Documentação de tela'),
(3, 'Backlog'),
(4, 'Relatório da equipe'),
(5, 'Avaliação cliente');

INSERT INTO documento (idDocumentoTipo, idColaborador, nome, descricao, dataCriacao, usuarioCadastro) VALUES 
(1, 1, 'Nota Fiscal Oxalá', 'Nota Fiscal do projeto Oxalá', '20190629', 001),
(3, 1, 'Recibo Oxalá', 'Recibo do projeto Oxalá', '20190813', 001),
(3, 2, 'Backlog de features do projeto', 'Listagem de todas as funcionalidades que precisarão estar no projeto', '20190629', 001),
(5, 4, 'Feedback e avaliações', 'Comentários e avaliações do projeto como um todo e da equiepe que trabalhou nele', '20190813', 001);

INSERT INTO projetoDocumento (idProjeto, idDocumento) VALUES 
(1, 1),
(2, 2);

INSERT INTO colaboradorTelefone (idColaborador, idTipoTelefone, DDD, numero, usuarioCadastro) VALUES
(1, 2, 83, 998950606, 001),
(2, 2, 83, 987882526, 003),
(3, 2, 83, 965452585, 003),
(4, 2, 83, 932236666, 003);

INSERT INTO entrega (idProjeto, dataEntrega, descricao, usuarioCadastro) VALUES 
(1, '20201013', 'Entrega da primeira etapa do projeto Oxalá', 001),
(2, '20210421', 'Entrega da primeira etapa projeto Lemon Nada', 001),
(1, '20221212', 'Entrega da primeira homologação', 003),
(2, '20221212', 'Finalização do desenvolvimento do projeto', 003),
(3, '20221212', 'Entrega dos requerimento', 003),
(1, '20221212', 'Finalização do desenvolvimento do projeto', 003),
(2, '20221212', 'Entrega da primeira homologação', 003),
(3, '20221212', 'Entrega da primeira homologação', 003),
(1, '20221212', 'Entrega dos requerimento', 003),
(2, '20221212', 'Finalização do desenvolvimento do projeto', 003),
(4, '20220315', 'Entrega do Requerimento', 5),
(1, '20220330', 'Entrega do Fluxo', 5);

INSERT INTO colaboradorEntrega (idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioCadastro) VALUES 
(1, 1, 5000, 600, 003),
(1, 2, 4500, 700, 003),
(5, 2, 5000, 600, 003),
(6, 3, 5000, 600, 003),
(7, 3, 5000, 600, 003),
(8, 4, 5000, 600, 003),
(5, 6, 5000, 600, 003),
(1, 5, 5000, 600, 003),
(5, 10, 5000, 600, 003),
(6, 4, 5000, 600, 003),
(6, 6, 5000, 600, 003),
(6, 11, 5000, 600, 003),
(7, 5, 5000, 600, 003),
(7, 9, 5000, 600, 003),
(8, 7, 5000, 600, 003),
(8, 8, 5000, 600, 003),
(8, 12, 5000, 600, 003);

INSERT INTO entregaDocumento (idEntrega, idDocumento) VALUES 
(1, 1),
(2, 2);

INSERT INTO aprovacao (idContato, idEntrega, dataAprovacao, usuarioCadastro) VALUES 
(1, 1, '20220412', 001),
(1, 3, '20220510', 001),
(1, 6, '20220412', 001),
(1, 9, '20220412', 001),
(1, 12, '20220412', 001),
(2, 2, '20220412', 001),
(2, 4, '20220412', 001),
(2, 7, '20220412', 001),
(2, 10, '20220412', 001),
(3, 5, '20220412', 001),
(3, 8, '20220412', 001),
(4, 11, '20220412', 001);

INSERT INTO colaboradorEntrega (idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioCadastro) VALUES 
(1, 1, 5000, 600, 003),
(1, 2, 4500, 700, 003),
(5, 2, 5000, 600, 003),
(6, 3, 5000, 600, 003),
(7, 3, 5000, 600, 003),
(8, 4, 5000, 600, 003),
(5, 6, 5000, 600, 003),
(1, 5, 5000, 600, 003),
(5, 10, 5000, 600, 003),
(6, 4, 5000, 600, 003),
(6, 6, 5000, 600, 003),
(6, 11, 5000, 600, 003),
(7, 5, 5000, 600, 003),
(7, 9, 5000, 600, 003),
(8, 7, 5000, 600, 003),
(8, 8, 5000, 600, 003),
(8, 12, 5000, 600, 003);

/* script para criar linha na tabela de empresa (Momentum e Xcelis)*/
INSERT INTO empresa (razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioCadastro) VALUES 
('Momentum Empreedimentos Imobiliarios LTDA', 'MEI', 47686555000364, 000, 20044, 'Rua 2', 1, 'Não Tem', 'Terra Santa Cristina VII', 'Paranapanema', 'SP', 18720000, 001),
('Xcelis Consultoria de Gestão Empresarial Ltda', 'Xcelis Consulting', 10932848000102, 000, 000, 'Rua Irio Giardelli', 47904, 'Não Tem', 'Loteamento Paiquerê', 'Valinhos', 'SP', 13271565, 001);

INSERT INTO notaFiscal (idEmpresa, dataEmissao, dataVencimento, anoCompetencia, mesCompetencia, usuarioCadastro) VALUES 
(1, '20201203', '20250312', 2020, 12, 001),
(2, '20210515', '20240720', 2021, 05, 001);

INSERT INTO itemNotaFiscal (idNotaFiscal, idEntrega, idProjetoEtapa, valor, usuarioCadastro) VALUES 
(1, 1, 3, 1900, 003),
(2, 2, 2, 50000, 001);

INSERT INTO parametrizacao (percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro) VALUES 
(0.15, 0.50, 3, '20200615', 001);

INSERT INTO parametrizacaoHistorico (idParametrizacao, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro) VALUES 
(1, 0.15, 0.50, 3, '20200615', 001);

INSERT INTO opcaoSistema (idOpcaoMae, descricao, usuarioCadastro) VALUES 
(NULL, 'Tela de Login', 001),
(1, 'Cadastro', 002);

INSERT INTO cargoSalario (idUnidade, idFaixaSalarial, valor, dataValidade, usuarioCadastro) VALUES
(1, 1, 1600, '20220331', 001), --CLT
(1, 2, 1840, '20220331', 001), --CLT
(1, 3, 2116, '20220331', 001), --CLT
(1, 4, 2433.4, '20220331', 001), --CLT
(1, 5, 2798.41, '20220331', 001), --CLT
(1, 6, 3218.17, '20220331', 001), --CLT
(1, 7, 3700.89, '20220331', 001), --CLT
(1, 8, 4256.02, '20220331', 001), --CLT
(1, 9, 4894.43, '20220331', 001), --CLT
(1, 10, 5628.59, '20220331', 001), --CLT
(1, 11, 6472.89, '20220331', 001), --CLT
(1, 12, 7443.82, '20220331', 001), --CLT
(1, 13, 8560.39, '20220331', 001), --CLT
(1, 14, 9844.45, '20220331', 001), --CLT
(1, 15, 11321.12, '20220331', 001), --CLT
(1, 16, 13019.29, '20220331', 001), --CLT
(1, 17, 14972.18, '20220331', 001), --CLT
(1, 18, 17218.01, '20220331', 001), --CLT
(1, 19, 19800.71, '20220331', 001), --CLT
(1, 20, 22770.82, '20220331', 001), --CLT

(1, 1, 1600, '20220331', 001), --PJ
(1, 2, 1840, '20220331', 001), --PJ
(1, 3, 2116, '20220331', 001), --PJ
(1, 4, 2433.4, '20220331', 001), --PJ
(1, 5, 2798.41, '20220331', 001), --PJ
(1, 6, 3218.17, '20220331', 001), --PJ
(1, 7, 3700.89, '20220331', 001), --PJ
(1, 8, 4256.02, '20220331', 001), --PJ
(1, 9, 4894.43, '20220331', 001), --PJ
(1, 10, 5628.59, '20220331', 001), --PJ
(1, 11, 6472.89, '20220331', 001), --PJ
(1, 12, 7443.82, '20220331', 001), --PJ
(1, 13, 8560.39, '20220331', 001), --PJ
(1, 14, 9844.45, '20220331', 001), --PJ
(1, 15, 11321.12, '20220331', 001), --PJ
(1, 16, 13019.29, '20220331', 001), --PJ
(1, 17, 14972.18, '20220331', 001), --PJ
(1, 18, 17218.01, '20220331', 001), --PJ
(1, 19, 19800.71, '20220331', 001), --PJ
(1, 20, 22770.82, '20220331', 001), --PJ

(2, 1, 1600, '20220331', 001), --CLT
(2, 2, 1840, '20220331', 001), --CLT
(2, 3, 2116, '20220331', 001), --CLT
(2, 4, 2433.4, '20220331', 001), --CLT
(2, 5, 2798.41, '20220331', 001), --CLT
(2, 6, 3218.17, '20220331', 001), --CLT
(2, 7, 3700.89, '20220331', 001), --CLT
(2, 8, 4256.02, '20220331', 001), --CLT
(2, 9, 4894.43, '20220331', 001), --CLT
(2, 10, 5628.59, '20220331', 001), --CLT
(2, 11, 6472.89, '20220331', 001), --CLT
(2, 12, 7443.82, '20220331', 001), --CLT
(2, 13, 8560.39, '20220331', 001), --CLT
(2, 14, 9844.45, '20220331', 001), --CLT
(2, 15, 11321.12, '20220331', 001), --CLT
(2, 16, 13019.29, '20220331', 001), --CLT
(2, 17, 14972.18, '20220331', 001), --CLT
(2, 18, 17218.01, '20220331', 001), --CLT
(2, 19, 19800.71, '20220331', 001), --CLT
(2, 20, 22770.82, '20220331', 001), --CLT

(2, 1, 1600, '20220331', 001), --PJ
(2, 2, 1840, '20220331', 001), --PJ
(2, 3, 2116, '20220331', 001), --PJ
(2, 4, 2433.4, '20220331', 001), --PJ
(2, 5, 2798.41, '20220331', 001), --PJ
(2, 6, 3218.17, '20220331', 001), --PJ
(2, 7, 3700.89, '20220331', 001), --PJ
(2, 8, 4256.02, '20220331', 001), --PJ
(2, 9, 4894.43, '20220331', 001), --PJ
(2, 10, 5628.59, '20220331', 001), --PJ
(2, 11, 6472.89, '20220331', 001), --PJ
(2, 12, 7443.82, '20220331', 001), --PJ
(2, 13, 8560.39, '20220331', 001), --PJ
(2, 14, 9844.45, '20220331', 001), --PJ
(2, 15, 11321.12, '20220331', 001), --PJ
(2, 16, 13019.29, '20220331', 001), --PJ
(2, 17, 14972.18, '20220331', 001), --PJ
(2, 18, 17218.01, '20220331', 001), --PJ
(2, 19, 19800.71, '20220331', 001), --PJ
(2, 20, 22770.82, '20220331', 001), --PJ

(3, 1, 1600, '20220331', 001), --CLT
(3, 2, 1840, '20220331', 001), --CLT
(3, 3, 2116, '20220331', 001), --CLT
(3, 4, 2433.4, '20220331', 001), --CLT
(3, 5, 2798.41, '20220331', 001), --CLT
(3, 6, 3218.17, '20220331', 001), --CLT
(3, 7, 3700.89, '20220331', 001), --CLT
(3, 8, 4256.02, '20220331', 001), --CLT
(3, 9, 4894.43, '20220331', 001), --CLT
(3, 10, 5628.59, '20220331', 001), --CLT
(3, 11, 6472.89, '20220331', 001), --CLT
(3, 12, 7443.82, '20220331', 001), --CLT
(3, 13, 8560.39, '20220331', 001), --CLT
(3, 14, 9844.45, '20220331', 001), --CLT
(3, 15, 11321.12, '20220331', 001), --CLT
(3, 16, 13019.29, '20220331', 001), --CLT
(3, 17, 14972.18, '20220331', 001), --CLT
(3, 18, 17218.01, '20220331', 001), --CLT
(3, 19, 19800.71, '20220331', 001), --CLT
(3, 20, 22770.82, '20220331', 001), --CLT

(3, 1, 1600, '20220331', 001), --PJ
(3, 2, 1840, '20220331', 001), --PJ
(3, 3, 2116, '20220331', 001), --PJ
(3, 4, 2433.4, '20220331', 001), --PJ
(3, 5, 2798.41, '20220331', 001), --PJ
(3, 6, 3218.17, '20220331', 001), --PJ
(3, 7, 3700.89, '20220331', 001), --PJ
(3, 8, 4256.02, '20220331', 001), --PJ
(3, 9, 4894.43, '20220331', 001), --PJ
(3, 10, 5628.59, '20220331', 001), --PJ
(3, 11, 6472.89, '20220331', 001), --PJ
(3, 12, 7443.82, '20220331', 001), --PJ
(3, 13, 8560.39, '20220331', 001), --PJ
(3, 14, 9844.45, '20220331', 001), --PJ
(3, 15, 11321.12, '20220331', 001), --PJ
(3, 16, 13019.29, '20220331', 001), --PJ
(3, 17, 14972.18, '20220331', 001), --PJ
(3, 18, 17218.01, '20220331', 001), --PJ
(3, 19, 19800.71, '20220331', 001), --PJ
(3, 20, 22770.82, '20220331', 001); --PJ

INSERT INTO  qualificacao (idCargoSalario, idColaborador, dataInicio, usuarioCadastro) VALUES 
(14, 1, '20220303', 001),
(7, 5, '20210303', 001),
(30, 6, '20210303', 001),
(24, 7, '20210303', 001),
(12, 8, '20210303', 001),
(2, 2, '20210303', 001);

INSERT INTO usuarioOpcao (idUsuario, idOpcaoSistema, usuarioCadastro) VALUES
(1, 1, 001),
(1, 2, 001),
(2, 1, 001);


