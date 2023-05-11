--Insert da tabela cliente (Momentum e Xcelis)
INSERT INTO dbo.cliente (razaoSocial, nomeFantasia, CNPJ, inscricaoMunicipal, rua, numero, bairro, cidade, UF, CEP, usuarioCadastro) VALUES
('Momentum Empreedimentos Imobiliarios LTDA', 'MEI', 47686555000364, 20044, 'Rua 2', 1, 'Terra Santa Cristina VII', 'Paranapanema', 'SP', 18720000, 001),
('Xcelis Consultoria de Gestão Empresarial Ltda', 'Xcelis Consulting', 10932848000102, NULL, 'Rua Irio Giardelli', 47904, 'Loteamento Paiquerê', 'Valinhos', 'SP', 13271565, 001);

--Insert tabela funcao
INSERT INTO funcao (nome, usuarioCadastro) VALUES
('Analista de Sistema', 003),
('Analista de Negócios', 003),
('Coordenador', 003),
('Tech Leader', 003),
('Gerente', 003),
('Diretor', 003);

--Insert tabela departamento
INSERT INTO departamento (idCliente, nome, usuarioCadastro) VALUES 

(1, 'GAV - Gerencia administrativa de Vendas', 1),				--insert do departamento GAV do cliente momentum 
(1, 'Financeiro', 1),											--insert do departamento Financeiro do cliente momentum 
(1, 'Contabilidade', 1),										--insert do departamento Contabilidade do cliente momentum 
(1, 'DICON - Departamento Incentivo Controcao', 1),				--insert do departamento DICON do cliente momentum
(1, 'SLIM -  Sistema Lazer Integrado Momentum', 1),				--insert do departamento SLIM do cliente momentum 
(1, 'DDP - Departamento Desenvolvimento Programacao', 1),		--insert do departamento DDP do cliente momentum 
(1, 'SAC - Servico Atendimento Cliente', 1),					--insert do departamento SAC do cliente momentum 
(1, 'Juridico', 1),												--insert do departamento Juridico do cliente momentum 
(1, 'RH - Recursos Humanos', 1),								--insert do departamento RH do cliente momentum 
(2, 'GERAL - Departamento generico da XCELIS', 1);				--insert do departamento GERAL do cliente XCELIS 

--Insert do preço do projeto do cliente
INSERT INTO preco (idCliente, idProjetoTipo, dataValidade, valorHora, usuarioCadastro) VALUES

(1, 1, '20221231', 3.16, 5),		--Insert do preço do Tipo de projeto Requerimento do cliente Momentum
(1, 2, '20221231', 3.16, 5),		--Insert do preço do Tipo de projeto Levantamento de Requisitos do cliente Momentum
(1, 3, '20221231', 3.16, 5),		--Insert do preço do Tipo de projeto do BI - Business Inteligence Momentum
(1, 4, '20221231', 3.16, 5),		--Insert do preço do Tipo de projeto Apontamentos de Horas do cliente Momentum
(1, 5, '20221231', 3.16, 5),		--Insert do preço do Tipo de projeto Conversão de Relatórios do cliente Momentum

(2, 4, '20221231', 3.5, 5);			--Insert do preço do Tipo de projeto Requerimento do cliente Xcelis

