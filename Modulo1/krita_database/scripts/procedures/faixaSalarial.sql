-------------------------------------SELECT------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_SelFaixaSalarial]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelFaixaSalarial]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelFaixaSalarial]
	@id			smallint

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: faixaSalarial.sql
	Objetivo..........: Retornar um ou mais registros da tabela faixaSalarial
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelFaixaSalarial]  @id = 1
	*/

	BEGIN
		
		SELECT  id,
				idFuncao,
				nome,
				valor,
				CLTouPJ,
				dataValidade,
				usuarioCadastro
			FROM [dbo].[faixaSalarial] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)
	END

GO

------------------------------------- UPDATE -----------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_UpdFaixaSalarial]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdFaixaSalarial]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdFaixaSalarial]
	@id							smallint,
	@idFuncao					smallint,
	@nome 						varchar(25),
	@valor 						decimal(7,2),
	@CLTouPJ 					char(1),
	@dataValidade 				date,
	@usuarioUltimaAlteracao		int


	AS

	/*
	Documenta��o
	Arquivo Fonte.....: faixaSalarial.sql
	Objetivo..........: Atualizar um registro na tabela faixaSalarial
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [KRTSP_UpdFaixaSalarial]  @id = 41, @nome = 'FF', @valor = 12, @CLTouPJ = 'C', @dataValidade = '20230303', @usuarioUltimaAlteracao = 3
						SELECT @Ret
	Retorno...........: 0 - OK
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[faixaSalarial]
			SET 
				idFuncao = @idFuncao,
				nome = @nome,
				valor = @valor,
				CLTouPJ = @CLTouPJ,
				dataValidade = @dataValidade,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

		IF @@ROWCOUNT = 0
			RETURN 1

		RETURN 0
	END

GO
