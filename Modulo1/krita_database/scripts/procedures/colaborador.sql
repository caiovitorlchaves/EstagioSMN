------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelColaborador]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_SelColaborador]
go

CREATE PROCEDURE [dbo].[KRTSP_SelColaborador]
	@id smallint = NULL

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaborador.sqlcccc
	Objetivo..........: Retornar um ou mais registros da tabela colaborador
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelColaborador]
	*/

	BEGIN
		SELECT  id,
				idUsuario,
				nome,
				dataAdmissao,
				dataDemissao,
				usuarioCadastro,
				dataCadastro,
				usuarioUltimaAlteracao,
				dataUltimaAlteracao
			FROM [dbo].[colaborador] WITH(NOLOCK)
			WHERE id = COALESCE(@id, id)

	END

GO

------------------------------------------- INSERT -------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsColaborador]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_InsColaborador]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsColaborador]
	@idUsuario		 int,
	@nome			 varchar(60),
	@dataAdmissao	 date,
	@dataDemissao    date = NULL,
	@usuarioCadastro int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaborador.sql
	Objetivo..........: Inserir um novo registro na tabela colaborador
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022 DECLARE @Ret	int
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InsColaborador] @idUsuario = 1, @nome = "Mariana Alves",  @dataAdmissao = '20220116',  @usuarioCadastro = 004
						SELECT @Ret AS Retorno
	Códigos de retorno: 0 - excução ok
						1 - usuário em uso
	*/

	BEGIN
		IF EXISTS (SELECT top 1 1 FROM [dbo].[colaborador] WITH (NOLOCK) WHERE id = @idUsuario)
			RETURN 1

		INSERT INTO [dbo].[colaborador] (idUsuario, nome, dataAdmissao, usuarioCadastro) VALUES
			(@idUsuario, @nome, @dataAdmissao, @usuarioCadastro)

		RETURN 0
	END
GO


------------------------------------------- UPDATE -------------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdColaborador]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdColaborador]
go

CREATE PROCEDURE [dbo].[KRTSP_UpdColaborador]
	@id							smallint,
	@idUsuario					int,
	@nome						varchar(60),
	@dataAdmissao				date,
	@usuarioUltimaAlteracao		int

	AS

	/*
	Documentação
	Arquivo Fonte.....: colaborador.sql
	Objetivo..........: Atualizar um registro na tabela colaborador
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdColaborador] @id = 3, @idUsuario = 3, @nome = 'Jonattan Aguiar Souza', @dataAdmissao = '20220116', @usuarioUltimaAlteracao = 004
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[colaborador]
			SET idUsuario = @idUsuario,
				nome = @nome,
				dataAdmissao = @dataAdmissao,
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE id = @id
		
		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO

------------------------------------------- DELETE --------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelColaborador]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_DelColaborador]
go

CREATE PROCEDURE [dbo].[KRTSP_DelColaborador]
	@id	smallint

	AS

	/*
	Documentação
	Arquivo Fonte.....: usuario.sql
	Objetivo..........: Deleta os colaboradores selecionados
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelColaborador] @id = 1
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
                        2 - essa id esta sendo mencionada em qualificação
						3 - essa id esta sendo mencionada em colaboradorTelefone
						4 - essa id esta sendo mencionada em colaboradorEntrega
						5 - essa id esta sendo mencionada em documento
	*/

	BEGIN
		
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[qualificacao] WHERE idColaborador = @id)
			RETURN 2
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[colaboradorTelefone] WHERE idColaborador = @id)
			RETURN 3
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[colaboradorEntrega] WHERE idColaborador = @id)
			RETURN 4
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[documento] WHERE idColaborador = @id)
			RETURN 5

		DELETE FROM [dbo].[colaborador]
			WHERE id = @id

		IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END

GO
