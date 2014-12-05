class Documento < ActiveRecord::Base
  has_many :detalle, dependent: :destroy
  has_many :dsc_rcg_global, dependent: :destroy
  has_many :impto_reten, dependent: :destroy
  has_many :mnt_pago, dependent: :destroy
  has_many :referencia, dependent: :destroy
end
