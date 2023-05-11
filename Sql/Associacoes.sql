IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_SelAssociacoes]') AND objectproperty(ID, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[GKSSP_SelAssociacoes]
GO

CREATE PROCEDURE [dbo].[GKSSP_SelAssociacoes]
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Listar Associacoess
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_SelAssociacoes]
    */

	BEGIN

		SELECT  sc.Cod_Assoc, 
                sc.Nom_Assoc, 
                sc.Cod_UsuaCad, 
                sc.Dat_Cad, 
                sc.Cod_UsuaAlt, 
                sc.Dat_UltAlt
			FROM [dbo].[GKSDC_Associacoes] sc WITH(NOLOCK)
	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_InsAssociacoes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_InsAssociacoes]
GO

CREATE PROCEDURE [dbo].[GKSSP_InsAssociacoes]
    @Nom_Assoc   varchar (50),
    @Cod_UsuaCad int,
    @Dat_Cad     datetime
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Insere Associacoes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_InsAssociacoes]
	*/

	BEGIN

            INSERT INTO [dbo].[GKSDC_Associacoes] 
                        (Nom_Assoc, Cod_UsuaCad, Dat_Cad)
                VALUES  (@Nom_Assoc, @Cod_UsuaCad, @Dat_Cad)
             RETURN 0
    END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_UpdAssociacoes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_UpdAssociacoes]
GO

CREATE PROCEDURE [dbo].[GKSSP_UpdAssociacoes]
    @Cod_Assoc   smallint,
    @Nom_Assoc   varchar (50),
    @Cod_UsuaAlt int,
    @Dat_UltAlt  datetime
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Altera Associacoes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_UpdAssociacoes]
	*/

	BEGIN

		UPDATE [dbo].[GKSDC_Associacoes]
           SET  Nom_Assoc   = @Nom_Assoc, 
                Cod_UsuaAlt = @Cod_UsuaAlt, 
                Dat_UltAlt  = @Dat_UltAlt
           WHERE Cod_Assoc = @Cod_Assoc

        RETURN 0
	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_DelAssociacoes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_DelAssociacoes]
GO

CREATE PROCEDURE [dbo].[GKSSP_DelAssociacoes]
    @Cod_Assoc smallint
    AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Deleta Associacoes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_DelAssociacoes]
	*/

	BEGIN

		DELETE [dbo].[GKSDC_Associacoes]
           WHERE Cod_Assoc = @Cod_Assoc

	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_SelAssocClientes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_SelAssocClientes]
GO

CREATE PROCEDURE [dbo].[GKSSP_SelAssocClientes]
    @Cod_Assoc smallint
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Listar AssocClientess
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_SelAssocClientes]1
    */

	BEGIN

		SELECT  ac.Cod_Assoc, 
                sc.Nom_Assoc, 
                ac.Num_CliCPFCNPJ, 
                cl.Nom_Cli, 
				ac.Dat_IniAssoc,
				ac.Dat_FimAssoc,
                ac.Cod_UsuaCad, 
                ac.Dat_Cad,
				ac.Cod_UsuaAlt,
				ac.Dat_UltAlt
			FROM [dbo].[GKSDC_AssocClientes] ac WITH(NOLOCK)
            INNER JOIN [dbo].[GKSDC_Associacoes] sc WITH(NOLOCK)
                ON sc.Cod_Assoc = ac.Cod_Assoc
            INNER JOIN [dbo].[GKSLT_Clientes] cl WITH(NOLOCK)
                ON cl.Num_CliCPFCNPJ = ac.Num_CliCPFCNPJ
            WHERE ac.Cod_Assoc = @Cod_Assoc
	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_InsAssocClientes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_InsAssocClientes]
GO

