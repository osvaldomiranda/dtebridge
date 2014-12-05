json.array!(@impto_retens) do |impto_reten|
  json.extract! impto_reten, :id, :TipoImp, :string, :TasaImp, :float, :MontoImp, :integer, :documento_id
  json.url impto_reten_url(impto_reten, format: :json)
end
