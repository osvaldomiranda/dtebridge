json.array!(@referencia) do |referencium|
  json.extract! referencium, :id, :NroLinRef, :integer, :TpoDocRef, :string, :IndGlobal, :integer, :FolioRef, :string, :RUTOtr, :string, :IdAdicOtr, :string, :FchRef, :string, :CodRef, :integer, :RazonRef, :string, :documento_id
  json.url referencium_url(referencium, format: :json)
end
