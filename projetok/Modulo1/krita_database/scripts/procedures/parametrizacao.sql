------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelParametrizacao]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelParametrizacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelParametrizacao]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: parametrizacao.sql
	Objetivo..........: Retornar um ou mais registros da tabela parametrizacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_selParametrizacao];
	*/

	BEGIN
		SELECT  id,
				percentualBonificacao,
				percentualTeto,
				contadorGatilho,
				dataValidade,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
			FROM [dbo].[parametrizacao] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END

GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsParametrizacao]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsParametrizacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsParametrizacao]
	@percentualBonificacao		decimal(3, 1),
	@percentualTeto				decimal(3, 1),
	@contadorGatilho			tinyint,
	@dataValidade				date,
	@usuarioCadastro			int

	AS

	/*
	Documentação
	Arquivo Fonte.....: parametrizacao.sql
	Objetivo..........: Inserir um novo registro na tabela parametrizacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsParametrizacao]  @percentualBonificacao = 0.5, @percentualTeto = 0.7, @contadorGatilho = 3, @dataValidade = '20220317', @usuarioCadastro = 001;
	Códigos de retorno: 0 - execução ok
	*/
	BEGIN

		INSERT INTO [dbo].[parametrizacao] (percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro) VALUES
			(@percentualBonificacao, @percentualTeto, @contadorGatilho, @dataValidade, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdParametrizacao]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdParametrizacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdParametrizacao]
	@id							smallint,
	@percentualBonificacao		decimal(3, 1),
	@percentualTeto				decimal(3, 1),
	@contadorGatilho			tinyint,
	@dataValidade				date,
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: parametrizacao.sql
	Objetivo..........: Atualizar um registro na tabela parametrizacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdParametrizacao] @id = 2, @percentualBonificacao = 0.2, @percentualTeto = 0.9, @contadorGatilho = 2, @datavalidade = '20220318', @usuarioUltimaAlteracao = 001;
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		UPDATE [dbo].[parametrizacao]
			SET percentualBonificacao = @percentualBonificacao,
				percentualTeto = @percentualTeto,
				contadorGatilho = @contadorGatilho,
				dataValidade = @dataValidade,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO
