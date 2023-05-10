------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelColaboradorEntrega]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelColaboradorEntrega]
go

CREATE PROCEDURE [dbo].[KRTSP_SelColaboradorEntrega]
	@id int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaboradorEntrega.sql
	Objetivo..........: Retornar um ou mais registros da tabela colaboradorEntrega
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelColaboradorEntrega]
	*/

	BEGIN
		SELECT  
                idColaborador,
                idEntrega,
                quantidadeMinutosCobrados,
                quantidadeMinutosNaoCobrados,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
			FROM [dbo].[colaboradorEntrega] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END

GO

------------------------------------------- INSERT -------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InscolaboradorEntrega]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InscolaboradorEntrega]
GO

CREATE PROCEDURE [dbo].[KRTSP_InscolaboradorEntrega]
	@idColaborador              int,
	@idEntrega                  int,
	@quantidadeMinutosCobrados  int,
	@quantidadeMinutosNaoCobrados   int,
	@usuarioCadastro int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaborador.sql
	Objetivo..........: Inserir um novo registro na tabela colaboradorEntrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InscolaboradorEntrega] @idColaborador = 1, @idEntrega = 1, @quantidadeMinutosCobrados = 1, @quantidadeMinutosNaoCobrados = 1,  @usuarioCadastro = 007
						SELECT @Ret AS Retorno
	Códigos de Retorno: 0 - execução ok
	*/

	BEGIN

		INSERT INTO [dbo].[colaboradorEntrega] (idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioCadastro) VALUES
			(@idColaborador, @idEntrega, @quantidadeMinutosCobrados, @quantidadeMinutosNaoCobrados, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdcolaboradorEntrega]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdcolaboradorEntrega]
go

CREATE PROCEDURE [dbo].[KRTSP_UpdcolaboradorEntrega]
	@id                             int,
    @idColaborador                  int,
	@idEntrega                      int,
	@quantidadeMinutosCobrados      int,
	@quantidadeMinutosNaoCobrados   int,
	@usuarioUltimaAlteracao         int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaborador.sql
	Objetivo..........: Atualiza os colaboradores
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................:DECLARE @Ret int 
                       EXEC @Ret = [dbo].[KRTSP_UpdcolaboradorEntrega] @id = 35, @idColaborador = 2, @idEntrega = 2, @quantidadeMinutosCobrados = 100, @quantidadeMinutosNaoCobrados = 100, @usuarioUltimaAlteracao = 007
                       SELECT @Ret as Retorno
	Códigos de Retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[colaboradorEntrega]
			SET idColaborador = @idColaborador,
				idEntrega = @idEntrega,
				quantidadeMinutosCobrados = @quantidadeMinutosCobrados,
				quantidadeMinutosNaoCobrados = @quantidadeMinutosNaoCobrados,
                usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id
        IF @@ROWCOUNT = 0
            RETURN 1
		RETURN 0
	END

GO

------------------------------------------- DELETE --------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelcolaboradorEntrega]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelcolaboradorEntrega]
go

CREATE PROCEDURE [dbo].[KRTSP_DelcolaboradorEntrega]
	@id	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaboradorEntrega.sql
	Objetivo..........: Deletar um registro na tabela colaboradorEntrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
                        EXEC @Ret = [dbo].[KRTSP_delcolaboradorEntrega] @id = 35
                        SELECT @Ret as Retorno
	Códigos de Retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		DELETE FROM [dbo].[colaboradorEntrega]
			WHERE id = @id
        IF @@ROWCOUNT = 0
            RETURN 1
		RETURN 0
	END

GO
