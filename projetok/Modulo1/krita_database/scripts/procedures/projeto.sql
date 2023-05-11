----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelProjeto]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelProjeto]
GO



CREATE PROCEDURE [dbo].[KRTSP_SelProjeto] 
	@id int = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: projeto.sql
	Objetivo..........: Retornar um ou mais registros da tabela projeto
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelProjeto]  @id = 2
	*/
	BEGIN
		
		SELECT	id,
				idPreco,
                nome,
				descricao,
                dataEntrada
                quantidadeTotalMinutos,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
				
			FROM [dbo].[projeto] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO




----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsProjeto]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsProjeto]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsProjeto] 
	@idPreco                int,
    @nome                   varchar(60),
	@descricao              varchar(4000),
    @dataEntrada            datetime,
    @quantidadeTotalMinutos int,
	@usuarioCadastro	    int

	AS
    
	/*
	Documentação
	Arquivo Fonte.....: projeto.sql
	Objetivo..........: Inserir um novo registro na tabela projeto
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsProjeto] @idPreco = 6, @nome = 'Projeto de criacao de procedure', @descricao = 'Projeto voltado para testes', @dataEntrada = '20220202', @quantidadeTotalMinutos = '20000',  @usuarioCadastro = 2
	Códigos de retorno: 0 - execução ok
	*/
    
	BEGIN
		
		INSERT INTO [dbo].[projeto] (idPreco, nome, descricao, dataEntrada, quantidadeTotalMinutos, usuarioCadastro)
			VALUES(@idPreco, @nome, @descricao, @dataEntrada, @quantidadeTotalMinutos, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdProjeto]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdProjeto]
GO



CREATE PROCEDURE [dbo].[KRTSP_UpdProjeto] 
	@id                     int,
    @idPreco                int,
    @nome                   varchar(60),
	@descricao              varchar(4000),
    @quantidadeTotalMinutos int,
    @usuarioUltimaAlteracao int

	AS

	/*
	Documentação
	Arquivo Fonte.....: projeto.sql
	Objetivo..........: Atualizar um registro na tabela projeto
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC [dbo].[KRTSP_UpdProjeto] @id = 5, @idPreco = 3, @nome = 'Procedure PROJECT', @descricao = 'Projeto voltado para testes', @quantidadeTotalMinutos = '20000',  @usuarioUltimaAlteracao = 1
						SELECT @Ret
    Códigos de retorno: 0 - execução ok
                        1 - id não encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[projeto] 
			SET	idPreco				    = @idPreco,
                nome                    = @nome,
				descricao				= @descricao,
				usuarioUltimaAlteracao	= @usuarioUltimaAlteracao,
				dataUltimaAlteracao		= GETDATE()
			WHERE id = @id
            		    
            IF @@ROWCOUNT = 0 
                RETURN 1
		
		RETURN 0
	END
GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelProjeto]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelProjeto]
GO



CREATE PROCEDURE [dbo].[KRTSP_DelProjeto] 
	@id			int
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: projeto.sql
	Objetivo..........: Deletar um registro na tabela projeto
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_DelProjeto] @id = 20
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
						2 - id mencionado na tabela projetoAtividade
						3 - id mencionado na tabela projetoDocumento
						4 - id mencionado na tabela entrega
						5 - id mencionado na tabela projetoEtapa
	*/

	BEGIN
		
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[projetoAtividade] WHERE idProjeto = @id)
			RETURN 2
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[projetoDocumento] WHERE idProjeto = @id)
			RETURN 3
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[entrega] WHERE idProjeto = @id)
			RETURN 4
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[projetoEtapa] WHERE idProjeto = @id)
			RETURN 5


		DELETE FROM [dbo].[projeto] 
			WHERE id = @id

		IF @@ROWCOUNT = 0 
			RETURN 1

		RETURN 0
	END
GO


