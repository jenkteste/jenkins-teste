CREATE OR ALTER VIEW [dbo].[gbo_StatusOperacaoTransicao_vw]
AS
SELECT distinct
	   StatusOperacaoTransicao_ID         = StatusOperacaoTransicao.gbo_StatusOperacaoTransicao_ID,
	   StatusOperacaoOrigem_ID            = StatusOperacaoOrigem.StatusOperacaoSistemaLegado_ID,
	   DescricaoStatusOperacaoOrigem      = StatusOperacaoOrigem.DescricaoStatusOperacao,
	   SiglaStatusOperacaoOrigem          = StatusOperacaoOrigem.SiglaStatusOperacao,
	   RegistroAtivoStatusOperacaoOrigem  = StatusOperacaoOrigem.RegistroAtivoStatusOperacao,
	   StatusOperacaoDestino_ID           = StatusOperacaoDestino.StatusOperacaoSistemaLegado_ID,
	   DescricaoStatusOperacaoDestino     = StatusOperacaoDestino.DescricaoStatusOperacao,
	   SiglaStatusOperacaoDestino         = StatusOperacaoDestino.SiglaStatusOperacao,
	   RegistroAtivoStatusOperacaoDestino = StatusOperacaoDestino.RegistroAtivoStatusOperacao
  from dbo.gbo_StatusOperacaoTransicao StatusOperacaoTransicao With (nolock)
 inner join dbo.gbo_StatusOperacao_vw StatusOperacaoOrigem With (nolock)
	on StatusOperacaoTransicao.mgbo_StatusOperacaoOrigem = StatusOperacaoOrigem.StatusOperacaoSistemaLegado_ID
 inner join dbo.gbo_StatusOperacao_vw StatusOperacaoDestino With (nolock)
	on StatusOperacaoTransicao.mgbo_StatusOperacaoDestino = StatusOperacaoDestino.StatusOperacaoSistemaLegado_ID
gbo_TesteDependencia