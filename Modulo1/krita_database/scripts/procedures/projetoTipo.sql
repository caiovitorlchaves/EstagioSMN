------------------------------------------- SELECT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelProjetoTipo]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelProjetoTipo]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelProjetoTipo]
	@id smallint = NULL

	AS

		/*
	Documentação
	Arquivo Fonte.....: projetoTipo.sql
	Objetivo..........: Retornar um ou mais registros da tabela projetoTipo
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelProjetoTipo] 
	*/

	BEGIN

		SELECT  id,
				nome
			FROM [dbo].[projetoTipo] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END