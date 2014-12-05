json.array!(@detalles) do |detalle|
  json.extract! detalle, :id, :NroLinDet, :integer, :TpoCodigo, :string, :VlrCodigo, :string, :TpoDocLiq, :string, :IndExe, :string, :IndAgente, :string, :MntBaseFaena, :integer, :MntMargComer, :integer, :PrcConsFinal, :integer, :NmbItem, :integer, :DscItem, :string, :QtyRef, :integer, :UnmdRef, :string, :PrcRef, :float, :QtyItem, :float, :FchElabor, :string, :FchVencim, :string, :UnmdItem, :string, :PrcItem, :DescuentoPct, :DescuentoMonto, :integer, :CodImpAdic, :string, :MontoItem, :integer, :documento_id
  json.url detalle_url(detalle, format: :json)
end
