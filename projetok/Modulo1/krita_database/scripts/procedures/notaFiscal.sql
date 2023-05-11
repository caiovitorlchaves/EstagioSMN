------------------------------------------- SELECT ------------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelNotaFiscal]
	@idCliente  smallint = NULL,
	@idNota		int = NULL,
	@idEmpresa  tinyint = NULL,
	@idProjeto  int = NULL,
	@idEntrega  int = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: notaFiscal.sql
	Objetivo..........: Retornar um ou mais registros da tabela notaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: DECLARE @ret int
						EXEC  @ret = [dbo].[KRTSP_SelNotaFiscal]  @idEmpresa = 3
						select @ret
	Códigos de retorno: 0 - execução ok
	*/
	
	BEGIN

		SELECT  c.razaoSocial AS cliente,
				nf.id,
				e.razaoSocial AS empresaNota,
				nf.dataEmissao,
				nf.dataVencimento,
				nf.anoCompetencia,
				nf.mesCompetencia,
				nf.usuarioCadastro
				FROM [dbo].[notaFiscal] nf WITH(NOLOCK)
					INNER JOIN [dbo].[empresa] e WITH(NOLOCK)
						ON e.id = nf.idEmpresa
					INNER JOIN [dbo].[itemNotaFiscal] i WITH(NOLOCK)
						ON nf.id = i.idNotaFiscal
					INNER JOIN [dbo].[entrega] en WITH(NOLOCK)
						ON en.id = i.idEntrega
					INNER JOIN [dbo].[projeto] p WITH(NOLOCK)
						ON p.id = en.idProjeto
					INNER JOIN [dbo].[preco] pr WITH(NOLOCK)
						ON pr.id = p.idPreco
					INNER JOIN [dbo].[cliente] c WITH(NOLOCK)
						ON c.id = pr.idCliente
				WHERE nf.id = COALESCE(@idNota,nf.id)
					AND c.id = COALESCE(@idCliente,c.id)
					AND p.id = COALESCE(@idProjeto,p.id)
					AND en.id = COALESCE(@idEntrega, en.id)
					AND  e.id = COALESCE(@idEmpresa,en.id)

	END
GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsNotaFiscal]
	@idEmpresa		 tinyint,
	@dataEmissao	 date,
	@dataVencimento	 date,
	@anoCompetencia  smallint,
	@mesCompetencia  tinyint,
	@usuarioCadastro int

	AS

	/*
	Documentação
	Arquivo Fonte.....: notaFiscal.sql
	Objetivo..........: Inserir um novo registro na tabela notaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsNotaFiscal] @idEmpresa	=1, @dataEmissao = '20220514', @dataVencimento	= '20220614', @anoCompetencia = 2022, @mesCompetencia = 5, @usuarioCadastro = 6
	Códigos de retorno: 0 - execução ok
	*/

	BEGIN

		INSERT INTO [dbo].[notaFiscal] (idEmpresa, dataEmissao, dataVencimento, anoCompetencia, mesCompetencia, usuarioCadastro)
			VALUES(@idEmpresa, @dataEmissao, @dataVencimento, @anoCompetencia, @mesCompetencia, @usuarioCadastro)

		RETURN 0
	END
GO

------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdNotaFiscal]
	@id						int,
	@idEmpresa				tinyint,
	@dataEmissao			date,
	@dataVencimento			date,
	@anoCompetencia			smallint,
	@mesCompetencia			tinyint,
	@usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: notaFiscal.sql
	Objetivo..........: Atualizar um registro na tabela notaFiscal 
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdNotaFiscal] @id = 2, @idEmpresa = 1, @dataEmissao = '20220514', @dataVencimento	= '20220614', @anoCompetencia = 2022, @mesCompetencia = 5, @usuarioUltimaAlteracao = 6
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[notaFiscal]
			SET idEmpresa = @idEmpresa,
				dataEmissao = @dataEmissao,
				dataVencimento = @dataVencimento,
				anoCompetencia = @anoCompetencia,
				mesCompetencia = @mesCompetencia,
				usuarioUltimaAlteracao = @usuarioUltimaalteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id

		IF @@ROWCOUNT = 0
			RETURN 1

		RETURN 0
	END
GO

------------------------------------------- DELETE --------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelNotaFiscal]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelNotaFiscal]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelNotaFiscal]
	@id	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: notaFiscal.sql
	Objetivo..........: Deletar um registro na tabela notaFiscal
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: DECLARE @RET INT
						EXEC @RET =[dbo].[KRTSP_DelNotaFiscal] @id = 7
						SELECT @RET
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
						2 - esse registro tem uma relação com a tabela itemNotaFiscal
	*/

	BEGIN
			
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[itemNotaFiscal] WHERE idNotaFiscal = @id)
			RETURN 2

		DELETE FROM [dbo].[notaFiscal]
			WHERE id = @id

		IF @@ROWCOUNT = 0
			RETURN 1

		RETURN 0
	END

GO
