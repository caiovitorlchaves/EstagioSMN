------------------------------------------- SELECT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelPreco]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelPreco]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelPreco]
	@idProjetoTipo	int = NULL,
	@idCliente		smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: preco.sql
	Objetivo..........: Retornar um ou mais registros da tabela preco
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelPreco] @idProjetoTipo = 3, @idCliente = 1
	*/

	BEGIN

		SELECT  p.id,
				pt.nome,
				p.dataValidade,
				p.valorHora
				FROM [dbo].[preco] p WITH(NOLOCK)
					INNER JOIN [dbo].[projetoTipo] pt WITH(NOLOCK)
						ON pt.id = p.idProjetoTipo
				WHERE p.idCliente = @idCliente AND pt.id = COALESCE(@idProjetoTipo,pt.id)

	END
GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsPreco]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsPreco]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsPreco]
	@idCliente			smallint,
	@idProjetoTipo		smallint,
	@dataValidade		date,
	@valorHora			decimal(6,2),
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: preco.sql
	Objetivo..........: Inserir um novo registro na tabela preco
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsPreco] @idCliente = 1, @idProjetoTipo = 3, @dataValidade = '20221231', @valorHora = 99.99, @usuarioCadastro = 3
	Códigos de retorno: 0 - excução ok
	*/

	BEGIN

		INSERT INTO [dbo].[preco] (idCliente, idProjetoTipo, dataValidade, valorHora, usuarioCadastro)
			VALUES(@idCliente, @idProjetoTipo, @dataValidade, @valorHora, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdPreco]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdPreco]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdPreco]
	@id						int,
	@novaDataValidade		date, 
	@valorHora				decimal(6,2),
	@usuarioUltimaAlteracao	int

	AS

		/*
	Documentação
	Arquivo Fonte.....: preco.sql
	Objetivo..........: Atualizar um registro na tabela preco
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdPreco] @id = 1, @novaDataValidade = '20221231', @valorHora = 99.99, @usuarioUltimaAlteracao = 003
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
						2 - não podemos mudar pois preço esta sendo utilizado
	*/

	BEGIN
		
		DECLARE @dataInicio date
			SET @dataInicio = (SELECT dataValidade FROM [dbo].[preco] WHERE id = @id)

		IF @dataInicio >= CONVERT(date, GETDATE())
			RETURN 2

		UPDATE [dbo].[preco]
			SET dataValidade = @novaDataValidade,
				valorHora = @valorHora
			WHERE id = @id

		IF @@ROWCOUNT = 0
			RETURN 1
		RETURN 0
	END
GO

