CREATE TRIGGER historicoCargoSalario
ON cargoSalario 
AFTER UPDATE
AS
    BEGIN

        DECLARE @idUpdate int 
        SET @idUpdate = (Select id FROM deleted)

        INSERT INTO cargoSalarioHistorico 
        (idCargoSalario, 
        idUnidade,
        idFaixaSalarial,
        valor,
        dataValidade,
        usuarioCadastro,
        dataCadastro,
        usuarioUltimaAlteracao,
        dataUltimaAlteracao)

        SELECT  id, 
                idUnidade,
                idFaixaSalarial,
                valor,
                dataValidade,
                usuarioCadastro,
                dataCadastro,
                usuarioUltimaAlteracao,
                dataUltimaAlteracao
        FROM deleted
        WHERE id = @idUpdate

    END

/*
*** códigos para teste ***

SELECT * FROM cargoSalarioHistorico;

SELECT * FROM cargoSalario;

UPDATE cargoSalario SET usuarioCadastro = 002 WHERE id = 1;
*/