--Insert tabela contato
INSERT INTO contato (idDepartamento, nome, email, usuarioCadastro) VALUES 
(1, 'Elisabeth Rodrigues Teixeira', 'elisabeth@momentum.com.br', 001),			--insert do contato do departamento GAV da Momentum
(2, 'Mônica Andrade Oliveira', 'monicaoliveira@momentum.com.br', 001),			--insert do contato do departamento Financeiro da Momentum
(3, 'Claudia Rosa Kurgonas', 'claudia@momentum.com.br', 001),					--insert do contato do departamento Contabilidade da Momentum
(4, 'Carlos Ferro', 'cferro@momentum.com.br', 001),								--insert do contato do departamento DICON da Momentum
(5, 'Alan Carlos Lombardi', 'alan@slim.com.br', 001),							--insert do contato do departamento SLIM da Momentum
(6, 'Wagner Alves', 'wagner@momentum.com.br', 001),								--insert do contato do departamento DDP da Momentum
(7, 'Nathália Fernanda D. Moraes', 'nathalia@momentum.com.br', 001),			--insert do contato do departamento SAC da Momentum
(8, 'Sara Jane Martinez Pietro', 'sara@momentum.com.br', 001),					--insert do contato do departamento Juridico da Momentum
(9, 'Samyra Brandoni de Souza', 'samyra@momentum.com.br', 001),					--insert do contato do departamento RH da Momentum
(10, 'Daniel Paraizo', 'daniel.paraizo@xcelis.com.br', 001);					--insert do contato do departamento GERAL da Xcelis

--Insert tabela contatoTelefone
INSERT INTO contatoTelefone (idTipoTelefone, idContato, DDD, numero, usuarioCadastro) VALUES 
(2, 1, 11, 991847819, 001),		--insert telefone do contato da Momentum
(1, 1, 11, 30651303, 001),		--insert telefone do contato da Momentum

(2, 2, 14, 997976824, 001),		--insert telefone do contato da Momentum
(1, 2, 14, 37652533, 001),		--insert telefone do contato da Momentum

(2, 3, 11, 996014740, 001),		--insert telefone do contato da Momentum
(1, 3, 14, 37652533, 001),		--insert telefone do contato da Momentum

(2, 4, 11, 995077078, 001),		--insert telefone do contato da Momentum
(1, 4, 11, 47915102, 001),		--insert telefone do contato da Momentum

(1, 5, 11, 37652500, 001),		--insert telefone do contato da Momentum

(2, 6, 11, 964188852, 001),		--insert telefone do contato da Momentum
(1, 6, 11, 30651346, 001),		--insert telefone do contato da Momentum

(2, 7, 14, 997976424, 001),		--insert telefone do contato da Momentum

(1, 8, 11, 30651368, 001),		--insert telefone do contato da Momentum

(1, 9, 14, 37652533, 001),		--insert telefone do contato da Momentum

(2, 10, 11, 943000163, 001);	--insert telefone do contato da Xcelis

--Insert tabelas faixaSalarial
INSERT INTO faixaSalarial (idFuncao, nome, CLTouPJ, usuarioCadastro) VALUES 
(1, 'F1', 'C', 001),
(2, 'F1', 'C', 001),
(3, 'F1', 'C', 001),
(4, 'F1', 'C', 001),
(5, 'F1', 'C', 001),
(6, 'F1', 'C', 001),
(1, 'F1', 'P', 001),
(2, 'F1', 'P', 001),
(3, 'F1', 'P', 001),
(4, 'F1', 'P', 001),
(5, 'F1', 'P', 001),
(6, 'F1', 'P', 001),

(1, 'F2', 'C', 001),
(2, 'F2', 'C', 001),
(3, 'F2', 'C', 001),
(4, 'F2', 'C', 001),
(5, 'F2', 'C', 001),
(6, 'F2', 'C', 001),
(1, 'F2', 'P', 001),
(2, 'F2', 'P', 001),
(3, 'F2', 'P', 001),
(4, 'F2', 'P', 001),
(5, 'F2', 'P', 001),
(6, 'F2', 'P', 001),

(1, 'F3', 'C', 001),
(2, 'F3', 'C', 001),
(3, 'F3', 'C', 001),
(4, 'F3', 'C', 001),
(5, 'F3', 'C', 001),
(6, 'F3', 'C', 001),
(1, 'F3', 'P', 001),
(2, 'F3', 'P', 001),
(3, 'F3', 'P', 001),
(4, 'F3', 'P', 001),
(5, 'F3', 'P', 001),
(6, 'F3', 'P', 001),

