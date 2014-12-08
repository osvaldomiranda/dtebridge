json.array!(@monto_pagos) do |monto_pago|
  json.extract! monto_pago, :id, :FchPago, :MntPago, :documento_id
  json.url monto_pago_url(monto_pago, format: :json)
end
