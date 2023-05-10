------------------------------------------- SELECT ------------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelCargoSalario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelCargoSalario]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelCargoSalario]
	@id			int = NULL

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: cargoSalario.sql
	Objetivo..........: Retornar um ou mais registros da tabela cargoSalario
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_SelCargoSalario] 
				        
	*/

	BEGIN

		SELECT  id,
				idUnidade,
				idFaixaSalarial,
				valor,
				dataValidade,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
				FROM [dbo].[cargoSalario] WITH(NOLOCK)
				WHERE id = COALESCE(@id,id)

	END
GO

------------------------------------------- INSERT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsCargoSalario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsCargoSalario]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsCargoSalario]
	@idUnidade					int,
	@idFaixaSalarial			int,
	@valor              		decimal(7, 2),
	@dataValidade				date,
	@usuarioCadastro			int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: cargoSalario.sql
	Objetivo..........: Insere um ou mais registros da tabela cargoSalario
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_InsCargoSalario] @idUnidade = 1, @idFaixaSalarial = 1, @valor = 1, @dataValidade = '20220316', @usuarioCadastro = 1  
				        
	*/
	BEGIN

		INSERT INTO [dbo].[cargoSalario] (idUnidade, idFaixaSalarial, valor, dataValidade, usuarioCadastro) VALUES
			(@idUnidade, @idFaixaSalarial, @valor, @dataValidade, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdCargoSalario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdCargoSalario]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdCargoSalario]
	@id							int,
	@idUnidade					int,
	@idFaixaSalarial			int,
	@valor                  	decimal(9, 2),
	@dataValidade				date,
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: cargoSalario.sql
	Objetivo..........: Atualizar um registro na tabela cargoSalario
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_UpdCargoSalario] @id = 2 , @idUnidade = 2, @idFaixaSalarial = 2,@valor = 2, @dataValidade = '20220317', @usuarioUltimaAlteracao = 1 
	Retorno: 0 - OK
			 1 - N�o existe ID
	*/

	BEGIN
		UPDATE [dbo].[cargoSalario]
			SET
				idUnidade = @idUnidade,
				idFaixaSalarial= @idFaixaSalarial,				
				valor = @valor,				
				dataValidade = @dataValidade,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO

------------------------------------------- DELTE ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelCargoSalario]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelCargoSalario]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelCargoSalario]
	@id int

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: cargoSalario.sql
	Objetivo..........: Deletar um registro na tabela cargoSalario
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_DelCargoSalario] @id =2
						SELECT @Ret
	Retorno...........: 0 - OK
						1 - N�o existe id
						2 - Pendencia com qualifica��o
						3 - Pendencia com cargoSalarioHistorico 
	*/

	BEGIN
		
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[qualificacao] WHERE idCargoSalario = @id)
			RETURN 2

        IF EXISTS(SELECT TOP 1 1 FROM [dbo].[cargoSalarioHistorico] WHERE idCargoSalario = @id)
			RETURN 3
				
		DELETE FROM [dbo].[cargoSalario]
			WHERE id = @id
			
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO