----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelProjetoEtapa]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelProjetoEtapa]
GO


CREATE PROCEDURE [dbo].[KRTSP_SelProjetoEtapa] 
	@id int = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoEtapa.sql
	Objetivo..........: Retornar um ou mais registros da tabela projetoEtapa
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelProjetoEtapa]  @id = null
	*/
	BEGIN
		
		SELECT	id,
				idEtapaTipo,
                idProjeto,
				dataInicioPrevista,
                dataInicio,
                dataTermino,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
				
			FROM [dbo].[ProjetoEtapa] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO




----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsProjetoEtapa]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsProjetoEtapa]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsProjetoEtapa] 
	@idEtapaTipo            smallint,
    @idProjeto              int,
    @dataInicioPrevista     datetime,
    @dataInicio             datetime,
    @dataTermino            datetime = null,
    @usuarioCadastro        int

	AS
    
	/*
	Documentação
	Arquivo Fonte.....: projetoEtapa.sql
	Objetivo..........: Inserir um novo registro na tabela projetoEtapa
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsProjetoEtapa] @idEtapaTipo = 1,@idProjeto = 5, @dataInicioPrevista = '20200202', @dataInicio  = '20200202', @dataTermino = '20200808', @usuarioCadastro = 3
	Códigos de retorno: 0 - execução ok
    */
    
	BEGIN
		
		INSERT INTO [dbo].[ProjetoEtapa] (idEtapaTipo, idProjeto, dataInicioPrevista, dataInicio, dataTermino, usuarioCadastro)
			VALUES(@idEtapaTipo, @idProjeto, @dataInicioPrevista, @dataInicio, @dataTermino, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdProjetoEtapa]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdProjetoEtapa]
GO



CREATE PROCEDURE [dbo].[KRTSP_UpdProjetoEtapa] 
    @id                     int,
	@idEtapaTipo            smallint,
    @idProjeto              int,
    @dataInicioPrevista     datetime,
    @dataInicio             datetime,
    @dataTermino            datetime = null, 
    @usuarioUltimaAlteracao int,
    @dataUltimaAlteracao    datetime

	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoEtapa.sql
	Objetivo..........: Atualizar um registro na tabela projetoEtapa
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdProjetoEtapa] @id = 5, @idEtapaTipo = 1,@idProjeto = 5, @dataInicioPrevista = '20200202', @dataInicio  = '20200202', @dataTermino = Null, @usuarioUltimaAlteracao = 2, @dataUltimaAlteracao = '20200606'
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[ProjetoEtapa]
			SET	idEtapaTipo				= @idEtapaTipo,
                idProjeto               = @idProjeto,
				dataInicioPrevista		= @dataInicioPrevista,
                dataInicio              = @dataInicio,
                dataTermino             = @dataTermino,
				usuarioUltimaAlteracao	= @usuarioUltimaAlteracao,
				dataUltimaAlteracao		= GETDATE()
			WHERE id = @id

            IF @@ROWCOUNT = 0
                RETURN 1

		RETURN 0
	END
GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelProjetoEtapa]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelProjetoEtapa]
GO



CREATE PROCEDURE [dbo].[KRTSP_DelProjetoEtapa] 
	@id			int

	AS

	/*
	Documentação
	Arquivo Fonte.....: projetoEtapa.sql
	Objetivo..........: Deletar um registro na tabela projetoEtapa
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelProjetoEtapa] @id = 5
	Codigos de retorno: 0 - execução OK
                        1 - ID inexistente
                        2 - O ID está sendo mencionado na tabela itemNotaFiscal
    */

	BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM [dbo].[itemNotaFiscal] WHERE idProjetoEtapa = @id)
            RETURN 2

		DELETE FROM [dbo].[ProjetoEtapa]
			WHERE id = @id
		    
            IF @@ROWCOUNT = 0
                RETURN 1

		RETURN 0
	END
GO






