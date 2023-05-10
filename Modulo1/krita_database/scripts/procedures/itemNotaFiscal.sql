------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelItemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelItemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelItemNotaFiscal]
	@id			int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Retornar um ou mais registros da tabela itemNotaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................:
				        
	*/

	BEGIN
		SELECT  id,
				valor,				
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
				FROM [dbo].[itemNotaFiscal] WITH(NOLOCK)
				WHERE id = COALESCE(@id,id)

	END
GO

------------------------------------------- INSERT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsItemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsItemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_InItemNotaFiscal]
	@valor              		decimal(8, 2),
	@usuarioCadastro			int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Insere um ou mais registros da tabela itemNotaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................:
				        
	*/
	BEGIN

		INSERT INTO [dbo].[ItemNotaFiscal] (valor, usuarioCadastro) VALUES
			(@valor, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdItemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdItemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdItemNotaFiscal]
	@id							int,
	@valor                  	decimal(8, 2),
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Atualizar um registro na tabela itemNotaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: 
	*/

	BEGIN
		UPDATE [dbo].[itemNotaFiscal]
			SET valor = @valor,			
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO

------------------------------------------- DELTE ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelItemNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelItemNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelItemNotaFiscal]
	@id int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: itemNotaFiscal.sql
	Objetivo..........: Deletar um registro na tabela itemNotaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: 
	*/

	BEGIN
				
		DELETE FROM [dbo].[itemNotaFiscal]
			WHERE id = @id
			
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO

