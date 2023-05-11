------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelProjetoDocumento]') AND objectproperty(ID,N'isProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelProjetoDocumento]
go

CREATE PROCEDURE [dbo].[KRTSP_SelProjetoDocumento]
    @idProjeto int = NULL

    AS

    /*
    Documentação
    Arquivo Fonte.....: ProjetoDocumento.sql
    Objetivo..........: Faz um select para mostrar todos os dados da tabela ProjetoDocumento.
    Autor.............: Estagiarios PB
     Data..............: 17/03/2022
    Ex................: EXEC [dbo].[KRTSP_selProjetoDocumento]
    */

    BEGIN
        SELECT  idProjeto,
                idDocumento
            FROM [dbo].[ProjetoDocumento] WITH(NOLOCK)
            WHERE idProjeto = COALESCE(@idProjeto, idProjeto)

    END

GO