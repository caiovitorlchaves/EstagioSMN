------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelProjetoAtividade]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelProjetoAtividade]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelProjetoAtividade]
	@idProjetoAtividade			int = NULL,
	@idContato					smallint = NULL,
	@idProjeto					int = NULL,
	@idAtividade				tinyint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoAtividade.sql
	Objetivo..........: Retornar um ou mais registros da tabela projetoAtividade
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: EXEC [dbo].[KRTSP_selProjetoAtividade] @(idProjetoAtividade / idContato / idProjeto / idAtividade) = 1;
	*/

	BEGIN
		SELECT  pa.id AS id,
				c.nome AS contato,
				p.nome AS projeto,
				a.nome AS atividade,
				pa.usuarioCadastro,
				pa.dataCadastro
			FROM [dbo].[projetoAtividade] AS pa WITH(NOLOCK)
				INNER JOIN [dbo].[contato] AS c WITH(NOLOCK)
					ON c.id = pa.idContato
				INNER JOIN [dbo].[projeto] AS p WITH(NOLOCK)
					ON p.id = pa.idProjeto
				INNER JOIN [dbo].[atividade] As a WITH(NOLOCK)
					ON a.id = pa.idAtividade
			WHERE pa.id = COALESCE(@idProjetoAtividade, pa.id)
				AND c.id = COALESCE(@idContato, c.id)
				AND p.id = COALESCE(@idProjeto, p.id)
				AND a.id = COALESCE(@idAtividade, a.id)

	END

GO

------------------------------------------- INSERT -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsProjetoAtividade]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsProjetoAtividade]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsProjetoAtividade]
	@idContato			smallint,
	@idProjeto			int,
	@idAtividade		tinyint,
	@usuarioCadastro	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoAtividade.sql
	Objetivo..........: Inserir um novo registro na tabela projetoAtividade
	Autor.............: Estagiarios PB
 	Data..............: 18/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsProjetoAtividade] @idContato = 3, @idProjeto = 2, @idAtividade = 2, @usuarioCadastro = 001;
	Códigos de retorno: 0 - execução ok
	*/

	BEGIN

		INSERT INTO [dbo].[projetoAtividade] (idContato, idProjeto, idAtividade, usuarioCadastro) VALUES
			(@idContato, @idProjeto, @idAtividade, @usuarioCadastro)

		RETURN 0
		
	END
GO

------------------------------------------- DELETE --------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelProjetoAtividade]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelProjetoAtividade]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelProjetoAtividade]
	@id	int

	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoAtividade.sql
	Objetivo..........: Deletar um registro na tabela projetoAtividade
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelProjetoAtividade] @id = 13;
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		DELETE FROM [dbo].[projetoAtividade]
			WHERE id = @id

			IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO