class Documento < ActiveRecord::Base
  has_many :impuesto_retens, dependent: :destroy
  has_many :monto_pagos, dependent: :destroy
  has_many :dsc_rcg_globals, dependent: :destroy
  has_many :ref_detalles, dependent: :destroy
  has_many :comisions, dependent: :destroy
  has_many :detalles, dependent: :destroy

  accepts_nested_attributes_for :detalles
  accepts_nested_attributes_for :impuesto_retens
  accepts_nested_attributes_for :monto_pagos
  accepts_nested_attributes_for :dsc_rcg_globals
  accepts_nested_attributes_for :comisions
  accepts_nested_attributes_for :ref_detalles
end