------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelitemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelitemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelitemNotaFiscal]
	@id int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Faz um select para mostrar todos os dados da tabela Item Nota Fiscal.
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelitemNotaFiscal]
	*/

	BEGIN
		SELECT  inf.id,
				ent.descricao,
				etp.nome,
				inf.valor,
				inf.usuarioCadastro,
				inf.dataCadastro
			FROM [dbo].[itemNotaFiscal] inf WITH (NOLOCK)
			INNER JOIN projetoEtapa pe WITH (NOLOCK)
					ON pe.id = inf.idProjetoEtapa
            INNER JOIN etapaTipo etp WITH (NOLOCK)
                    ON etp.id = pe.idEtapaTipo
            INNER JOIN entrega ent WITH (NOLOCK)
					ON ent.id = inf.idEntrega
			WHERE inf.id = COALESCE(@id, inf.id)

          
			


	END

GO

------------------------------------------- INSERT -------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsitemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsitemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsitemNotaFiscal]
	@idNotaFiscal		int,
	@idEntrega			int,
	@idProjetoEtapa	    int,
	@valor              decimal (8,2),
	@usuarioCadastro    int
    


	AS

	/*
	Documentação
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Insere os dados da tabela Item Nota Fiscal
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022 DECLARE @Ret	int
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InsitemNotaFiscal] @idNotaFiscal = 1, @idEntrega = 4, 
                        @idProjetoEtapa = 2, @valor = 1555.00, @usuarioCadastro = 10
						SELECT @Ret AS Retorno
	*/

	BEGIN

		INSERT INTO [dbo].[itemNotaFiscal] (idNotaFiscal, idEntrega, idProjetoEtapa, valor, usuarioCadastro) VALUES
			(@idNotaFiscal, @idEntrega, @idProjetoEtapa, @valor, @usuarioCadastro )

		RETURN 0
	END
GO

SELECT * FROM itemNotaFiscal

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpditemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpditemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpditemNotaFiscal]
	@id                         int,
    @idNotaFiscal				int,
	@idEntrega					int,
	@idProjetoEtapa				int,
	@valor				        decimal(8,2),
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Atualiza os dados da tabela Item Nota Fiscal
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: EXEC [dbo].[KRTSP_upditemNotaFiscal] @id = 1, @idNotaFiscal = 2, @idEntrega = 5, 
                        @idProjetoEtapa = 3, @valor = 2666.00, @usuarioUltimaAlteracao = 11
    */

	BEGIN

		UPDATE [dbo].[itemNotaFiscal]
			SET idNotaFiscal = @idNotaFiscal,
				idEntrega = @idEntrega,
				valor = @valor,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

		RETURN 0
	END

GO

------------------------------------------- DELETE --------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelitemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelitemNotaFiscal]
go

CREATE PROCEDURE [dbo].[KRTSP_DelitemNotaFiscal]
	@id	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Deleta os dados da tabela Item Nota Fiscal
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: EXEC [dbo].[KRTSP_delitemNotaFiscal] @id = 5
	*/

	BEGIN
		DELETE FROM [dbo].[itemNotaFiscal]
			WHERE id = @id

		RETURN 0
	END

GO