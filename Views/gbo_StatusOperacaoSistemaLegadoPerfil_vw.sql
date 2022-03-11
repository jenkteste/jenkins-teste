
CREATE OR ALTER VIEW [dbo].[gbo_StatusOperacaoSistemaLegadoPerfil_vw]
AS
SELECT 	Id								= StatusOperacaoSistemaPerfil.gbo_StatusOperacaoSistemaLegadoPerfil_ID,
		PerfilId						= StatusOperacaoSistemaPerfil.mpca_Perfil,
		SistemaLegadoId					= SistemaLegado.gbo_SistemaLegado_ID,		
		ProdutoId						= StatusOperacaoSistemaPerfil.mcad_Produto,
		StatusOperacaoSistemaOrigemId	= StatusOperacaoSistemaPerfil.mgbo_StatusOperacaoSistemaLegadoOrigem,
		StatusOperacaoOrigemId			= StatusOperacaoOrigem.gbo_StatusOperacao_ID,
		DescricaoStatusOrigem			= StatusOperacaoOrigem.Descricao,
		StatusOperacaoSistemaDestinoId	= StatusOperacaoSistemaPerfil.mgbo_StatusOperacaoSistemaLegadoDestino,
		StatusOperacaoDestinoId			= StatusOperacaoDestino.gbo_StatusOperacao_ID,
		DescricaoStatusDestino			= StatusOperacaoDestino.Descricao,
		StatusInicial					= StatusOperacaoSistemaPerfil.StatusInicial,
		EventoEstruturaId				= StatusOperacaoSistemaPerfil.mgbo_EventoEstrutura,
		EventoId						= EventoEstrutura.EventoId,
		EventoDescricao					= EventoEstrutura.EventoDescricao,
		MercadoId						= EventoEstrutura.MercadoId,
		MercadoDescricao				= EventoEstrutura.MercadoDescricao		
   FROM dbo.gbo_StatusOperacaoSistemaLegadoPerfil StatusOperacaoSistemaPerfil With (NOLOCK)
  INNER JOIN dbo.gbo_StatusOperacaoSistemaLegado StatusOperacaoSistemaOrigem With (NOLOCK)
	 ON StatusOperacaoSistemaOrigem.gbo_StatusOperacaoSistemaLegado_ID = StatusOperacaoSistemaPerfil.mgbo_StatusOperacaoSistemaLegadoOrigem
  INNER JOIN dbo.gbo_StatusOperacao StatusOperacaoOrigem With (NOLOCK)
	 ON StatusOperacaoOrigem.gbo_StatusOperacao_ID = StatusOperacaoSistemaOrigem.mgbo_StatusOperacao
  INNER JOIN dbo.gbo_StatusOperacaoSistemaLegado StatusOperacaoSistemaDestino With (NOLOCK)
	 ON StatusOperacaoSistemaDestino.gbo_StatusOperacaoSistemaLegado_ID = StatusOperacaoSistemaPerfil.mgbo_StatusOperacaoSistemaLegadoDestino
  INNER JOIN dbo.gbo_StatusOperacao StatusOperacaoDestino With (NOLOCK)
	 ON StatusOperacaoDestino.gbo_StatusOperacao_ID = StatusOperacaoSistemaDestino.mgbo_StatusOperacao 
  INNER JOIN dbo.gbo_SistemaLegado SistemaLegado With (NOLOCK)
	 ON StatusOperacaoSistemaOrigem.mgbo_SistemaLegado = SistemaLegado.gbo_SistemaLegado_ID
  INNER JOIN dbo.gbo_EventosEstrutura_vw EventoEstrutura With (NOLOCK)
	 ON EventoEstrutura.Id = StatusOperacaoSistemaPerfil.mgbo_EventoEstrutura
