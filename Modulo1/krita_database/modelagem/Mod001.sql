CREATE TABLE dbo.atividade ( 
	id                   tinyint      NOT NULL,
	nome                 varchar(25)      NOT NULL,
	CONSTRAINT pk_atividade PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.cargoSalarioHistorico ( 
	id                   int    IDENTITY  NOT NULL,
	idCargoSalario       int      NOT NULL,
	idUnidade            smallint      NOT NULL,
	idFaixaSalarial      smallint      NOT NULL,
	valor                decimal(7,2)      NOT NULL,
	dataValidade         date      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_cargoSalarioHistorico PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.cliente ( 
	id                   smallint    IDENTITY  NOT NULL,
	razaoSocial          varchar(145)      NOT NULL,
	nomeFantasia         varchar(145)      NOT NULL,
	CNPJ                 bigint      NOT NULL,
	inscricaoEstadual    int      NULL,
	inscricaoMunicipal   int      NULL,
	rua                  varchar(145)      NOT NULL,
	numero               varchar(8)      NOT NULL,
	complemento          varchar(100)      NULL,
	bairro               varchar(45)      NOT NULL,
	cidade               varchar(60)      NOT NULL,
	UF                   char(2)      NOT NULL,
	CEP                  int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_cliente PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.departamento ( 
	id                   smallint    IDENTITY  NOT NULL,
	idCliente            smallint      NOT NULL,
	nome                 varchar(60)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_departamento PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.documentoTipo ( 
	id                   smallint      NOT NULL,
	nome                 varchar(35)      NOT NULL,
	CONSTRAINT pk_tipoDocumento PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.empresa ( 
	id                   tinyint    IDENTITY  NOT NULL,
	razaoSocial          varchar(145)      NOT NULL,
	nomeFantasia         varchar(145)      NOT NULL,
	CNPJ                 bigint      NOT NULL,
	inscricaoEstadual    int      NULL,
	inscricaoMunicipal   int      NULL,
	rua                  varchar(145)      NOT NULL,
	numero               varchar(8)      NOT NULL,
	complemento          varchar(100)      NULL,
	bairro               varchar(45)      NOT NULL,
	cidade               varchar(60)      NOT NULL,
	UF                   char(2)      NOT NULL,
	CEP                  int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_empresa PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.etapaTipo ( 
	id                   smallint      NOT NULL,
	nome                 varchar(30)      NOT NULL,
	CONSTRAINT pk_etapaTipo PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.funcao ( 
	id                   smallint    IDENTITY  NOT NULL,
	nome                 varchar(45)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_funcao PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.notaFiscal ( 
	id                   int    IDENTITY  NOT NULL,
	idEmpresa            tinyint      NOT NULL,
	dataEmissao          date      NOT NULL,
	dataVencimento       date      NOT NULL,
	anoCompetencia       smallint      NOT NULL,
	mesCompetencia       tinyint      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_notaFiscal PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.opcaoSistema ( 
	id                   int    IDENTITY  NOT NULL,
	idOpcaoMae           int      NULL,
	descricao            varchar(50)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_opcaoSistema PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.parametrizacao ( 
	id                   smallint    IDENTITY  NOT NULL,
	percentualBonificacao decimal(3,1)      NOT NULL,
	percentualTeto       decimal(3,1)      NOT NULL,
	contadorGatilho      tinyint      NOT NULL,
	dataValidade         date      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_parametrizacao PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.parametrizacaoHistorico ( 
	id                   smallint    IDENTITY  NOT NULL,
	idParametrizacao     smallint      NOT NULL,
	percentualBonificacao decimal(3,1)      NOT NULL,
	percentualTeto       decimal(3,1)      NOT NULL,
	contadorGatilho      tinyint      NOT NULL,
	dataValidade         date      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_parametrizacaoHistorico PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.projetoTipo ( 
	id                   smallint      NOT NULL,
	nome                 varchar(45)      NOT NULL,
	CONSTRAINT pk_projetoTipo PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.tipoTelefone ( 
	id                   tinyint      NOT NULL,
	nome                 varchar(20)      NOT NULL,
	CONSTRAINT pk_tipoTelefone PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.unidade ( 
	id                   smallint      NOT NULL,
	nome                 varchar(25)      NOT NULL,
	CONSTRAINT pk_unidade PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.usuario ( 
	id                   int    IDENTITY  NOT NULL,
	apelido              varchar(36)      NOT NULL,
	email                varchar(100)      NOT NULL,
	senha                varchar(35)      NOT NULL,
	dataExpiracaoSenha   date      NOT NULL,
	dataBloqueio         datetime      NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_usuario PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.usuarioOpcao ( 
	idUsuario            int      NOT NULL,
	idOpcaoSistema       int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	CONSTRAINT pk_usuarioOpcao PRIMARY KEY  ( idUsuario, idOpcaoSistema ) 
 ) ;

CREATE TABLE dbo.colaborador ( 
	id                   smallint    IDENTITY  NOT NULL,
	idUsuario            int      NOT NULL,
	nome                 varchar(60)      NOT NULL,
	dataAdmissao         date      NOT NULL,
	dataDemissao         date      NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_colaborador PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.colaboradorTelefone ( 
	id                   smallint    IDENTITY  NOT NULL,
	idColaborador        smallint      NOT NULL,
	idTipoTelefone       tinyint      NOT NULL,
	DDD                  smallint      NOT NULL,
	numero               int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_colaboradorTelefone PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.contato ( 
	id                   smallint    IDENTITY  NOT NULL,
	idDepartamento       smallint      NOT NULL,
	nome                 varchar(60)      NOT NULL,
	email                varchar(100)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_contato PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.contatoTelefone ( 
	id                   smallint    IDENTITY  NOT NULL,
	idTipoTelefone       tinyint      NOT NULL,
	idContato            smallint      NOT NULL,
	DDD                  smallint      NOT NULL,
	numero               int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_contatoTelefone PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.documento ( 
	id                   int    IDENTITY  NOT NULL,
	idDocumentoTipo      smallint      NOT NULL,
	idColaborador        smallint      NOT NULL,
	nome                 varchar(50)      NOT NULL,
	descricao            varchar(4000)      NOT NULL,
	dataCriacao          date      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_documento PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.faixaSalarial ( 
	id                   smallint    IDENTITY  NOT NULL,
	idFuncao             smallint      NOT NULL,
	nome                 varchar(25)      NOT NULL,
	CLTouPJ              char(1)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_faixaSalarial PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.preco ( 
	id                   int    IDENTITY  NOT NULL,
	idCliente            smallint      NOT NULL,
	idProjetoTipo        smallint      NOT NULL,
	dataValidade         date      NOT NULL,
	valorHora            decimal(6,2)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_preco PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.projeto ( 
	id                   int    IDENTITY  NOT NULL,
	idProjetoMae         int      NULL,
	idPreco              int      NOT NULL,
	nome                 varchar(60)      NOT NULL,
	descricao            varchar(4000)      NOT NULL,
	dataEntrada          datetime      NOT NULL,
	quantidadeTotalMinutos int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_projeto PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.projetoAtividade ( 
	id                   int    IDENTITY  NOT NULL,
	idContato            smallint      NOT NULL,
	idProjeto            int      NOT NULL,
	idAtividade          tinyint      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	CONSTRAINT pk_projetoPapel PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.projetoDocumento ( 
	idProjeto            int      NOT NULL,
	idDocumento          int      NOT NULL,
	CONSTRAINT pk_projetoDocumento PRIMARY KEY  ( idProjeto, idDocumento ) 
 ) ;

CREATE TABLE dbo.projetoEtapa ( 
	id                   int    IDENTITY  NOT NULL,
	idEtapaTipo          smallint      NOT NULL,
	idProjeto            int      NOT NULL,
	dataInicioPrevista   datetime      NULL,
	dataTerminoPrevista  datetime      NULL,
	dataInicio           datetime      NULL,
	dataTermino          datetime      NULL,
	numeroDocUpload      int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_projetoEtapa PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.cargoSalario ( 
	id                   int    IDENTITY  NOT NULL,
	idUnidade            smallint      NOT NULL,
	idFaixaSalarial      smallint      NOT NULL,
	valor                decimal(7,2)      NOT NULL,
	dataValidade         date      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_cargoSalario PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.entrega ( 
	id                   int    IDENTITY  NOT NULL,
	idProjeto            int      NOT NULL,
	idContatoHomologacao smallint      NOT NULL,
	idContatoAprovacaoo  smallint      NOT NULL,
	dataInicioPrevista   datetime      NULL,
	dataTerminoPrevista  datetime      NULL,
	dataInicio           datetime      NULL,
	dataEntrega          datetime      NULL,
	descricao            varchar(4000)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_entrega PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.entregaDocumento ( 
	idEntrega            int      NOT NULL,
	idDocumento          int      NOT NULL,
	CONSTRAINT pk_entregaDocumento PRIMARY KEY  ( idEntrega, idDocumento ) 
 ) ;

CREATE TABLE dbo.itemNotaFiscal ( 
	id                   int    IDENTITY  NOT NULL,
	idNotaFiscal         int      NOT NULL,
	idEntrega            int      NULL,
	idProjetoEtapa       int      NULL,
	descricao            varchar(4000)      NOT NULL,
	valor                decimal(8,2)      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_itemNotaFiscal PRIMARY KEY  ( id ) 
 ) ;

CREATE TABLE dbo.qualificacao ( 
	id                   int    IDENTITY  NOT NULL,
	idCargoSalario       int      NOT NULL,
	idColaborador        smallint      NOT NULL,
	dataInicio           date      NOT NULL,
	dataFim              date      NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao datetime      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_qualificacao PRIMARY KEY  ( id ) ,
	CONSTRAINT [CONSTRAINT dataFim_maior_dataInicio] CHECK ( [dataFim] > [dataInicio] )
 ) ;

CREATE TABLE dbo.colaboradorEntrega ( 
	id                   int    IDENTITY  NOT NULL,
	idColaborador        smallint      NOT NULL,
	idEntrega            int      NOT NULL,
	descricao            varchar(4000)      NOT NULL,
	quantidadeMinutosCobrados int      NOT NULL,
	quantidadeMinutosNaoCobrados int      NOT NULL,
	usuarioCadastro      int      NOT NULL,
	dataCadastro         datetime  DEFAULT getdate()    NOT NULL,
	usuarioUltimaAlteracao int      NULL,
	dataUltimaAlteracao  datetime      NULL,
	CONSTRAINT pk_colaboradorEntrega PRIMARY KEY  ( id ) 
 ) ;

CREATE UNIQUE  INDEX unq_usuario ON dbo.usuario ( email ) ;

ALTER TABLE dbo.departamento ADD CONSTRAINT fk_departamento_cliente FOREIGN KEY ( idCliente ) REFERENCES dbo.cliente( id ) ;

ALTER TABLE dbo.notaFiscal ADD CONSTRAINT fk_notafiscal_empresa FOREIGN KEY ( idEmpresa ) REFERENCES dbo.empresa( id ) ;

ALTER TABLE dbo.opcaoSistema ADD CONSTRAINT fk_opcaosistema_opcaosistema FOREIGN KEY ( idOpcaoMae ) REFERENCES dbo.opcaoSistema( id ) ;

ALTER TABLE dbo.usuarioOpcao ADD CONSTRAINT fk_usuarioopcao_usuario FOREIGN KEY ( idUsuario ) REFERENCES dbo.usuario( id ) ;

ALTER TABLE dbo.usuarioOpcao ADD CONSTRAINT fk_usuarioopcao_opcaosistema FOREIGN KEY ( idOpcaoSistema ) REFERENCES dbo.opcaoSistema( id ) ;

ALTER TABLE dbo.colaborador ADD CONSTRAINT fk_colaborador_usuario FOREIGN KEY ( idUsuario ) REFERENCES dbo.usuario( id ) ;

ALTER TABLE dbo.colaboradorTelefone ADD CONSTRAINT fk_colaboradortelefone FOREIGN KEY ( idTipoTelefone ) REFERENCES dbo.tipoTelefone( id ) ;

ALTER TABLE dbo.colaboradorTelefone ADD CONSTRAINT fk_colaboradorTelefone_colaborador FOREIGN KEY ( idColaborador ) REFERENCES dbo.colaborador( id ) ;

ALTER TABLE dbo.contato ADD CONSTRAINT fk_contato_departamento FOREIGN KEY ( idDepartamento ) REFERENCES dbo.departamento( id ) ;

ALTER TABLE dbo.contatoTelefone ADD CONSTRAINT fk_contatotelefone_contato FOREIGN KEY ( idContato ) REFERENCES dbo.contato( id ) ;

ALTER TABLE dbo.contatoTelefone ADD CONSTRAINT fk_contatotelefone FOREIGN KEY ( idTipoTelefone ) REFERENCES dbo.tipoTelefone( id ) ;

ALTER TABLE dbo.documento ADD CONSTRAINT fk_documento_colaborador FOREIGN KEY ( idColaborador ) REFERENCES dbo.colaborador( id ) ;

ALTER TABLE dbo.documento ADD CONSTRAINT fk_documento_tipodocumento FOREIGN KEY ( idDocumentoTipo ) REFERENCES dbo.documentoTipo( id ) ;

ALTER TABLE dbo.faixaSalarial ADD CONSTRAINT fk_faixasalarial_faixasalarial FOREIGN KEY ( idFuncao ) REFERENCES dbo.funcao( id ) ;

ALTER TABLE dbo.preco ADD CONSTRAINT fk_preco_cliente FOREIGN KEY ( idCliente ) REFERENCES dbo.cliente( id ) ;

ALTER TABLE dbo.preco ADD CONSTRAINT fk_preco_projetotipo FOREIGN KEY ( idProjetoTipo ) REFERENCES dbo.projetoTipo( id ) ;

ALTER TABLE dbo.projeto ADD CONSTRAINT fk_projeto_preco FOREIGN KEY ( idPreco ) REFERENCES dbo.preco( id ) ;

ALTER TABLE dbo.projeto ADD CONSTRAINT fk_projeto_projeto FOREIGN KEY ( idProjetoMae ) REFERENCES dbo.projeto( id ) ;

ALTER TABLE dbo.projetoAtividade ADD CONSTRAINT fk_projetopapel_contato FOREIGN KEY ( idContato ) REFERENCES dbo.contato( id ) ;

ALTER TABLE dbo.projetoAtividade ADD CONSTRAINT fk_projetopapel_projeto FOREIGN KEY ( idProjeto ) REFERENCES dbo.projeto( id ) ;

ALTER TABLE dbo.projetoAtividade ADD CONSTRAINT fk_projetoatividade_atividade FOREIGN KEY ( idAtividade ) REFERENCES dbo.atividade( id ) ;

ALTER TABLE dbo.projetoDocumento ADD CONSTRAINT fk_projetodocumento_projeto FOREIGN KEY ( idProjeto ) REFERENCES dbo.projeto( id ) ;

ALTER TABLE dbo.projetoDocumento ADD CONSTRAINT fk_projetodocumento_documento FOREIGN KEY ( idDocumento ) REFERENCES dbo.documento( id ) ;

ALTER TABLE dbo.projetoEtapa ADD CONSTRAINT fk_projetoetapa_etapatipo FOREIGN KEY ( idEtapaTipo ) REFERENCES dbo.etapaTipo( id ) ;

ALTER TABLE dbo.projetoEtapa ADD CONSTRAINT fk_projetoEtapa_projeto FOREIGN KEY ( idProjeto ) REFERENCES dbo.projeto( id ) ;

ALTER TABLE dbo.cargoSalario ADD CONSTRAINT fk_cargoSalario_unidade FOREIGN KEY ( idUnidade ) REFERENCES dbo.unidade( id ) ;

ALTER TABLE dbo.cargoSalario ADD CONSTRAINT fk_cargoSalario_faixaSalarial FOREIGN KEY ( idFaixaSalarial ) REFERENCES dbo.faixaSalarial( id ) ;

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_projeto FOREIGN KEY ( idProjeto ) REFERENCES dbo.projeto( id ) ;

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_contato FOREIGN KEY ( idContatoHomologacao ) REFERENCES dbo.contato( id ) ;

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_contatoaprovacao FOREIGN KEY ( idContatoAprovacaoo ) REFERENCES dbo.contato( id ) ;

ALTER TABLE dbo.entregaDocumento ADD CONSTRAINT fk_entregadocumento_documento FOREIGN KEY ( idDocumento ) REFERENCES dbo.documento( id ) ;

ALTER TABLE dbo.entregaDocumento ADD CONSTRAINT fk_entregadocumento_entrega FOREIGN KEY ( idEntrega ) REFERENCES dbo.entrega( id ) ;

ALTER TABLE dbo.itemNotaFiscal ADD CONSTRAINT fk_itemnotafiscal_entrega FOREIGN KEY ( idEntrega ) REFERENCES dbo.entrega( id ) ;

ALTER TABLE dbo.itemNotaFiscal ADD CONSTRAINT fk_itemnotafiscal_projetoetapa FOREIGN KEY ( idProjetoEtapa ) REFERENCES dbo.projetoEtapa( id ) ;

ALTER TABLE dbo.itemNotaFiscal ADD CONSTRAINT fk_itemnotafiscal_notafiscal FOREIGN KEY ( idNotaFiscal ) REFERENCES dbo.notaFiscal( id ) ;

ALTER TABLE dbo.qualificacao ADD CONSTRAINT fk_qualificacao_colaborador FOREIGN KEY ( idColaborador ) REFERENCES dbo.colaborador( id ) ;

ALTER TABLE dbo.qualificacao ADD CONSTRAINT fk_qualificacao_cargosalario FOREIGN KEY ( idCargoSalario ) REFERENCES dbo.cargoSalario( id ) ;

ALTER TABLE dbo.colaboradorEntrega ADD CONSTRAINT fk_colaboradorentrega FOREIGN KEY ( idColaborador ) REFERENCES dbo.colaborador( id ) ;

ALTER TABLE dbo.colaboradorEntrega ADD CONSTRAINT fk_colaboradorentrega_entrega FOREIGN KEY ( idEntrega ) REFERENCES dbo.entrega( id ) ;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela atividade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'atividade', @level2type=N'INDEX',@level2name=N'pk_atividade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que descreve a atividade do contato no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'atividade';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'atividade', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o nome da atividade do contato no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'atividade', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificacao da tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela cargo salario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'idCargoSalario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela cargo Salario como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'idUnidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da cargo Salario como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'idFaixaSalarial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o valor da faixa salarial por colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'valor';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe a data em que a faixa salarial passou a ser valida com o novo valor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'dataValidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalarioHistorico', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'INDEX',@level2name=N'pk_cliente';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena os dados do cliente.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber razão social do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'razaoSocial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome fantasia do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'nomeFantasia';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o CNPJ do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'CNPJ';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero da  Inscrição Estadual do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'inscricaoEstadual';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero da Inscrição Municipal do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'inscricaoMunicipal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome da rua do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'rua';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber numero de endereço do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'numero';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo opcional para  receber complemento do endereço do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'complemento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber bairro onde cliente se localiza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'bairro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a cidade que o cliente está localizado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'cidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber sigla do estado onde cliente está localizado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'UF';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para recebr o CEP do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'CEP';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cliente', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'CONSTRAINT',@level2name=N'fk_departamento_cliente';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'INDEX',@level2name=N'pk_departamento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela cliente como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'idCliente';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'departamento', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela tipoDocumento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documentoTipo', @level2type=N'INDEX',@level2name=N'pk_tipoDocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do tipo do documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documentoTipo';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documentoTipo', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a descrição do tipo de documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documentoTipo', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'INDEX',@level2name=N'pk_empresa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que  armazena dados da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a razao social da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'razaoSocial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome fantasia da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'nomeFantasia';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber CNPJ da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'CNPJ';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber numero da inscrição Estadual da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'inscricaoEstadual';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero da inscrição Municipal da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'inscricaoMunicipal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome da rua em que se localiza a empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'rua';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber numero do endereço onde se localiza a empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'numero';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber complemento do endereço da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'complemento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber bairro da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'bairro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o nome da cidade que a empresa esta localizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'cidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber sigla do estado em que a empresa esta localizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'UF';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber  CEP onde a empresa se localiza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'CEP';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'empresa', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação na tabela etapaTipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'etapaTipo', @level2type=N'INDEX',@level2name=N'pk_etapaTipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena o tipo de etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'etapaTipo';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'etapaTipo', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe nome do tipo de etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'etapaTipo', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela funcao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'INDEX',@level2name=N'pk_funcao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena a função de cada colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a descrição do nome da função' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'funcao', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'CONSTRAINT',@level2name=N'fk_notafiscal_empresa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela notaFiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'INDEX',@level2name=N'pk_notaFiscal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados da nota fiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na  tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela empresa com uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'idEmpresa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de emissão da nota fiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'dataEmissao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data que a nota fiscal irá vencer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'dataVencimento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber ano de compentência para pagamento da nota' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'anoCompetencia';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber mês de competência para pagamento da nota' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'mesCompetencia';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'notaFiscal', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrageira para tabela opcaoSistema criando um auto relacionamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'CONSTRAINT',@level2name=N'fk_opcaosistema_opcaosistema';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificao da tabela opcaoSistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'INDEX',@level2name=N'pk_opcaoSistema';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena as opções possiveis do sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela opcaoSistema como uma chave estrangeira em auto relacionamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'idOpcaoMae';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para armazenar a descrição de cada opção do sistema inserida.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'opcaoSistema', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela parametrizacao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'INDEX',@level2name=N'pk_parametrizacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados de parametrização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber percentual de bonificação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'percentualBonificacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber percentual limite que o colaborador pode receber de bônus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'percentualTeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a quantidade de vezes que o colaborador atingiu o limite de percentual da bonificação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'contadorGatilho';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de validade da parametrização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'dataValidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacao', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela parametrizacaoHistorico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'INDEX',@level2name=N'pk_parametrizacaoHistorico';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena o histórico da parametrização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe id da tabela parametrizacao como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'idParametrizacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber percentual de bonificação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'percentualBonificacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber percentual limite que o colaborador pode receber de bônus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'percentualTeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a quantidade de vezes que o colaborador atingiu o limite de percentual da bonificação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'contadorGatilho';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de validade da parametrização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'dataValidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'parametrizacaoHistorico', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela projetoTipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoTipo', @level2type=N'INDEX',@level2name=N'pk_projetoTipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do tipo de projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoTipo';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoTipo', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do tipo de projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoTipo', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela tipoTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoTelefone', @level2type=N'INDEX',@level2name=N'pk_tipoTelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do tipo de telefone do contato do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoTelefone';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoTelefone', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do tipo de telefone do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipoTelefone', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'unidade', @level2type=N'INDEX',@level2name=N'pk_unidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados da unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'unidade';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'unidade', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o nome da unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'unidade', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'INDEX',@level2name=N'pk_usuario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena as informações de login do usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o apelido nome do usuário para cadastro.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'apelido';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o email que será usado como login' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'email';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber senha do login' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'senha';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe a tada de expiracação da senha' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'dataExpiracaoSenha';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para armazenar a data de bloqueio do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'dataBloqueio';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'CONSTRAINT',@level2name=N'fk_usuarioopcao_usuario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela opcaoSistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'CONSTRAINT',@level2name=N'fk_usuarioopcao_opcaosistema';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela usuarioOpcao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'INDEX',@level2name=N'pk_usuarioOpcao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena opções do usuario no sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave composta da tabela usuarioOpcao_usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'COLUMN',@level2name=N'idUsuario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave composta da tabela usuarioOpcao_opcaoSistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'COLUMN',@level2name=N'idOpcaoSistema';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuarioOpcao', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'CONSTRAINT',@level2name=N'fk_colaborador_usuario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'INDEX',@level2name=N'pk_colaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela usuario como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'idUsuario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de admissão do colaborador na empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'dataAdmissao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de demissao do colaborador na empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'dataDemissao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaborador', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela tipoTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'CONSTRAINT',@level2name=N'fk_colaboradortelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'CONSTRAINT',@level2name=N'fk_colaboradorTelefone_colaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela colaboradorTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'INDEX',@level2name=N'pk_colaboradorTelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do telefone dos colaboradores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela colaborador com uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'idColaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela tipoTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'idTipoTelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o DDD do telefone dos colaboradores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'DDD';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero do telefone dos colaboradores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'numero';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorTelefone', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'CONSTRAINT',@level2name=N'fk_contato_departamento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'INDEX',@level2name=N'pk_contato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena os contatos responsáveis pelo projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber  identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela departamento como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'idDepartamento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o e-mail do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'email';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'CONSTRAINT',@level2name=N'fk_contatotelefone_contato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela tipoTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'CONSTRAINT',@level2name=N'fk_contatotelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela contatoTelefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'INDEX',@level2name=N'pk_contatoTelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela para armazenar dados do telefone do contato do cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela tipoTelefone como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'idTipoTelefone';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela contato como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'idContato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o DDD do telefone do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'DDD';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero do telefone do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'numero';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contatoTelefone', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'CONSTRAINT',@level2name=N'fk_documento_colaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela documentoTipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'CONSTRAINT',@level2name=N'fk_documento_tipodocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'INDEX',@level2name=N'pk_documento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena todos os documentos do sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela documentoTipo como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'idDocumentoTipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela colaborador como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'idColaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber descrição expllicativa do documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de criação do documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'dataCriacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'documento', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela funcao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'CONSTRAINT',@level2name=N'fk_faixasalarial_faixasalarial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela faixaSalarial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'INDEX',@level2name=N'pk_faixaSalarial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena a  faixa salarial  por níveis  dos colaboradores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela funcao como uma chave estrangeira.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'idFuncao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o nome da faixa salarial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a sigla C para CLT ou P para PJ para definir vinculo empregativo do colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'CLTouPJ';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'faixaSalarial', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'CONSTRAINT',@level2name=N'fk_preco_cliente';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projetoTipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'CONSTRAINT',@level2name=N'fk_preco_projetotipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela preco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'INDEX',@level2name=N'pk_preco';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena o valor minuto de cada tipo de projeto para cada cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela cliente como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'idCliente';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela projetoTipo como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'idProjetoTipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data de Valdiade do preço do cliente no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'dataValidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o valor por minuto do cliente para cada tipo de projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'valorHora';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'preco', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela preco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'CONSTRAINT',@level2name=N'fk_projeto_preco';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira com autorelacionamento com a tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'CONSTRAINT',@level2name=N'fk_projeto_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'INDEX',@level2name=N'pk_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe um autorelacionamento.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'idProjetoMae';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id tabela preco como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'idPreco';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber nome do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'nome';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber descrição explicativa do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para estimar data de entrega do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'dataEntrada';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber total de minutos que o projeto será concluido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'quantidadeTotalMinutos';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projeto', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'CONSTRAINT',@level2name=N'fk_projetopapel_contato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'CONSTRAINT',@level2name=N'fk_projetopapel_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela Atividade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'CONSTRAINT',@level2name=N'fk_projetoatividade_atividade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela projetoAtividade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'INDEX',@level2name=N'pk_projetoPapel';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena a função de determinado contato no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber idetntificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela contato como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'idContato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela projeto como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'idProjeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela atividade como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'idAtividade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoAtividade', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento', @level2type=N'CONSTRAINT',@level2name=N'fk_projetodocumento_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave Estrangeira para tabela documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento', @level2type=N'CONSTRAINT',@level2name=N'fk_projetodocumento_documento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela projetoDocumento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento', @level2type=N'INDEX',@level2name=N'pk_projetoDocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela associativa que armazena as tabelas Projeto e Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela projeto como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento', @level2type=N'COLUMN',@level2name=N'idProjeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela documento como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoDocumento', @level2type=N'COLUMN',@level2name=N'idDocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeria para tabela etapaTipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'CONSTRAINT',@level2name=N'fk_projetoetapa_etapatipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'CONSTRAINT',@level2name=N'fk_projetoEtapa_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela projetoEtapa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'INDEX',@level2name=N'pk_projetoEtapa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados das etapas do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe etapaTipo como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'idEtapaTipo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira da tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'idProjeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de inicio prevista da etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataInicioPrevista';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data termino prevista da etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataTerminoPrevista';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de iniciação da etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataInicio';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de termino da etapa no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataTermino';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o numero do documento de Uplodad gerado no azure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'numeroDocUpload';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'projetoEtapa', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'CONSTRAINT',@level2name=N'fk_cargoSalario_unidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificacao da tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave composta da tabela cargoSalario_unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'idUnidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave composta da tabela cargoSalario_FaixaSalarial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'idFaixaSalarial';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o valor da faixa salarial por colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'valor';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe a data em que a faixa salarial passou a ser valida com o novo valor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'dataValidade';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cargoSalario', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'CONSTRAINT',@level2name=N'fk_entrega_projeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'chave estrangeira para tabela Contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'CONSTRAINT',@level2name=N'fk_entrega_contato';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'CONSTRAINT',@level2name=N'fk_entrega_contatoaprovacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela entrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'INDEX',@level2name=N'pk_entrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena dados das entregas do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id da tabela projeto como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'idProjeto';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela contato como uma chave estrangeira.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'idContatoHomologacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela contato como uma chave estrangeira.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'idContatoAprovacaoo';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de inicio prevista da entrega da etapa do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataInicioPrevista';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de termino prevista da entrega da etapa do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataTerminoPrevista';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de inicio da entraga da etapa do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataInicio';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data de entrega do projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataEntrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a descrição de definição da entrega.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entrega', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento', @level2type=N'CONSTRAINT',@level2name=N'fk_entregadocumento_documento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela entrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento', @level2type=N'CONSTRAINT',@level2name=N'fk_entregadocumento_entrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela entregaDocumento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento', @level2type=N'INDEX',@level2name=N'pk_entregaDocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela associativa que armazena dados dos documentos da entrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela entrega como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento', @level2type=N'COLUMN',@level2name=N'idEntrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela documento como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'entregaDocumento', @level2type=N'COLUMN',@level2name=N'idDocumento';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela entrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'CONSTRAINT',@level2name=N'fk_itemnotafiscal_entrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela projetoEtapa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'CONSTRAINT',@level2name=N'fk_itemnotafiscal_projetoetapa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela notaFiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'CONSTRAINT',@level2name=N'fk_itemnotafiscal_notafiscal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela itemNotaFiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'INDEX',@level2name=N'pk_itemNotaFiscal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena itens da entrega e da nota fiscal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela notaFiscal como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'idNotaFiscal';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela entrega como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'idEntrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave que recebe o id da tabela projetoEtapa como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'idProjetoEtapa';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber descrição da informações da entrega do projeto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o valor da nota' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'valor';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da última alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'itemNotaFiscal', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'CONSTRAINT',@level2name=N'fk_qualificacao_colaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela cargo Salario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'CONSTRAINT',@level2name=N'fk_qualificacao_cargosalario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação databela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'INDEX',@level2name=N'pk_qualificacao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela que armazena qualificação dos colaboradores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificacao da tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chaque que recebe o id da tabela cargo salario como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'idCargoSalario';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave que recebe o id colaborador como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'idColaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que armazena a data de inicio que o colaborador inicio na faixaSalarial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'dataInicio';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que armazena a data fim que o colaborador encerou na faixa salarial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'dataFim';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qualificacao', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela colaborador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'CONSTRAINT',@level2name=N'fk_colaboradorentrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave estrangeira para tabela entrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'CONSTRAINT',@level2name=N'fk_colaboradorentrega_entrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Chave de identificação da tabela colaboradorEntrega' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'INDEX',@level2name=N'pk_colaboradorEntrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Tabela intermediária que armazena minutos trabalhados pelo colaborador no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega';;

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a identificação na tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'id';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela colaborador como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'idColaborador';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo que recebe o id da tabela entrega como uma chave estrangeira' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'idEntrega';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber descrição do colaborador referente a entrega construida pelo mesmo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'descricao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para descrever a quantidade em minutos que o colaborador trabalhou no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'quantidadeMinutosCobrados';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para descrever a quantidade de minutos que o colaborador trabalhou a mais no projeto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'quantidadeMinutosNaoCobrados';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'usuarioCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber a data da primeira inserção nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'dataCadastro';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber o id do usuario que fez a ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'usuarioUltimaAlteracao';

exec sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Campo para receber data da ultima alteração nesta tabela' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colaboradorEntrega', @level2type=N'COLUMN',@level2name=N'dataUltimaAlteracao';
