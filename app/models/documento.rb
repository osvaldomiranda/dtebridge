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

  mount_uploader :pdfs, PdfsUploader # Tells rails to use this uploader for this model.
  mount_uploader :pdft, PdftUploader 
  mount_uploader :fileEnvio, FileEnvioUploader
  mount_uploader :fileCliente, PdfsUploader 
  mount_uploader :fileFactura, PdfsUploader
  mount_uploader :fileJson, PdfsUploader

  attr_reader :sucursal
  attr_reader :nombre_doc
  def sucursal
    Sucursal.where(cdgsiisucur: "#{self.CdgSIISucur}" ).first.nombre
  end

  def nombre_doc
    tipo = Tipodte.where(tipo: self.TipoDTE).first 
    return (tipo.nil? ? self.TipoDTE : tipo.nombre)
  end
end
