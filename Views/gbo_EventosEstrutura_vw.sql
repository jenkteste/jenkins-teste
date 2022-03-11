
CREATE OR ALTER VIEW [dbo].[gbo_EventosEstrutura_vw]

AS

	SELECT
		 Id					= EventoEstrutura.gbo_EventoEstrutura_ID
		,EventoId			= Evento.gbo_Evento_ID 
		,EventoDescricao	= Evento.Descricao 
		,EventoAtivo		= Evento.RegistroAtivo
		,MercadoId			= Mercado.cad_Mercado_ID
		,MercadoDescricao   = Mercado.Descricao
		,MercadoAtivo		= Mercado.RegistroAtivo
	
	FROM
		[GerenciadorBoletador].[dbo].[gbo_Evento] Evento WITH (NOLOCK)

	INNER JOIN
		[GerenciadorBoletador].[dbo].[gbo_EventoEstrutura] EventoEstrutura WITH (NOLOCK)
	ON
		EventoEstrutura.mgbo_Evento = Evento.gbo_Evento_ID
		
	INNER JOIN 
		PortalCadastrosBasicos.dbo.cad_Mercado Mercado WITH (NOLOCK)
	ON
		Mercado.cad_Mercado_ID = EventoEstrutura.mcad_Mercado

