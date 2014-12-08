json.array!(@comisions) do |comision|
  json.extract! comision, :id, :NroLinCom, :TipoMovim, :Glosa, :ValComNeto, :ValComExe, :ValComIVA, :documento_id
  json.url comision_url(comision, format: :json)
end