(1, 'F4', 'C', 001),
(2, 'F4', 'C', 001),
(3, 'F4', 'C', 001),
(4, 'F4', 'C', 001),
(5, 'F4', 'C', 001),
(6, 'F4', 'C', 001),
(1, 'F4', 'P', 001),
(2, 'F4', 'P', 001),
(3, 'F4', 'P', 001),
(4, 'F4', 'P', 001),
(5, 'F4', 'P', 001),
(6, 'F4', 'P', 001),

(1, 'F5', 'C', 001),
(2, 'F5', 'C', 001),
(3, 'F5', 'C', 001),
(4, 'F5', 'C', 001),
(5, 'F5', 'C', 001),
(6, 'F5', 'C', 001),
(1, 'F5', 'P', 001),
(2, 'F5', 'P', 001),
(3, 'F5', 'P', 001),
(4, 'F5', 'P', 001),
(5, 'F5', 'P', 001),
(6, 'F5', 'P', 001),

(1, 'F6', 'C', 001),
(2, 'F6', 'C', 001),
(3, 'F6', 'C', 001),
(4, 'F6', 'C', 001),
(5, 'F6', 'C', 001),
(6, 'F6', 'C', 001),
(1, 'F6', 'P', 001),
(2, 'F6', 'P', 001),
(3, 'F6', 'P', 001),
(4, 'F6', 'P', 001),
(5, 'F6', 'P', 001),
(6, 'F6', 'P', 001),

(1, 'F7', 'C', 001),
(2, 'F7', 'C', 001),
(3, 'F7', 'C', 001),
(4, 'F7', 'C', 001),
(5, 'F7', 'C', 001),
(6, 'F7', 'C', 001),
(1, 'F7', 'P', 001),
(2, 'F7', 'P', 001),
(3, 'F7', 'P', 001),
(4, 'F7', 'P', 001),
(5, 'F7', 'P', 001),
(6, 'F7', 'P', 001),

(1, 'F8', 'C', 001),
(2, 'F8', 'C', 001),
(3, 'F8', 'C', 001),
(4, 'F8', 'C', 001),
(5, 'F8', 'C', 001),
(6, 'F8', 'C', 001),
(1, 'F8', 'P', 001),
(2, 'F8', 'P', 001),
(3, 'F8', 'P', 001),
(4, 'F8', 'P', 001),
(5, 'F8', 'P', 001),
(6, 'F8', 'P', 001),

(1, 'F9', 'C', 001),
(2, 'F9', 'C', 001),
(3, 'F9', 'C', 001),
(4, 'F9', 'C', 001),
(5, 'F9', 'C', 001),
(6, 'F9', 'C', 001),
(1, 'F9', 'P', 001),
(2, 'F9', 'P', 001),
(3, 'F9', 'P', 001),
(4, 'F9', 'P', 001),
(5, 'F9', 'P', 001),
(6, 'F9', 'P', 001),

(1, 'F10', 'C', 001),
(2, 'F10', 'C', 001),
(3, 'F10', 'C', 001),
(4, 'F10', 'C', 001),
(5, 'F10', 'C', 001),
(6, 'F10', 'C', 001),
(1, 'F10', 'P', 001),
(2, 'F10', 'P', 001),
(3, 'F10', 'P', 001),
(4, 'F10', 'P', 001),
(5, 'F10', 'P', 001),
(6, 'F10', 'P', 001),

(1, 'F11', 'C', 001),
(2, 'F11', 'C', 001),
(3, 'F11', 'C', 001),
(4, 'F11', 'C', 001),
(5, 'F11', 'C', 001),
(6, 'F11', 'C', 001),
(1, 'F11', 'P', 001),
(2, 'F11', 'P', 001),
(3, 'F11', 'P', 001),
(4, 'F11', 'P', 001),
(5, 'F11', 'P', 001),
(6, 'F11', 'P', 001),

(1, 'F12', 'C', 001),
(2, 'F12', 'C', 001),
(3, 'F12', 'C', 001),
(4, 'F12', 'C', 001),
(5, 'F12', 'C', 001),
(6, 'F12', 'C', 001),
(1, 'F12', 'P', 001),
(2, 'F12', 'P', 001),
(3, 'F12', 'P', 001),
(4, 'F12', 'P', 001),
(5, 'F12', 'P', 001),
(6, 'F12', 'P', 001),

