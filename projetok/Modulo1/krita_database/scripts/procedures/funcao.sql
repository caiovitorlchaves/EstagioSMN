---------------------------------------SELECT---------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_SelFuncao]') AND objectproperty(id,N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelFuncao]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelFuncao]
	@id int

	AS

	/*
	Documentação
	Arquivo Fonte.....: funcao.sql
	Objetivo..........: Retornar um ou mais registros da tabela funcao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelFuncao]  @id = 6
	*/

	BEGIN
		SELECT	id,
				nome,
				usuarioCadastro
			FROM [dbo].[funcao] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)
	END

GO