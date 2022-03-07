CREATE OR ALTER PROC [dbo].[blt_Operacao_TipoContaTED_sp](
	@idSistemaLegado INT,
	@TAG varchar(50)
) 
AS BEGIN
--ALTERACAO VIA ESTEIRA
SELECT ParametroValor.gbo_ParametroValor_ID,
       ParametroValor.Valor
FROM GerenciadorBoletador.dbo.gbo_Parametro Parametro
INNER JOIN GerenciadorBoletador.dbo.gbo_ParametroValor ParametroValor ON Parametro.gbo_Parametro_ID=ParametroValor.mgbo_Parametro
INNER JOIN GerenciadorBoletador.dbo.gbo_ParametroSistemaLegado ParametroSistema ON Parametro.gbo_Parametro_ID=ParametroSistema.mgbo_Parametro
WHERE Parametro.Tag=@TAG
  AND ParametroSistema.mgbo_SistemaLegado=@idSistemaLegado 
 
END 