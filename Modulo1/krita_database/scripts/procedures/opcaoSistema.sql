----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelOpcaoSistema]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelOpcaoSistema]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelOpcaoSistema] 
	@idOpcaoMae int = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: opcaoSistema.sql
	Objetivo..........: Retornar um ou mais registros da tabela opcaoSistema
	Autor.............: Estagiarios PB
 	Data..............: 14/03/2022
	Ex................: EXEC [KRTSP_SelOpcaoSistema]  @idOpcaoMae = -1
	obs...............: Nesse codigo o -1 é utilizado como null 
	*/
	BEGIN
		
		SELECT	id,
				idOpcaoMae,
				descricao,
				usuarioCadastro
			FROM [dbo].[opcaoSistema] WITH(NOLOCK) 
			WHERE COALESCE(idOpcaoMae,-1) = COALESCE(@idOpcaoMae, idOpcaoMae)
	END

GO

----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsOpcaoSistema]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsOpcaoSistema]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsOpcaoSistema] 
	@idOpcaoMae			int = null,
	@descricao			varchar(50),
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: opcaoSistema.sql
	Objetivo..........: Inserir um novo registro na tabela opcaoSistema
	Autor.............: Estagiarios PB
 	Data..............: 14/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsOpcaoSistema] @idOpcaoMae = null, @descricao = 'cadastros', @usuarioCadastro = 2
	Códigos de retorno: 0 - excução ok
	*/

	BEGIN
		
		INSERT INTO [dbo].[opcaoSistema] (idOpcaoMae, descricao, usuarioCadastro)
			VALUES(@idOpcaoMae, @descricao, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdOpcaoSistema]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdOpcaoSistema]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdOpcaoSistema] 
	@id						int,
	@idOpcaoMae				int = null,
	@descricao				varchar(50),
	@usuarioUltimaAlteracao	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: opcaoSistema.sql
	Objetivo..........: Atualizar um registro na tabela opcaoSistema
	Autor.............: Estagiarios PB
 	Data..............: 14/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdOpcaoSistema] @id = 1, @idOpcaoMae = null, @descricao = 'cadastros', @usuarioUltimaAlteracao = 2
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[opcaoSistema] 
			SET	idOpcaoMae				= @idOpcaoMae,
				descricao				= @descricao,
				usuarioUltimaAlteracao	= @usuarioUltimaAlteracao,
				dataUltimaAlteracao		= GETDATE()
			WHERE id = @id
		
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelOpcaoSistema]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelOpcaoSistema]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelOpcaoSistema] 
	@id	int
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: opcaoSistema.sql
	Objetivo..........: Deletar um registro na tabela opcaoSistema
	Autor.............: Estagiarios PB
 	Data..............: 14/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelOpcaoSistema] @id = 1
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
						2 - essa empresa esta sendo mencionada em notaFiscal
	*/

	BEGIN

		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[opcaoSistema] WHERE idOpcaoMae = @id)
			RETURN 2
		
		DELETE FROM [dbo].[opcaoSistema] 
			WHERE id = @id
		
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO






