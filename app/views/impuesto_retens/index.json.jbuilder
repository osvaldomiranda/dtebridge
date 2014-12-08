json.array!(@impuesto_retens) do |impuesto_reten|
  json.extract! impuesto_reten, :id, :TipoImp, :TasaImp, :MontoImp, :documento_id
  json.url impuesto_reten_url(impuesto_reten, format: :json)
end
