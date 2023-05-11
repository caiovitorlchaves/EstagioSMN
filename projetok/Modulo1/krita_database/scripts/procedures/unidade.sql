---------------------------------------SELECT-----------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_SelUnidade]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelUnidade]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelUnidade]
	@nome	varchar(25)

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: unidade.sql
	Objetivo..........: Retornar um ou mais registros da tabela unidade
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelUnidade]  @nome = 'Jo�o Pessoa'
	*/

	BEGIN

		SELECT	id,
				nome
			FROM [dbo].[unidade] WITH(NOLOCK)
			WHERE nome = COALESCE(@nome, nome)
	END

GO