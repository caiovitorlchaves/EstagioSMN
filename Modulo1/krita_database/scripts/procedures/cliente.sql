------------------------------------------- SELECT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelCliente]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_Selcliente]
GO

CREATE PROCEDURE [dbo].[KRTSP_Selcliente]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: cliente.sql
	Objetivo..........: Retornar um ou mais registros da tabela cliente
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_Selcliente] @id = 3
	*/

	BEGIN
		
		SELECT  id,
				razaoSocial,
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
				FROM [dbo].[cliente] WITH(NOLOCK)
				WHERE id = COALESCE(@id,id)

	END
GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsCliente]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsCliente]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsCliente]
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
	Arquivo Fonte.....: cliente.sql
	Objetivo..........: Inserir um novo registro na tabela cliente
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_Inscliente] @razaoSocial = 'momentum', @nomeFantasia = 'momentum ltda', @CNPJ = 45656555665562, @rua = 'Rua 2',@numero = 3, @bairro = 'Graças', @cidade = 'São Paulo', @UF = 'SP', @CEP = 12345678, @usuarioCadastro = 3
	Códigos de retorno: 0 - excução ok
	*/

	BEGIN

		INSERT INTO [dbo].[cliente] (razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioCadastro) VALUES
			(@razaoSocial, @nomeFantasia,@CNPJ, @inscricaoEstadual, @inscricaoMunicipal, @rua, @numero, @complemento, @bairro, @cidade, @UF, @CEP, @usuarioCadastro)
	
		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdCliente]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdCliente]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdCliente]
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
	Arquivo Fonte.....: cliente.sql
	Objetivo..........: Atualizar um registro na tabela cliente
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_Updcliente] @id = 3, @razaoSocial = 'lomentum', @nomeFantasia = 'momentum ltda', @CNPJ = 45656555665562, @rua = 'Rua 2', @numero= 3, @bairro = 'Graças', @cidade = 'São Paulo', @UF = 'SP', @CEP = 12345678, @usuarioUltimaAlteracao = 3
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[cliente]
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

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelCliente]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelCliente]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelCliente]
	@id smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: cliente.sql
	Objetivo..........: Deletar um registro na tabela cliente
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelCliente] @id = 3
	Código de retorno: 0 - excução ok
						1 - id não encontrado
                        2 - esse id esta sendo mencionado em preco
						3 - esse id esta sendo mencionado em departamento
	*/

	BEGIN
		
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[preco] WHERE idcliente = @id)
			RETURN 2
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[departamento] WHERE idCliente = @id)
			RETURN 3
		
		DELETE FROM [dbo].[cliente]
			WHERE id = @id
			
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO