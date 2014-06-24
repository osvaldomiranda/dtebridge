class Invoice < ActiveRecord::Base
	validates :Version, length:{maximum: 3}, presence: true
	validates :TipoDte, length:{maximum: 2}, presence: true
	validates :Folio, length:{maximum: 10}, presence: true
	validates :FchEmis, length:{maximum: 10}, presence: true
	validates :TipoDespacho, length:{maximum: 1}
	validates :IndServicio, length:{maximum: 1}
	validates :MntBruto, length:{maximum: 1}
	validates :FmaPago, length:{maximum: 1}
	validates :FchCancel, length:{maximum: 10}
	validates :MntCancel, length:{maximum: 18}
	validates :SaldoInsol, length:{maximum: 18}
	validates :FchPago, length:{maximum: 10}, presence: true
	validates :MntPago, length:{maximum: 18}, presence: true
	validates :GlosaPagos, length:{maximum: 40}
	validates :PeriodoDesde, length:{maximum: 10}
	validates :PeriodoHasta, length:{maximum: 10}
	validates :MedioPago, length:{maximum: 2}
	validates :TipoCtaPAgo, length:{maximum: 2}
	validates :NumCtaPago, length:{maximum: 20}
	validates :BcoPago, length:{maximum: 40}
	validates :TermPagoCdg, length:{maximum: 4}
	validates :TermPAgoGlosa, length:{maximum: 100}
	validates :TermPagoDias, length:{maximum: 3}
	validates :FchVenc, length:{maximum: 10}
	validates :RUTEmisor, length:{maximum: 10}, presence: true, rut_format: true
	validates :RznSoc, length:{maximum: 100}, presence: true
	validates :GiroEmis, length:{maximum: 80}, presence: true
	validates :Telefono, length:{maximum: 20}
	validates :CorreoEmisor, length:{maximum: 80}
	validates :Acteco, length:{maximum: 6}, presence: true
	validates :Sucursal, length:{maximum: 20}
	validates :CdgSIISucur, length:{maximum: 9}
	validates :DirOrigen, length:{maximum: 60}, presence: true
	validates :CmnaOrigen, length:{maximum: 20}, presence: true
	validates :CiudadOrigen, length:{maximum: 20}
	validates :CdgVendedor, length:{maximum: 60}
	validates :RutMandante, length:{maximum: 10}
	validates :RUTReceptor, length:{maximum: 10}, presence: true
	validates :CdgIntRecep, length:{maximum: 20}
	validates :RznSocRecep, length:{maximum: 100}, presence: true
	validates :NumId, length:{maximum: 20}
	validates :Nacionalidad, length:{maximum: 3}
	validates :GiroRecep, length:{maximum: 40}, presence: true
	validates :Contacto, length:{maximum: 80}
	validates :CorreoRecep, length:{maximum: 80}
	validates :DirRecep, length:{maximum: 70}, presence: true
	validates :CmnaRecep, length:{maximum: 20}, presence: true
	validates :CiudadRecep, length:{maximum: 20}
	validates :DirPostal, length:{maximum: 70}
	validates :CmnaPostal, length:{maximum: 20}
	validates :CiudadPostal, length:{maximum: 20}
	validates :RUTSolicita, length:{maximum: 10}
	validates :Patente, length:{maximum: 8}
	validates :RUTTRans, length:{maximum: 10}
	validates :RUTChofer, length:{maximum: 10}
	validates :NombreChofer, length:{maximum: 30}
	validates :DirDest, length:{maximum: 70}
	validates :CmnaDest, length:{maximum: 20}
	validates :CiudadDest, length:{maximum: 20}
	validates :MntNeto, length:{maximum: 18}
	validates :MntExe, length:{maximum: 18}
	validates :MntBase, length:{maximum: 18}
	validates :MntMargenCom, length:{maximum: 18}
	validates :TasaIVA, length:{maximum: 5}
	validates :IVA, length:{maximum: 18}
	validates :IVAProp, length:{maximum: 18}
	validates :IVATerc, length:{maximum: 18}
	validates :TipoImp, length:{maximum: 3}
	validates :TasaImp, length:{maximum: 5}
	validates :MontoImp, length:{maximum: 18}
	validates :CredEC, length:{maximum: 18}
	validates :GmtDep, length:{maximum: 18}
	validates :MntTotal, length:{maximum: 18}, presence: true
	validates :MontoNF, length:{maximum: 18}
	validates :MontoPeriodo, length:{maximum: 18}
	validates :SaldoAnterior, length:{maximum: 18}
	validates :VlrPagar, length:{maximum: 18}
	validates :TpoMoneda, length:{maximum: 15}
	validates :TpoCambio, length:{maximum: 10}
	validates :MntNetoOtrMnda, length:{maximum: 18}
	validates :MntExeOtrMnda, length:{maximum: 18}
	validates :MntFaeCarneOtrMnda, length:{maximum: 18}
	validates :MntMargComOtrMnda, length:{maximum: 18}
	validates :IVAOtrMnda, length:{maximum: 18}
	validates :TipoImpOtrMnda, length:{maximum: 3}
	validates :TasaImpOtrMnda, length:{maximum: 5}
	validates :VlrImpOtrMnda, length:{maximum: 18}
	validates :MntTotOtrMnda, length:{maximum: 18}
	validates :NroSti, length:{maximum: 2}, presence: true
	validates :GlosaSti, length:{maximum: 40}, presence: true
	validates :OrdenSti, length:{maximum: 2}
	validates :SubTotNetoSti, length:{maximum: 18}
	validates :SubTotIVASti, length:{maximum: 18}
	validates :SubTotAdicSti, length:{maximum: 18}
	validates :SubTotExeSti, length:{maximum: 18}
	validates :ValSubTotSti, length:{maximum: 18}
	validates :LineasDeta, length:{maximum: 18}
	validates :NroLinDr, length:{maximum: 2}, presence: true
	validates :TpoMov, length:{maximum: 1}, presence: true
	validates :GlosaDr, length:{maximum: 45}
	validates :TpoValor, length:{maximum: 1}, presence: true
	validates :ValorDr, length:{maximum: 18}, presence: true
	validates :ValorDrOtrMnda, length:{maximum: 18}
	validates :IndExeDr, length:{maximum: 1}
	validates :NroLinRef, length:{maximum: 2}, presence: true
	validates :TpoDocRef, length:{maximum: 3}, presence: true
	validates :FolioRef, length:{maximum: 18}, presence: true
	validates :FchRef, length:{maximum: 10}, presence: true
	validates :CodRef, length:{maximum: 1}
	validates :RazonRef,length:{maximum: 90}
	validates :X509Certificate, presence:true
end
