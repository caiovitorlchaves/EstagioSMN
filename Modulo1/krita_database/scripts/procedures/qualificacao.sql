----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_SelQualificacao]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelQualificacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelQualificacao]
	@idColaborador smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: qualificacao.sql
	Objetivo..........: Retornar um ou mais registros da tabela qualificacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelQualificacao]  @idColaborador = 2
	*/

	BEGIN

		SELECT  q.id,
				c.nome AS colaborador,
				u.nome AS unidade,
				f.nome AS função,
				fs.nome AS faixaSalarial,
				q.dataInicio,
				q.dataFim,
				q.usuarioCadastro
			FROM [dbo].[qualificacao] q WITH(NOLOCK)
				INNER JOIN colaborador c WITH(NOLOCK)
					ON c.id = q.idColaborador
				INNER JOIN unidade u WITH(NOLOCK)
					ON u.id = q.idUnidade
				INNER JOIN funcao f WITH(NOLOCK)
					ON f.id = q.idFuncao
				INNER JOIN  faixaSalarial fs WITH(NOLOCK)
					ON fs.id = q.idFaixaSalarial
			WHERE idColaborador = COALESCE(@idColaborador, idColaborador)
	END

GO

----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_InsQualificacao]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsQualificacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsQualificacao]
	@idCargoSalario		int,
	@idColaborador		smallint,
	@dataInicio			date,
	@dataFim			date = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: qualificacao.sql
	Objetivo..........: Inserir um novo registro na tabela qualificacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsQualificacao] @idUnidade = 2, @idColaborador = 2, @idFuncao = 1, @idFaixaSalarial = 10, @dataInicio = '20220601'
	Códigos de retorno: 0 - execução ok
	*/

	BEGIN

		INSERT INTO [dbo].[qualificacao] (idCargoSalario, idColaborador, dataInicio, dataFim, usuarioCadastro)
			VALUES (@idCargoSalario, @idColaborador, @dataInicio, @dataFim, 001)
		
		RETURN 0
	END

GO

----------------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_UpdQualificacao]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdQualificacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdQualificacao]
	@id						int,
	@idCargoSalario			int,
	@idColaborador			smallint,
	@dataInicio				date,
	@dataFim				date = NULL,
	@usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: qualificacao.sql
	Objetivo..........: Atualizar um registro na tabela qualificacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdQualificacao] @id = 7, @idUnidade = 2, @idColaborador = 5, @idFuncao = 3, @idFaixaSalarial = 10, @dataInicio = '20220710', @usuarioUltimaAlteracao = 3 
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
                        2 - data inválida
	*/

	BEGIN

		DECLARE @dataInvalida bit = 0

		UPDATE [dbo].[qualificacao]
			SET idCargoSalario =			@idCargoSalario,
				idColaborador =				@idColaborador,
				dataInicio =				@dataInicio,
				dataFim =					@dataFim,
				usuarioUltimaAlteracao =	@usuarioUltimaAlteracao,
				dataUltimaAlteracao =		GETDATE()
			WHERE id = @id

			--Data fim depois da data atual
			IF(@dataFim < GETDATE())
				SET @dataInvalida = 2

        IF @@ROWCOUNT = 0
            RETURN 1
		RETURN 0
	END

GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE id = object_id(N'[dbo].[KRTSP_DelQualificacao]') AND objectproperty(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelQualificacao]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelQualificacao]
	@id int

	AS

	/*
	Documentação
	Arquivo Fonte.....: qualificacao.sql
	Objetivo..........: Deletar um registro na tabela qualificacao
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelQualificacao] @id = 7
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		DELETE FROM [dbo].[qualificacao]
			WHERE id = @id

        IF @@ROWCOUNT = 0
            RETURN 1
		RETURN 0
	END

GO