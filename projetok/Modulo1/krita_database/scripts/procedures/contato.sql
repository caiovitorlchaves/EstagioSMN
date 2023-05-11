----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelContato]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelContato]
GO


CREATE PROCEDURE [dbo].[KRTSP_SelContato] 
	@id smallint = null
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: contato.sql
	Objetivo..........: Retornar um ou mais registros da tabela contato
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelContato]  @id = null
	*/
	BEGIN
		
		SELECT	id,
                idDepartamento,
                nome,
                email,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
				
			FROM [dbo].[contato] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO




----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsContato]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsContato]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsContato] 
    @idDepartamento         smallint,
    @nome                   varchar(60),
    @email                  varchar(100),
    @usuarioCadastro        int
 

	AS
    
	/*
	Documentação
	Arquivo Fonte.....: contato.sql
	Objetivo..........: Inserir um novo registro na tabela contato
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_InsContato] @idDepartamento = 10, @nome = 'felipe', @email = 'felipedodepartamente@gmail.com', @usuarioCadastro = 3
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
    */
    
	BEGIN
		
		INSERT INTO [dbo].[Contato] (idDepartamento,nome, email, usuarioCadastro)
			VALUES( @idDepartamento, @nome, @email, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdContato]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdContato]
GO



CREATE PROCEDURE [dbo].[KRTSP_UpdContato] 
    @id                     smallint,
    @idDepartamento         smallint,
    @nome                   varchar(60),
    @email                  varchar(100),
    @usuarioCadastro        int, 
    @usuarioUltimaAlteracao int
               

	AS

	/*
	Documentação
	Arquivo Fonte.....: contato.sql
	Objetivo..........: Atualizar um registro na tabela contato
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_UpdContato] @id = 13, @idDepartamento = 10 , @nome = 'felipe', @email = 'felipedodepartamento@gmail.com', @usuarioCadastro = 3, @usuarioUltimaAlteracao = 3
						SELECT @Ret
    Códigos de retorno: 0 - execução ok
                        1 - id não encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[Contato] 
			SET	idDepartamento          = @idDepartamento,
				nome            		= @nome,
                email                   = @email,
				usuarioUltimaAlteracao	= @usuarioUltimaAlteracao,
				dataUltimaAlteracao		= GETDATE()
			WHERE id = @id
		               		    
            IF @@ROWCOUNT = 0 
                RETURN 1
		
		RETURN 0
	END
GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelContato]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelContato]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelContato] 
	@id			smallint
	
	AS

	/*
	Documentação
	Arquivo Fonte.....: contato.sql
	Objetivo..........: Deletar um registro na tabela contato
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_DelContato] @id = 12
						SELECT @Ret
	Códigos de retorno: 0 - execução ok
						1 - id não encontrado
						2 - id mencionado na tabela projetoAtividade
						3 - id mencionado na tabela contatoTelefone
						4 - id mencionado na tabela aprovacao
	*/

	BEGIN

		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[projetoAtividade] WHERE idContato = @id)
			RETURN 2
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[contatoTelefone] WHERE idContato = @id)
			RETURN 3
		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[aprovacao] WHERE idContato = @id)
			RETURN 4
		
		DELETE FROM [dbo].[Contato] 
			WHERE id = @id

		IF @@ROWCOUNT = 0 
			RETURN 1
		
		RETURN 0
	END
GO