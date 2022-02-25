CREATE TABLE TESTE
CREATE TABLE TESTE2
CREATE TABLE TESTE5

CREATE TRIGGER TGR_VENDAS_AD
ON VENDAS
FOR DELETE
AS
BEGIN
    DECLARE
    @VALOR  DECIMAL(10,2),
    @DATA   DATETIME

    SELECT @DATA = DATA, @VALOR = VALOR FROM DELETED

    UPDATE CAIXA SET SALDO_FINAL = SALDO_FINAL - @VALOR
    WHERE DATA = @DATA
END
GO