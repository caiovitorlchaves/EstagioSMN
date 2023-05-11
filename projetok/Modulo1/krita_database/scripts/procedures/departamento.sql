----------------------------------- SELECT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelDepartamento]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelDepartamento]
GO


CREATE PROCEDURE [dbo].[KRTSP_SelDepartamento] 
	@id smallint = null
	
	AS

	/*
	Documenta��o
	Arquivo Fonte.....: departamento.sql
	Objetivo..........: Retornar um ou mais registros da tabela departamento
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [KRTSP_SelDepartamento]  @id = 10
	*/
	BEGIN
		
		SELECT	id,
                idCliente,
                nome,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao	
			FROM [dbo].[departamento] WITH(NOLOCK) 
			WHERE COALESCE(id,-1) = COALESCE(@id, id)
	END

GO




----------------------------------- INSERT ----------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsDepartamento]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsDepartamento]
GO


CREATE PROCEDURE [dbo].[KRTSP_InsDepartamento] 
    @idCliente              smallint,
    @nome                   varchar(60),
    @usuarioCadastro        int
               
	AS
    
	/*
	Documenta��o
	Arquivo Fonte.....: departamento.sql
	Objetivo..........: Inserir um novo registro na tabela departamento
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsDepartamento] @idCliente = 2 , @nome = 'felipe', @usuarioCadastro = 3
	C�digos de retorno: 0 - execu��o ok
    */
    
	BEGIN
		
		INSERT INTO [dbo].[departamento] (idCliente, nome, usuarioCadastro)
			VALUES( @idCliente, @nome, @usuarioCadastro)

		RETURN 0
	END
GO

-------------------------- UPDATE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdDepartamento]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_UpdDepartamento]
GO



CREATE PROCEDURE [dbo].[KRTSP_UpdDepartamento] 
               @id                     smallint,
               @idCliente              smallint,
               @nome                   varchar(60),
               @usuarioUltimaAlteracao int
               

	AS

	/*
	Documenta��o
	Arquivo Fonte.....: departamento.sql
	Objetivo..........: Atualizar um registro na tabela departamento
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_UpdDepartamento]@id = 11, @idCliente = 1 , @nome = 'felipe editado', @usuarioUltimaAlteracao = 3
						SELECT @Ret
    C�digos de retorno: 0 - execu��o ok
                        1 - id n�o encontrado
	*/

	BEGIN
		
		UPDATE [dbo].[departamento] 
			SET	idCliente               = @idCliente,
				nome            		= @nome,
				usuarioUltimaAlteracao	= @usuarioUltimaAlteracao,
				dataUltimaAlteracao		= GETDATE()
			WHERE id = @id
		               		    
            IF @@ROWCOUNT = 0 
                RETURN 1
		
		RETURN 0
	END
GO

------------------------------------- DELETE-------------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_DelDepartamento]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_DelDepartamento]
GO

CREATE PROCEDURE [dbo].[KRTSP_DelDepartamento] 
	@id			smallint
	
	AS

	/*
	Documenta��o
	Arquivo Fonte.....: departamento.sql
	Objetivo..........: Deletar um registro na tabela departamento
	Autor.............: Estagiarios PB
 	Data..............: 17/03/2022
	Ex................: DECLARE @Ret int
						EXEC @Ret = [dbo].[KRTSP_DelDepartamento] @id = 1
						SELECT @Ret
	C�digos de retorno: 0 - Execu��o ok
						1 - id n�o encontrado
						2 - id mencionado na tabela contato
					
	*/

	BEGIN

		IF EXISTS(SELECT TOP 1 1 FROM [dbo].[contato] WHERE idDepartamento = @id)
			RETURN 2
		
		DELETE FROM [dbo].[departamento] 
			WHERE id = @id

		IF @@ROWCOUNT = 0 
			RETURN 1
	
		RETURN 0
	END
GO






