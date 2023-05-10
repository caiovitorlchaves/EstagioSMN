------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelTipoTelefone]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelTipoTelefone]
go

CREATE PROCEDURE [dbo].[KRTSP_SelTipoTelefone]
	@id int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: tipoTelefone.sql
	Objetivo..........: Retornar um ou mais registros da tabela tipoTelefone
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelTipoTelefone]
	*/

	BEGIN
		SELECT  id,
				nome
			FROM [dbo].[tipoTelefone] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END

GO