(1, 'F13', 'C', 001),
(2, 'F13', 'C', 001),
(3, 'F13', 'C', 001),
(4, 'F13', 'C', 001),
(5, 'F13', 'C', 001),
(6, 'F13', 'C', 001),
(1, 'F13', 'P', 001),
(2, 'F13', 'P', 001),
(3, 'F13', 'P', 001),
(4, 'F13', 'P', 001),
(5, 'F13', 'P', 001),
(6, 'F13', 'P', 001),

(1, 'F14', 'C', 001),
(2, 'F14', 'C', 001),
(3, 'F14', 'C', 001),
(4, 'F14', 'C', 001),
(5, 'F14', 'C', 001),
(6, 'F14', 'C', 001),
(1, 'F14', 'P', 001),
(2, 'F14', 'P', 001),
(3, 'F14', 'P', 001),
(4, 'F14', 'P', 001),
(5, 'F14', 'P', 001),
(6, 'F14', 'P', 001),

(1, 'F15', 'C', 001),
(2, 'F15', 'C', 001),
(3, 'F15', 'C', 001),
(4, 'F15', 'C', 001),
(5, 'F15', 'C', 001),
(6, 'F15', 'C', 001),
(1, 'F15', 'P', 001),
(2, 'F15', 'P', 001),
(3, 'F15', 'P', 001),
(4, 'F15', 'P', 001),
(5, 'F15', 'P', 001),
(6, 'F15', 'P', 001),

(1, 'F16', 'C', 001),
(2, 'F16', 'C', 001),
(3, 'F16', 'C', 001),
(4, 'F16', 'C', 001),
(5, 'F16', 'C', 001),
(6, 'F16', 'C', 001),
(1, 'F16', 'P', 001),
(2, 'F16', 'P', 001),
(3, 'F16', 'P', 001),
(4, 'F16', 'P', 001),
(5, 'F16', 'P', 001),
(6, 'F16', 'P', 001),

(1, 'F17', 'C', 001),
(2, 'F17', 'C', 001),
(3, 'F17', 'C', 001),
(4, 'F17', 'C', 001),
(5, 'F17', 'C', 001),
(6, 'F17', 'C', 001),
(1, 'F17', 'P', 001),
(2, 'F17', 'P', 001),
(3, 'F17', 'P', 001),
(4, 'F17', 'P', 001),
(5, 'F17', 'P', 001),
(6, 'F17', 'P', 001),

(1, 'F18', 'C', 001),
(2, 'F18', 'C', 001),
(3, 'F18', 'C', 001),
(4, 'F18', 'C', 001),
(5, 'F18', 'C', 001),
(6, 'F18', 'C', 001),
(1, 'F18', 'P', 001),
(2, 'F18', 'P', 001),
(3, 'F18', 'P', 001),
(4, 'F18', 'P', 001),
(5, 'F18', 'P', 001),
(6, 'F18', 'P', 001),

(1, 'F19', 'C', 001),
(2, 'F19', 'C', 001),
(3, 'F19', 'C', 001),
(4, 'F19', 'C', 001),
(5, 'F19', 'C', 001),
(6, 'F19', 'C', 001),
(1, 'F19', 'P', 001),
(2, 'F19', 'P', 001),
(3, 'F19', 'P', 001),
(4, 'F19', 'P', 001),
(5, 'F19', 'P', 001),
(6, 'F19', 'P', 001),

(1, 'F20', 'C', 001),
(2, 'F20', 'C', 001),
(3, 'F20', 'C', 001),
(4, 'F20', 'C', 001),
(5, 'F20', 'C', 001),
(6, 'F20', 'C', 001),
(1, 'F20', 'P', 001),
(2, 'F20', 'P', 001),
(3, 'F20', 'P', 001),
(4, 'F20', 'P', 001),
(5, 'F20', 'P', 001),
(6, 'F20', 'P', 001);