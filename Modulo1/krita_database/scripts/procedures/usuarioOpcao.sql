--------------------------- SELECT ------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelUsuarioOpcao]') AND objectproperty(ID, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelUsuarioOpcao]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelUsuarioOpcao]
	@idUsuario			int = NULL
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: usuarioOpcao.sql
	Objetivo..........: Retornar um ou mais registros da tabela usuarioOpcao
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [KRTSP_SelUsuarioOpcao]  @idUsuario = 1
	*/
	BEGIN
		
		SELECT	idUsuario,
				idOpcaoSistema,
				usuarioCadastro,
				dataCadastro
			FROM [dbo].[usuarioOpcao] WITH(NOLOCK) 
			WHERE idUsuario = COALESCE(@idUsuario,idUsuario)
	END

GO

----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsUsuarioOpcao]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsUsuarioOpcao]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsUsuarioOpcao] 
	@idUsuario			int,
	@idOpcaoSistema		int,
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: usuarioOpcao.sql
	Objetivo..........: Inserir um novo registro na tabela usuarioOpcao
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsUsuarioOpcao] @idUsuario =5, @idOpcaoSistema =1, @usuarioCadastro =3
	Códigos de retorno: 0 - execução ok
	*/
	 
	BEGIN
	
		INSERT INTO [dbo].[usuarioOpcao] (idUsuario, idOpcaoSistema, usuarioCadastro)
			VALUES(@idUsuario, @idOpcaoSistema, @usuarioCadastro)

		RETURN 0
	END
GO

----------------------------------- DELETE ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelUsuarioOpcao]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelUsuarioOpcao]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelUsuarioOpcao] 
	@idUsuario	int,
	@idOpcao	int
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: usuarioOpcao.sql
	Objetivo..........: Deletar um registro na tabela usuarioOpcao
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelUsuarioOpcao] @idUsuario =1, @idOpcao = 5
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		
		DELETE FROM [dbo].[usuarioOpcao] 
			WHERE idUsuario = @idUsuario AND idOpcaoSistema = @idOpcao
		
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO

