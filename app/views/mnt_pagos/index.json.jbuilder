json.array!(@mnt_pagos) do |mnt_pago|
  json.extract! mnt_pago, :id, :FchPago, :string, :MntPago, :integer, :documento_id
  json.url mnt_pago_url(mnt_pago, format: :json)
end
