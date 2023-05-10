------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelContatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelContatoTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_SelContatoTelefone]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Retornar um ou mais registros da tabela contatoTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelContatoTelefone]
	*/

	BEGIN
		SELECT  id,
                idTipoTelefone
				idContato,
				DDD,
				numero,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
			FROM [dbo].[contatoTelefone] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END

GO

------------------------------------------- INSERT -------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsContatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsContatoTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsContatoTelefone]
    @idTipoTelefone			tinyint,
	@idContato			    smallint,
	@DDD	                smallint,
	@numero                 int,
    @usuarioCadastro        int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Inserir um novo registro na tabela contatoTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022 DECLARE @Ret	int
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InsContatoTelefone] @idtipoTelefone = 1, @idContato = 2,  @DDD = 14, @numero = 37652533, @usuarioCadastro = 1
						SELECT @Ret AS Retorno
	Códigos de retorno: 0 - execução ok
	*/

	BEGIN

		INSERT INTO [dbo].[contatoTelefone] (idTipoTelefone, idContato, DDD, numero, usuarioCadastro) VALUES
			(@idTipoTelefone, @idContato, @DDD, @numero, @usuarioCadastro)

		RETURN 0
	END
GO


------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdContatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdContatoTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdContatoTelefone]
	@id                     smallint,
    @idTipoTelefone			tinyint,
	@idContato			    smallint,
	@DDD	                smallint,
	@numero                 int,
    @usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Atualizar um registro na tabela contatoTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdContatoTelefone] @id = 16, @idTipoTelefone = 2, @idContato = 1, @DDD = 11, @numero = 998215961, @usuarioUltimaAlteracao = 10
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[contatoTelefone]
			SET idTipoTelefone = @idTipoTelefone,
				idContato = @idContato,
				DDD = @DDD,
                numero = @numero,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id
            
         IF @@ROWCOUNT = 0 
                RETURN 1
		RETURN 0
	END

GO

------------------------------------------- DELETE --------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelContatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelContatoTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_DelContatoTelefone]
	@id	smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Deletar um registro na tabela contatoTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelContatoTelefone] @id = 17
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		DELETE FROM [dbo].[contatoTelefone]
			WHERE id = @id
        IF @@ROWCOUNT = 0 
                RETURN 1
		RETURN 0
	END

GO

