json.array!(@dsc_rcg_globals) do |dsc_rcg_global|
  json.extract! dsc_rcg_global, :id, :NroLinDR, :integer, :TpoMov, :string, :GlosaDR, :string, :TpoValor, :string, :ValorDR, :integer, :IndExeDR, :integer, :documento_id
  json.url dsc_rcg_global_url(dsc_rcg_global, format: :json)
end
