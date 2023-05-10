------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SelEntregaDocumento]') AND objectproperty(ID,N'isProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SelEntregaDocumento]
go

CREATE PROCEDURE [dbo].[KRTSP_SelEntregaDocumento]
    @idEntrega int = NULL

    AS

    /*
    Documentação
    Arquivo Fonte.....: entregaDocumento.sql
    Objetivo..........: Retornar um ou mais registros da tabela entregaDocumento
    Autor.............: Estagiarios PB
     Data..............: 17/03/2022
    Ex................: EXEC [dbo].[KRTSP_SelEntregaDocumento]
    */

    BEGIN
        SELECT  idEntrega,
                idDocumento
            FROM [dbo].[entregaDocumento] WITH(NOLOCK)
            WHERE idEntrega = COALESCE(@identrega, idEntrega)

    END

GO