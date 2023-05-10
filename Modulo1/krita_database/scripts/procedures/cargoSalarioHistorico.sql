------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelCargoSalarioHistorico]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelCargoSalarioHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelCargoSalarioHistorico]
	@id			int = NULL

	AS
	
	/*
	Documentação
	Arquivo Fonte.....: cargoSalarioHistorico.sql
	Objetivo..........: Retornar um ou mais registros da tabela cargoSalarioHistorico
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_SelCargoSalarioHistorico] 			        
	*/

	BEGIN
		SELECT  idCargoSalario,
				valor,
				dataValidade,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
				FROM [dbo].[cargoSalarioHistorico] WITH(NOLOCK)
				WHERE id = COALESCE(@id,id)

	END
GO

------------------------------------------- INSERT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsCargoSalarioHistorico]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsCargoSalarioHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsCargoSalarioHistorico]
	@idCargoSalario				int,
	@idUnidade					int,
	@idFaixaSalarial			int,
	@valor              		decimal(7, 2),
	@dataValidade				date,
	@usuarioCadastro			int

	AS

	/*
	Documentação
	Arquivo Fonte.....: cargoSalarioHistorico.sql
	Objetivo..........: Insere um ou mais registros da tabela cargoSalarioHistorico
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_InsCargoSalarioHistorico] @idCArgoSalario = 1, @idUnidade = 1, @idFaixaSalarial =1, @valor  = 1, @dataValidade = '20220317', @usuarioCadastro = 1
	Returno...........: 0 - OK
						1 - Não possui id
	*/
	BEGIN

		INSERT INTO [dbo].[cargoSalarioHistorico] (idCargoSalario, idUnidade, idFaixaSalarial, valor, dataValidade, usuarioCadastro) VALUES
			(@idCArgoSalario, @idUnidade, @idFaixaSalarial, @valor, @dataValidade, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdCargoSalarioHistorico]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdCargoSalarioHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdCargoSalarioHistorico]
	@id							int,
	@idCargoSalario				int,
	@idUnidade					int,
	@idFaixaSalarial			int,
	@valor                  	decimal(9, 2),
	@dataValidade				date,
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: cargoSalarioHistorico.sql
	Objetivo..........: Atualizar um registro na tabela cargoSalarioHistorico
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_UpdCargoSalarioHistorico] @id =1, @idCargoSalario = 1, @idUnidade = 1, @idFaixaSalarial = 1, @valor = 1 , @dataValidade = '20220317' , @usuarioUltimaAlteracao = 8
	Retorno...........: 0 - OK
						1 - Não possui id
	*/

	BEGIN
		UPDATE [dbo].[CargoSalarioHistorico]
			SET
				idCargoSalario = @idCargoSalario,
				idUnidade = @idUnidade,
				idFaixaSalarial = @idFaixaSalarial,
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

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelCargoSalarioHistorico]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelCargoSalarioHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelCargoSalarioHistorico]
	@id int

	AS

	/*
	Documentação
	Arquivo Fonte.....: cargoSalarioHistorico.sql
	Objetivo..........: Deletar um registro na tabela cargoSalarioHistorico
	Autor.............: Estagiarios PB
 	Data..............: 01/04/2022
	Ex................: EXEC [dbo].[KRTSP_DelCargoSalarioHistorico] @id = 1
	Retorno...........: 0 - OK
						1 - Não possui id
	*/

	BEGIN
				
		DELETE FROM [dbo].[cargoSalario]
			WHERE id = @id
			
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO