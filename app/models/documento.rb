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
  mount_uploader :pdft, PdfsUploader 
  mount_uploader :fileEnvio, PdfsUploader 

  attr_reader :sucursal

  def sucursal
    sucursales = { 75047210 => "VINA DEL MAR"  ,  
                   63635210 => "OVALLE" ,  
                   64409688 => "LA SERENA"  ,  
                   41272801 => "MONUMENTO" ,  
                   74878389 => "LA CISTERNA"  ,  
                   74878390 => "DOMINGO CORREA 25"  ,
                   78139472 => "MAIPU"    
                  }

    sucursales[self.CdgSIISucur]
  end
end
