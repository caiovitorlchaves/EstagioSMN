
------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelUsuario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelUsuario]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelUsuario]
	@id			int = NULL,
	@apelido	varchar(36) = NULL,
	@email		varchar(100) = NULL,
	@bloqueado	tinyint = null

	AS

	/*
	Documentação
	Arquivo Fonte.....: usuario.sql
	Objetivo..........: Retornar um ou mais registros da tabela usuario
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelUsuario]  @bloqueado = 1
    Obs...............: 0 = Desbloqueado
                        1 = Bloqueado
	Códigos de retorno: 0 - excução ok
				        1 - alguma informação passada esta errada
	*/

	BEGIN
		IF @bloqueado is null
			BEGIN
				SELECT  id,
						apelido,
						email,
						senha,
						dataBloqueio,
						dataExpiracaoSenha
					FROM [dbo].[usuario] WITH(NOLOCK)
					WHERE id = COALESCE(@id, id) AND apelido = COALESCE(@apelido, apelido) AND email = COALESCE(@email, email)
			END
		ELSE IF @bloqueado =0
			BEGIN
				SELECT  id,
						apelido,
						email,
						senha,
						dataBloqueio
					FROM [dbo].[usuario] WITH(NOLOCK)
					WHERE id = COALESCE(@id, id) AND apelido = COALESCE(@apelido, apelido) AND email = COALESCE(@email, email) AND dataBloqueio IS NOT NULL
			END
       
        ELSE 
			BEGIN
				SELECT  id,
						apelido,
						email,
						senha,
						dataBloqueio
					FROM [dbo].[usuario] WITH(NOLOCK)
					WHERE id = COALESCE(@id, id) AND apelido = COALESCE(@apelido, apelido) AND email = COALESCE(@email, email) AND dataBloqueio IS NULL
			END

		IF @@ROWCOUNT = 0
			RETURN 1
	END
GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsUsuario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsUsuario]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsUsuario]
	@apelido                varchar(36),
	@senha					varchar(50),
	@email					varchar(100),
	@dataBloqueio			datetime = NULL,
	@usuarioCadastro		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: usuario.sql
	Objetivo..........: Inserir um novo registro na tabela usuario
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsUsuario]  @apelido = "Mariana",  @email = 'mariana.alves@smn.com.br',  @usuarioCadastro = 004
	Códigos de retorno: 0 - excução ok
				        1 - email de usuario já existente
	*/

	BEGIN
			
		IF EXISTS (SELECT top 1 1 FROM [dbo].[usuario] WITH (NOLOCK) WHERE email = @email)
			RETURN 1
			

		INSERT INTO [dbo].[usuario] (apelido, email, senha, dataExpiracaoSenha, databloqueio, usuarioCadastro) VALUES
			(@apelido, @email, @senha, CONVERT(date,GETDATE()), @dataBloqueio, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdUsuario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdUsuario]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdUsuario]
	@id							int,
	@apelido					varchar(36),
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: usuario.sql
	Objetivo..........: Atualizar um registro na tabela usuario
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdUsuario] @id = 1, @apelido = 'Mariana', @usuarioUltimaAlteracao = 004
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
						2 - email de usuario já existente
	*/

	BEGIN
			
		UPDATE [dbo].[usuario]
			SET	apelido = @apelido,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

		IF @@ROWCOUNT = 0
			RETURN 1

		RETURN 0
	END

GO

