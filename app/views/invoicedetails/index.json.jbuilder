json.array!(@invoicedetails) do |invoicedetail|
  json.extract! invoicedetail, :id, :NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :SubQty, :FchElabor, :FchVencim, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnda, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :invoice_id
  json.url invoicedetail_url(invoicedetail, format: :json)
end
