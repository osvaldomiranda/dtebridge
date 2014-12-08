json.array!(@ref_detalles) do |ref_detalle|
  json.extract! ref_detalle, :id, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :RUTOtr, :IdAdicOtr, :FchRef, :CodRef, :RazonRef, :documento_id
  json.url ref_detalle_url(ref_detalle, format: :json)
end
