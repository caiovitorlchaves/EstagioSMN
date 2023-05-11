---------------------------------------------SELECT---------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_SelDocumento]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelDocumento]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelDocumento]
	@id int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: documento.sql
	Objetivo..........: Retornar um ou mais registros da tabela documento
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [KRTSP_SelDocumento] @id = 4
						SELECT @Ret
	*/

	BEGIN

		SELECT	d.id,
				d.nome,
				dt.nome AS documentoTipo,
				d.idColaborador,
				d.descricao,
				d.dataCriacao,
				d.usuarioCadastro
			FROM [dbo].[documento] d WITH(NOLOCK)
				INNER JOIN documentoTipo dt WITH(NOLOCK)
					ON dt.id = d.idDocumentoTipo
			WHERE d.id = COALESCE(@id, d.id)
		
	END

GO

----------------------------------------- INSERT ----------------------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_InsDocumento]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsDocumento]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsDocumento]
	@idDocumentoTipo	smallint,
	@idColaborador		smallint,
	@nome				varchar(50),
	@descricao			varchar (4000),
	@dataCriacao		date,
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: documento.sql
	Objetivo..........: Inserir um novo registro na tabela documento
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: DECLARE @Ret int
						EXEC [KRTSP_InsDocumento] @idDocumentoTipo = 1, @idColaborador = 2, @nome = 'Documentação de procedures - Krita', @descricao = 'Documentação e explicação das procedures e rotas do sistema krita', @dataCriacao = '20220318', @usuarioCadastro = 3
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
	*/
	BEGIN

		INSERT INTO [dbo].[documento] (idDocumentoTipo, idColaborador, nome, descricao, dataCriacao, usuarioCadastro)
			VALUES(@idDocumentoTipo, @idColaborador, @nome, @descricao, @dataCriacao, @usuarioCadastro)

		RETURN 0
	END
GO

----------------------------------------------------UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_UpdDocumento]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdDocumento]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdDocumento]
	@id						int,
	@idDocumentoTipo		smallint,
	@idColaborador			smallint,
	@nome					varchar (50),
	@descricao				varchar(4000),
	@usuarioUltimaAlteracao int,
	@dataUltimaAlterecao	date = null

	AS

	/*
	Documentação
	Arquivo Fonte.....: documento.sql
	Objetivo..........: Atualizar um registro na tabela documento
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [KRTSP_UpdDocumento] @id = 7, @idDocumentoTipo = 1, @idColaborador = 2, @nome = 'Documentação de procedures - Oxalá', @descricao = 'Documentação e explicação das procedures e rotas da API Oxalá', @usuarioUltimaAlteracao = 3
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[documento]
			SET idDocumentoTipo = @idDocumentoTipo, 
				idColaborador = @idColaborador, 
				nome = @nome, 
				descricao = @descricao, 
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id
		
		IF @@ROWCOUNT = 0 
			RETURN 1

		RETURN 0
	END

GO

------------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_DelDocumento]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelDocumento]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelDocumento]
	@id int

	AS

	/*
	Documentação
	Arquivo Fonte.....: documento.sql
	Objetivo..........: Deletar um registro na tabela documento
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [KRTSP_DelDocumento] @id = 6
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		DELETE FROM [dbo].[projetoDocumento]
			WHERE idDocumento = @id
		DELETE FROM [dbo].[entregaDocumento]
			WHERE idDocumento = @id
		
		DELETE FROM [dbo].[documento]
			WHERE id = @id

		IF @@ROWCOUNT = 0 
			RETURN 1

		RETURN 0
	END

GO
