------------------------------------------------SELECT------------------------------------------------

IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelParametrizacaoHistorico]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelParametrizacaoHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_SelParametrizacaoHistorico]
	AS

	/*
	Documentação
	Arquivo Fonte.....: parametrizacaoHistorico.sql
	Objetivo..........: Retornar um ou mais registros da tabela parametrizacaoHistorico
	Autor.............: Estagiario PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_SelParametrizacaoHistorico]
    */

	BEGIN

		SELECT
			idParametrizacao,
			percentualBonificacao,
			percentualTeto,
			contadorGatilho,
			dataValidade,
			usuarioCadastro,
			dataCadastro,
			usuarioUltimaAlteracao,
			dataUltimaAlteracao
			FROM [dbo].[parametrizacaoHistorico] WITH(NOLOCK)

	END

GO


--------------------------------INSERT-----------------------------------

IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_InsParametrizacaoHistorico]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_InsParametrizacaoHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_InsParametrizacaoHistorico]
	@idParametrizacao       smallint,
	@percentualBonificacao  decimal(3,1),
	@percentualTeto         decimal(3,1),
	@contadorGatilho        tinyint,
	@dataValidade           date,
	@usuarioCadastro        int

   AS 

   /*
	Documentação
	Arquivo Fonte.....: parametrizacaoHistorico.sql
	Objetivo..........: Inserir um novo registro na tabela parametrizacaoHistorico
	Autor.............: Estagiario PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_InsParametrizacaoHistorico] 	@idParametrizacao =1, @percentualBonificacao =1.2, @percentualTeto=1.3, @contadorGatilho =6, @dataValidade ='20221231' ,@usuarioCadastro = 2
	Códigos de retorno: 0 - execução ok
    */


	BEGIN
	

		INSERT INTO [dbo].[parametrizacaoHistorico] (idParametrizacao, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro) VALUES
			(@idParametrizacao, @percentualBonificacao, @percentualTeto, @contadorGatilho, @dataValidade, @usuarioCadastro)

		RETURN 0
	END

GO
-------------------------------------------------------UPDATE-------------------------------------------

IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_UpdParametrizacaoHistorico]') AND objectproperty(ID, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[KRTSP_UpdParametrizacaoHistorico]
GO

CREATE PROCEDURE [dbo].[KRTSP_UpdParametrizacaoHistorico]
	@id							int,
	@idParametrizacao			smallint,
	@percentualBonificacao		decimal(3,1),
	@percentualTeto				decimal(3,1),
	@contadorGatilho			tinyint,
	@dataValidade				date,
	@usuarioUltimaAlteracao		int
    
	AS

	/*
	Documentação
	Arquivo Fonte.....: parametrizacaoHistorico.sql
	Objetivo..........: Atualizar um registro na tabela parametrizacaoHistorico
	Autor.............: Estagiario PB
 	Data..............: 17/03/2022
	Ex................: EXEC [dbo].[KRTSP_UpdParametrizacaoHistorico] @id = 5 ,	@idParametrizacao =1, @percentualBonificacao =1.2, @percentualTeto=1.3, @contadorGatilho =6, @dataValidade ='20221231' ,@usuarioUltimaAlteracao = 2
	Códigos de retorno: 0 - excução ok
						1 - id não encontrado
	*/

	BEGIN

		UPDATE [dbo].[parametrizacaoHistorico]
           SET  idParametrizacao		=	@idParametrizacao, 
                percentualBonificacao	=	@percentualBonificacao, 
                percentualTeto			=	@percentualTeto,
				contadorGatilho			=	@contadorGatilho,
				dataValidade			=	@dataValidade,
				usuarioUltimaAlteracao	=	@usuarioUltimaAlteracao
           WHERE id = @id

		   IF @@ROWCOUNT = 0 
                RETURN 1

        RETURN 0
    END

GO

