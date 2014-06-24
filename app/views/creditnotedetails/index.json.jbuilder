json.array!(@creditnotedetails) do |creditnotedetail|
  json.extract! creditnotedetail, :id, :NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnd, :a, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :creditnote_id
  json.url creditnotedetail_url(creditnotedetail, format: :json)
end
