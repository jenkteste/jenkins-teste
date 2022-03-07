CREATE FUNCTION DtsMinutos(@min int, @dti datetime, @dtf datetime)
RETURNS @tbl TABLE(dt datetime)
AS
BEGIN
    WHILE @dti <= @dtf
    BEGIN
      INSERT INTO @tbl(dt) VALUES (@dti)
      SET @dti = DATEADD(MINUTE,@min,@dti)
    END
    RETURN
END;


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
    FUNCTION DtsMinutos
END
GO;

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;