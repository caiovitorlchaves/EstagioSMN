------------------------------------------- SELECT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelEmpresa]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelEmpresa]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelEmpresa]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: empresa.sql
	Objetivo..........: Retornar um ou mais registros da tabela empresa
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelEmpresa] @id = 7
	*/

	BEGIN
		
		SELECT  razaoSocial,
				nomeFantasia,
				CNPJ,
				inscricaoEstadual,
				inscricaoMunicipal,
				rua,
				numero,
				bairro,
				cidade,
				UF,
				CEP,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
				FROM [dbo].[empresa] WITH(NOLOCK)
				WHERE id = COALESCE(@id,id)

	END
GO
------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsEmpresa]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsEmpresa]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsEmpresa]
	@razaoSocial		varchar(145),
	@nomeFantasia		varchar(145),
	@CNPJ				bigint,
	@inscricaoEstadual  int = NULL,
	@inscricaoMunicipal int = NULL,
	@rua				varchar(145),
	@numero				varchar(8),
	@complemento		varchar(100) = NULL,
	@bairro				varchar(45),
	@cidade				varchar(60),
	@UF					char(2),
	@CEP				int,
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: empresa.sql
	Objetivo..........: Inserir um novo registro na tabela empresa
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsEmpresa] @razaoSocial = 'momentum', @nomeFantasia = 'momentum ltda', @CNPJ = 45656555665562, @rua = 'Rua 2', @numero = 3, @bairro = 'Graças', @cidade = 'São Paulo', @UF = 'SP', @CEP = 12345678, @usuarioCadastro = 3
	Códigos de retorno: 0 - excução ok
	*/

	BEGIN

		INSERT INTO [dbo].[empresa] (razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioCadastro) VALUES
			(@razaoSocial, @nomeFantasia,@CNPJ, @inscricaoEstadual, @inscricaoMunicipal, @rua, @numero, @complemento, @bairro, @cidade, @UF, @CEP, @usuarioCadastro)
	
		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdEmpresa]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdEmpresa]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdEmpresa]
	@id						smallint,
	@razaoSocial			varchar(145),
	@nomeFantasia			varchar(145),
	@CNPJ					bigint,
	@inscricaoEstadual		int = NULL,
	@inscricaoMunicipal		int = NULL,
	@rua					varchar(145),
	@numero					varchar(8),
	@complemento			varchar(100) = NULL,
	@bairro					varchar(45),
	@cidade					varchar(60),
	@UF						char(2),
	@CEP					int,
	@usuarioUltimaAlteracao	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: empresa.sql
	Objetivo..........: Atualizar um registro na tabela empresa
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdEmpresa] @id = 3, @razaoSocial = 'momentum', @nomeFantasia = 'momentum ltda', @CNPJ = 45656555665562, @rua = 'Rua 2', @numero = 3, @bairro = 'Graças', @cidade = 'São Paulo', @UF = 'SP', @CEP = 12345678, @usuarioUltimaAlteracao = 3
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[empresa]
			SET razaoSocial = @razaoSocial,
				nomeFantasia = @nomeFantasia,
				CNPJ = @CNPJ,
				inscricaoEstadual = @inscricaoEstadual,
				inscricaoMunicipal = @inscricaoMunicipal,
				rua = @rua,
				numero = @numero,
				complemento = @complemento,
				bairro = @bairro,
				cidade = @cidade,
				UF = @UF,
				CEP = @CEP,
				usuarioCadastro = @usuarioUltimaAlteracao
				WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO
------------------------------------------- DELETE --------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelEmpresa]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelEmpresa]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelEmpresa]
	@id smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: empresa.sql
	Objetivo..........: Deletar um registro na tabela aprovacao
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelEmpresa] @id = 3
	Codigo de retorno.: 0 - excução ok
						1 - id não encontrado
						2 - essa empresa esta sendo mencionada em notaFiscal
	*/

	BEGIN

		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[notaFiscal] WHERE idEmpresa = @id)
			RETURN 2

		DELETE FROM [dbo].[empresa]
			WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO