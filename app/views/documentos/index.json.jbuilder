json.array!(@documentos) do |documento|
  json.extract! documento, :id, :TipoDTE, :integer, :Folio, :integer, :FchEmis, :string, :IndNoRebaja, :integer, :TipoDespacho, :integer, :IndTraslado, :integer, :TpoImpresion, :string, :IndServicio, :integer, :MntBruto, :integer, :FmaPago, :integer, :FchVenc, :string, :RUTEmisor, :string, :RznSoc, :string, :GiroEmis, :string, :Telefono, :string, :CorreoEmisor, :string, :Acteco, :integer, :CdgTraslado, :integer, :FolioAut, :integer, :FchAut, :string, :Sucursal, :string, :CdgSIISucur, :integer, :CodAdicSucur, :string, :DirOrigen, :string, :CmnaOrigen, :string, :CiudadOrigen, :string, :CdgVendedor, :integer, :IdAdicEmisor, :string, :RUTMandante, :string, :RUTRecep, :string, :CdgIntRecep, :string, :RznSocRecep, :string, :NumId, :string, :Nacionalidad, :string, :IdAdicRecep, :string, :GiroRecep, :string, :Contacto, :string, :CorreoRecep, :string, :DirRecep, :string, :CmnaRecep, :string, :CiudadRecep, :string, :DirPostal, :string, :CmnaPostal, :string, :CiudadPostal, :string, :RUTSolicita, :string, :Patente, :string, :RUTTrans, :string, :RUTChofer, :string, :NombreChofer, :string, :DirDest, :string, :CmnaDest, :string, :CiudadDest, :string, :CodModVenta, :integer, :CodClauVenta, :integer, :TotClauVenta, :integer, :CodViaTransp, :integer, :NombreTransp, :string, :RUTCiaTransp, :string, :NomCiaTransp, :string, :IdAdicTransp, :string, :Booking, :string, :Operador, :string, :CodPtoEmbarque, :integer, :IdAdicPtoEmb, :string, :CodPtoDesemb, :string, :IdAdicPtoDesemb, :string, :Tara, :integer, :CodUnidMedTara, :integer, :PesoBruto, :integer, :CodUnidPesoBruto, :integer, :PesoNeto, :integer, :CodUnidPesoNeto, :integer, :TotItems, :integer, :TotBultos, :integer, :TpoMoneda, :string, :MntNeto, :integer, :MntExe, :integer, :MntBase, :integer, :MntMargenCom, :integer, :TasaIVA, :float, :IVA, :integer, :IVAProp, :integer, :IVATerc, :integer, :IVANoRet, :integer, :CredEC, :integer, :GrntDep, :integer, :ValComNeto, :integer, :ValComExe, :integer, :ValComIVA, :integer, :MntTotal, :integer, :MontoNF, :integer
  json.url documento_url(documento, format: :json)
end
