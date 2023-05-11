---------------------------TROCAR SENHA ---------------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_TrocarSenha]') AND objectproperty(ID,N'isProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_TrocarSenha]
go

CREATE PROCEDURE [dbo].[KRTSP_TrocarSenha]
	@email                      varchar(100),
	@novaSenha		            varchar(64),
    @usuarioUltimaAlteracao     int

	AS

		/*
	Documenta��o
	Arquivo Fonte.....: login.sql
	Objetivo..........: Realizar a troca de senha do usu�rio
	Autor.............: Estagiarios PB
 	Data..............: 15/03/2022
	Ex................: DECLARE @Ret	int
						EXEC @Ret = [dbo].[KRTSP_TrocarSenha] @email ="usuario@gmail.com", @novaSenha = 'nova_senha', @usuarioUltimaAlteracao=1
						SELECT @Ret AS Retorno
	C�digos de retorno: 0 - execu��o ok
						
						
	*/
	
	BEGIN

		UPDATE [dbo].[usuario]
			SET senha = @novaSenha,
				dataExpiracaoSenha = DATEADD(MONTH, 6, GETDATE()),
				usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				dataUltimaAlteracao = GETDATE()
			WHERE email = @email

		RETURN 0
	END
GO

---------------------------- BLOQUEAR USUARIO -----------------------------------

IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_BloquearUsuario]') AND objectproperty(ID,N'isProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_BloquearUsuario]
GO

CREATE PROCEDURE [dbo].[KRTSP_BloquearUsuario]
    @id							int,
    @usuarioUltimaAlteracao     int,
    @bloqueado                  tinyint

	AS

        /*
    Documenta��o
    Arquivo Fonte.....: login.sql
    Objetivo..........: Realizar o bloqueio da autentica��o do usu�rio
    Autor.............: Estagiarios PB
    Data..............: 15/03/2022
    Ex................: DECLARE @Ret    int
                        EXEC @Ret = [dbo].[KRTSP_BloquearUsuario] @id = 5, @bloqueado = 1, @usuarioUltimaAlteracao = 5
                        SELECT @Ret AS Retorno
    C�digos de retorno: 0 - execu��o ok
						1 - email n�o encontrado
                        
    */

	BEGIN
		IF @Bloqueado = 1
			BEGIN
		        UPDATE [dbo].[usuario]
			        SET dataBloqueio = GETDATE(),
				        usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				        dataUltimaAlteracao = GETDATE()
			        WHERE id = @id
        END
		ELSE
			BEGIN
                UPDATE [dbo].[usuario]
			        SET dataBloqueio = null,
				        usuarioUltimaAlteracao = @usuarioUltimaAlteracao,
				        dataUltimaAlteracao = GETDATE()
			        WHERE id = @id
            END

		IF @@ROWCOUNT = 0
			RETURN 1

		RETURN 0
	END

GO
				