CREATE PROCEDURE [dbo].[GKSSP_InsAssocClientes]
    @Cod_Assoc      smallint,
    @Num_CliCPFCNPJ decimal (14,0),
	@Dat_IniAssoc	datetime,
    @Cod_UsuaCad    int,
    @Dat_Cad        datetime

	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Insere AssocClientes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_InsAssocClientes]
    Retornos..........: 0 - Sucesso
                        1 - Já Cadastrado
                        2 - Cliente sem lote em empreendimentos dessa associação

	*/

	BEGIN

            -- VERIFICANDO SE O CÓDIGO JA FOI CADASTRADO
            IF(SELECT COUNT(*)
                    FROM [dbo].[GKSDC_AssocClientes] WITH(NOLOCK)
                    WHERE Cod_Assoc   = @Cod_Assoc
                      AND Num_CliCPFCNPJ = @Num_CliCPFCNPJ) > 0
                RETURN 1

            -- VERIFICANDO SE O CLIENTE POSSUI LOTES EM EMPREENDIMENTOS DA ASSOCIAÇÃO
            IF(SELECT COUNT(*)
                    FROM [dbo].[GKSLT_Contratos] co WITH(NOLOCK)
                        INNER JOIN [dbo].[GKSLT_Lotes] lt WITH(NOLOCK)
                            ON lt.Num_ChavLot = co.Num_ChavLot
                    WHERE co.Num_CliCPFCNPJ = @Num_CliCPFCNPJ
                        AND lt.Num_Empr IN (SELECT ae.Num_Empr
                                                FROM [dbo].[GKSDC_AssocEmpr] ae WITH(NOLOCK)
                                                WHERE ae.Cod_Assoc = @Cod_Assoc)) = 0
                RETURN 2

			-- Insere registro
            INSERT INTO [dbo].[GKSDC_AssocClientes] 
                        (Cod_Assoc, Num_CliCPFCNPJ, Dat_IniAssoc, Cod_UsuaCad, Dat_Cad)
                VALUES  (@Cod_Assoc, @Num_CliCPFCNPJ, @Dat_IniAssoc, @Cod_UsuaCad, @Dat_Cad)

             RETURN 0
    END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_UpdAssocClientes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_UpdAssocClientes]
GO

CREATE PROCEDURE [dbo].[GKSSP_UpdAssocClientes]
    @Cod_Assoc      smallint,
    @Num_CliCPFCNPJ decimal (14,0),
	@Dat_IniAssoc	datetime,
	@Dat_FimAssoc	datetime = NULL,
    @Cod_UsuaAlt    int,
    @Dat_UltAlt     datetime

	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Atualiza AssocClientes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_InsAssocClientes]
    Retornos..........: 0 - Sucesso
                        1 - Cliente sem lote em empreendimentos dessa associação

	*/

	BEGIN
        -- VERIFICANDO SE O CLIENTE POSSUI LOTES EM EMPREENDIMENTOS DA ASSOCIAÇÃO
        IF(SELECT COUNT(*)
                FROM [dbo].[GKSLT_Contratos] co WITH(NOLOCK)
                    INNER JOIN [dbo].[GKSLT_Lotes] lt WITH(NOLOCK)
                        ON lt.Num_ChavLot = co.Num_ChavLot
                WHERE co.Num_CliCPFCNPJ = @Num_CliCPFCNPJ
                    AND lt.Num_Empr IN (SELECT ae.Num_Empr
                                            FROM [dbo].[GKSDC_AssocEmpr] ae WITH(NOLOCK)
                                            WHERE ae.Cod_Assoc = @Cod_Assoc)) = 0
            RETURN 1

		-- Atualiza registro
        UPDATE [dbo].[GKSDC_AssocClientes] 
            	SET Dat_IniAssoc 	= @Dat_IniAssoc, 
					Dat_FimAssoc 	= @Dat_FimAssoc, 
					Cod_UsuaAlt 	= @Cod_UsuaAlt, 
					Dat_UltAlt 		= @Dat_UltAlt
           WHERE Cod_Assoc   		= @Cod_Assoc
             AND Num_CliCPFCNPJ 	= @Num_CliCPFCNPJ

         RETURN 0
    END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_DelAssocClientes]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_DelAssocClientes]
GO

