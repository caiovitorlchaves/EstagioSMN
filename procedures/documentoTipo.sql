------------------------------------------- SELECT ------------------------------------------------
IF EXISTS(SELECT TOP 1 1 FROM sysobjects WHERE ID = object_id(N'[dbo].[KRTSP_SeldocumentoTipo]') AND objectproperty(ID,N'isProcedure') = 1)
    DROP PROCEDURE [dbo].[KRTSP_SeldocumentoTipo]
go

CREATE PROCEDURE [dbo].[KRTSP_SeldocumentoTipo]
    @id int = NULL

    AS

    /*
    Documentação
    Arquivo Fonte.....: documentoTipo.sql
    Objetivo..........: Faz um select para mostrar todos os dados da tabela documentoTipo.
    Autor.............: Estagiarios PB
     Data..............: 17/03/2022
    Ex................: EXEC [dbo].[KRTSP_seldocumentoTipo]
    */

    BEGIN
        SELECT  id,
                nome
            FROM [dbo].[documentoTipo] WITH(NOLOCK)
            WHERE id = COALESCE(@id, id)

    END

GO