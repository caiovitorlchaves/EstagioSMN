--------------------------- SELECT ------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelEtapaTipo]') AND objectproperty(ID, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelEtapaTipo]
GO



CREATE PROCEDURE [dbo].[KRTSP_SelEtapaTipo]
	@id         smallint = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: etapaTipo.sql
	Objetivo..........: Retornar um ou mais registros da tabela etapaTipo
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelEtapaTipo]  @id = 2
	*/
	BEGIN
		
		SELECT	nome
			FROM [dbo].[etapaTipo] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO
