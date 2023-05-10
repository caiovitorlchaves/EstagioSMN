------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelentregaDocumento]') AND objectproperty(ID,N'isProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelentregaDocumento]
go

CREATE PROCEDURE [dbo].[KRTSP_SelentregaDocumento]
    @idEntrega int = NULL

    AS

    /*
    Documentação
    Arquivo Fonte.....: entregaDocumento.sql
    Objetivo..........: Faz um select para mostrar todos os dados da tabela entregaDocumento.
    Autor.............: Estagiarios PB
     Data..............: 17/03/2022
    Ex................: EXEC [dbo].[KRTSP_selentregaDocumento]
    */

    BEGIN
        SELECT  idEntrega,
                idDocumento
            FROM [dbo].[entregaDocumento] WITH(NOLOCK)
            WHERE idEntrega = COALESCE(@identrega, idEntrega)

    END

GO