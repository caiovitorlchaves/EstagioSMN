------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelcontatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelcontatoTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_SelcontatoTelefone]
	@id int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Faz um select para mostrar todos os dados da tabela contatoTelefone.
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelcontatoTelefone]
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
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InscontatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InscontatoTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_InscontatoTelefone]
    @idTipoTelefone			tinyint,
	@idContato			    int,
	@DDD	                smallint,
	@numero                 int,
    @usuarioCadastro        int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Insere o Contato Telefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022 DECLARE @Ret	int
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InscontatoTelefone] @idtipoTelefone = 1, @idContato = 2,  @DDD = 14, 
                        @numero = 37652533, @usuarioCadastro = 1
						SELECT @Ret AS Retorno
	*/

	BEGIN
	
		
		

		INSERT INTO [dbo].[contatoTelefone] (idTipoTelefone, idContato, DDD, numero, usuarioCadastro) VALUES
			(@idTipoTelefone, @idContato, @DDD, @numero, @usuarioCadastro)

		RETURN 0
	END
GO


------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdcontatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdcontatoTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdcontatoTelefone]
	@id                     smallint,
    @idTipoTelefone			tinyint,
	@idContato			    int,
	@DDD	                smallint,
	@numero                 int,
    @usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Atualiza o Contato Telefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_updcontatoTelefone] @id = 16, @idTipoTelefone = 2, @idContato = 1, 
                        @DDD = 11, @numero = 998215961, @usuarioUltimaAlteracao = 10
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

SELECT * FROM contatoTelefone

------------------------------------------- DELETE --------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelcontatoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelcontatoTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_DelcontatoTelefone]
	@id	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Deleta o Contato Telefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_delcontatoTelefone] @id = 17
	*/

	BEGIN
		DELETE FROM [dbo].[contatoTelefone]
			WHERE id = @id
        IF @@ROWCOUNT = 0 
                RETURN 1
		RETURN 0
	END

GO