CREATE PROCEDURE [dbo].[GKSSP_DelAssocClientes]
    @Cod_Assoc      smallint,
    @Num_CliCPFCNPJ decimal (14,0)
    AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Deleta AssocClientes
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_DelAssocClientes]
	*/

	BEGIN

		DELETE [dbo].[GKSDC_AssocClientes]
           WHERE Cod_Assoc   = @Cod_Assoc
             AND Num_CliCPFCNPJ = @Num_CliCPFCNPJ

	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_SelAssocEmpr]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_SelAssocEmpr]
GO

CREATE PROCEDURE [dbo].[GKSSP_SelAssocEmpr]
    @Cod_Assoc smallint
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Listar AssocEmprs
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_SelAssocEmpr]
    */

	BEGIN

		SELECT  ae.Cod_Assoc, 
                sc.Nom_Assoc, 
                ae.Num_Empr, 
                ep.Nom_Empr, 
                ae.Cod_UsuaCad, 
                ae.Dat_Cad
			FROM [dbo].[GKSDC_AssocEmpr] ae WITH(NOLOCK)
            INNER JOIN [dbo].[GKSDC_Associacoes] sc WITH(NOLOCK)
                ON sc.Cod_Assoc = ae.Cod_Assoc
            INNER JOIN [dbo].[GKSLT_Empreendimentos] ep WITH(NOLOCK)
                ON ep.Num_Empr = ae.Num_Empr
            WHERE ae.Cod_Assoc = @Cod_Assoc
	END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_InsAssocEmpr]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_InsAssocEmpr]
GO

CREATE PROCEDURE [dbo].[GKSSP_InsAssocEmpr]
    @Cod_Assoc   smallint,
    @Num_Empr    smallint,
    @Cod_UsuaCad int,
    @Dat_Cad     datetime
	AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Insere AssocEmpr
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_InsAssocEmpr]
    Retornos..........: 0 - Sucesso
                        1 - Já Cadastrado
                        
	*/

	BEGIN
        SET NOCOUNT ON

        DECLARE @Num_Emprx smallint

        SET @Num_Emprx = CASE	WHEN @Num_Empr BETWEEN 24 AND 32 THEN @Num_Empr - 20
								WHEN @Num_Empr BETWEEN  4 AND 12 THEN @Num_Empr + 20
								ELSE @Num_Empr END
        
        -- VERIFICANDO SE O CÓDIGO JA FOI CADASTRADO
        IF NOT EXISTS(SELECT TOP 1 1
                        FROM [dbo].[GKSDC_AssocEmpr] WITH(NOLOCK)
                        WHERE Cod_Assoc = @Cod_Assoc
                          AND Num_Empr IN (@Num_Empr, @Num_Emprx))
            RETURN 1

        INSERT INTO [dbo].[GKSDC_AssocEmpr] 
                    (Cod_Assoc, Num_Empr, Cod_UsuaCad, Dat_Cad)
            VALUES  (@Cod_Assoc, @Num_Empr, @Cod_UsuaCad, @Dat_Cad)
         RETURN 0
    END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE ID = object_id(N'[dbo].[GKSSP_DelAssocEmpr]') AND objectproperty(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GKSSP_DelAssocEmpr]
GO

CREATE PROCEDURE [dbo].[GKSSP_DelAssocEmpr]
    @Cod_Assoc smallint,
    @Num_Empr  smallint
    AS

	/*
	Documentação
	Arquivo Fonte.....: Associacoes.sql
	Objetivo..........: Deleta AssocEmpr
	Autor.............: Andre Alves
 	Data..............: 26/03/2006
	Ex................: EXEC [dbo].[GKSSP_DelAssocEmpr]
	*/

	BEGIN
        SET NOCOUNT ON

        DECLARE @Num_Emprx smallint

        SET @Num_Emprx = CASE	WHEN @Num_Empr BETWEEN 24 AND 32 THEN @Num_Empr - 20
								WHEN @Num_Empr BETWEEN  4 AND 12 THEN @Num_Empr + 20
								ELSE @Num_Empr END
        
		DELETE [dbo].[GKSDC_AssocEmpr]
           WHERE Cod_Assoc = @Cod_Assoc
             AND Num_Empr IN (@Num_Empr, @Num_Emprx)

	END

GO


