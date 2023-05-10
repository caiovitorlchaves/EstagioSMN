------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelColaboradorTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelColaboradorTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_SelColaboradorTelefone]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaboradorTelefone.sql
	Objetivo..........: Retornar um ou mais registros da tabela colaboradorTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelcolaboradorTelefone]
	*/

	BEGIN
		SELECT  ct.id,
                tt.nome AS tipoTelefone,
				idColaborador,
				DDD,
				numero,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
			FROM [dbo].[colaboradorTelefone] ct WITH(NOLOCK)
				INNER JOIN tipoTelefone tt
					ON tt.id = ct.idTipoTelefone
            
			WHERE ct.id = COALESCE(@id, ct.id)

	END

GO

------------------------------------------- INSERT -------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsColaboradorTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsColaboradorTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsColaboradorTelefone]
    @idTipoTelefone			tinyint,
	@idColaborador			smallint,
	@DDD	                smallint,
	@numero                 int,
    @usuarioCadastro        int

	AS

	/*
	Documentação
	Arquivo Fonte.....: contatoTelefone.sql
	Objetivo..........: Inserir um novo registro na tabela colaboradorTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InscolaboradorTelefone] @idtipoTelefone = 1, @idColaborador = 2,  @DDD = 14, 
                        @numero = 37652533, @usuarioCadastro = 1
						SELECT @Ret AS Retorno
	Códigos de retorno: 0 - excução ok
	*/

	BEGIN

		IF @idTipoTelefone > 2
			RETURN 1

		INSERT INTO [dbo].[colaboradorTelefone] (idTipoTelefone, idColaborador, DDD, numero, usuarioCadastro) VALUES
			(@idTipoTelefone, @idColaborador, @DDD, @numero, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdColaboradorTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdColaboradorTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdColaboradorTelefone]
	@id                     smallint,
    @idTipoTelefone			tinyint,
    @idColaborador          smallint,
	@DDD	                smallint,
	@numero                 int,
    @usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaboradorTelefone.sql
	Objetivo..........: Atualizar um registro na tabela colaboradorTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
                        EXEC @Ret = [dbo].[KRTSP_UpdColaboradorTelefone] @id = 2, @idTipoTelefone = 2, @idColaborador = 1,  @DDD = 11, @numero = 998215961, @usuarioUltimaAlteracao = 10
						SELECT @Ret AS Retorno
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
						2 - id de tipo telefone não encontrado
	*/

	BEGIN
		
		IF @idTipoTelefone > 2
			RETURN 2

		UPDATE [dbo].[colaboradorTelefone]
			SET idTipoTelefone = @idTipoTelefone,
				idColaborador = @idColaborador,
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
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelColaboradorTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelColaboradorTelefone]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelColaboradorTelefone]
	@id	smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: ColaboradorTelefone.sql
	Objetivo..........: Deletar um registro na tabela colaboradorTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelcolaboradorTelefone] @id = 4
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
	*/

	BEGIN

		DELETE FROM [dbo].[colaboradorTelefone]
			WHERE id = @id

        IF @@ROWCOUNT = 0 
            RETURN 1
		RETURN 0
	END

GO