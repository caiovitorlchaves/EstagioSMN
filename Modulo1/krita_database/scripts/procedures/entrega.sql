----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelEntrega]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelEntrega]
GO



CREATE PROCEDURE [dbo].[KRTSP_SelEntrega] 
	@id int = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: entrega.sql
	Objetivo..........: Retornar um ou mais registros da tabela entrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelEntrega]  @id = null
	*/
	BEGIN
		
		SELECT	id,
				idProjeto,
                dataEntrega,
				descricao,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
				
			FROM [dbo].[entrega] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO




----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsEntrega]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsEntrega]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsEntrega] 

	@idProjeto              int,
    @dataEntrega            datetime,
	@descricao              varchar(4000),
    @usuarioCadastro        int

	AS
    
	/*
	Documentação
	Arquivo Fonte.....: entrega.sql
	Objetivo..........: Inserir um novo registro na tabela entrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsEntrega] @idProjeto = 2, @dataEntrega = '20200202', @descricao = 'entrega para testes', @usuarioCadastro = 3
	Códigos de retorno: 0 - execução ok
    */
    
	BEGIN
		
		INSERT INTO [dbo].[entrega] (idProjeto, dataEntrega, descricao, usuarioCadastro)
			VALUES(@idProjeto, @dataEntrega, @descricao, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdEntrega]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdEntrega]
GO



CREATE PROCEDURE [dbo].[KRTSP_UpdEntrega] 
	@id                     int,
    @idProjeto              int,
    @dataEntrega            datetime,
	@descricao              varchar(4000),
    @usuarioUltimaAlteracao int
	AS

	/*
	Documentação
	Arquivo Fonte.....: entrega.sql
	Objetivo..........: Atualizar um registro na tabela entrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdEntrega]@id = 13, @idProjeto = 2, @dataEntrega = '20200202', @descricao = 'entrega para testes',  @usuarioUltimaAlteracao = 3 
    Códigos de retorno: 0 - execução ok
                        1 - id não encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[entrega] 
			SET	idProjeto				= @idProjeto,
                dataEntrega             = @dataEntrega,
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

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelEntrega]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelEntrega]
GO



CREATE PROCEDURE [dbo].[KRTSP_DelEntrega] 
	@id			int
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: entrega.sql
	Objetivo..........: Deletar um registro na tabela entrega
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_DelEntrega] @id = 13
    Códigos de retorno: 0 - execução ok
                        1 - id não encontrado
                        2 - O id está sendo mencionado na tabela aprovacao
                        3 - O id está sendo mencionado na tabela colaboradorEntrega
                        4 - O id está sendo mencionado na tabela itemNotaFiscal
                        
	*/

    BEGIN
        
		    IF EXISTS (SELECT TOP 1 1 FROM [dbo].[aprovacao] WHERE idEntrega = @id )
                RETURN 2
            IF EXISTS (SELECT TOP 1 1 FROM [dbo].[colaboradorEntrega] WHERE idEntrega = @id )
                RETURN 3
            IF EXISTS (SELECT TOP 1 1 FROM [dbo].[itemNotaFiscal] WHERE idEntrega = @id )
                RETURN 4
            IF EXISTS  (SELECT TOP 1 1 FROM [dbo].[entregaDocumento] WHERE idEntrega = @id )
                DELETE FROM [dbo].[entregaDocumento] 
			        WHERE idEntrega = @id    
                
                DELETE FROM [dbo].[entrega] 
			        WHERE id = @id
		        IF @@ROWCOUNT = 0 
                RETURN 1

		RETURN 0
	END
GO






