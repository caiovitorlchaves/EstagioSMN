--------------------------- SELECT ------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelAtividade]') AND objectproperty(ID, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelAtividade]
GO



CREATE PROCEDURE [dbo].[KRTSP_SelAtividade]
	@id         tinyint =null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: atividade.sql
	Objetivo..........: Mostrar todos os dados da tabela atividade
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelAtividade]  @id = null
	*/
	BEGIN
		
		SELECT	nome
			FROM [dbo].[atividade] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO


