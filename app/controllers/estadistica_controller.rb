class EstadisticaController < ApplicationController
  def index
    sucursales = { 75047210 => "VINA DEL MAR"  ,  
                   63635210 => "OVALLE" ,  
                   64409688 => "LA SERENA"  ,  
                   41272801 => "MONUMENTO" ,  
                   74878389 => "LA CISTERNA"  ,  
                   74878390 => "DOMINGO CORREA 25"  ,
                   78139472 => "MAIPU"    
                  }

    cantxsuc = Documento.group(:CdgSIISucur).count 
    @d = Hash[cantxsuc.map { |k, v| [sucursales[k] , v] }]

    mntxsuc = Documento.group(:CdgSIISucur).sum(:MntNeto)
    @f = Hash[mntxsuc.map { |k, v| [sucursales[k] , v] }]
  end
end
