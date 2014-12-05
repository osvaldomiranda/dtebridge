json.array!(@comisiones) do |comisione|
  json.extract! comisione, :id, :NroLinCom, :integer, :TipoMovim, :string, :Glosa, :string, :ValComNeto, :integer, :ValComExe, :integer, :ValComIVA, :integer, :documento_id
  json.url comisione_url(comisione, format: :json)
end
