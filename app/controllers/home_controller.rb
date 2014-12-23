class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
        sucursales = { 
                   75047210 => "VINA DEL MAR"  ,  
                   63635210 => "OVALLE" ,  
                   64409688 => "LA SERENA"  ,  
                   41272801 => "MONUMENTO" ,  
                   74878389 => "LA CISTERNA"  ,  
                   74878390 => "DOMINGO CORREA 25",
                   78139472 => "5 de ABRIL",
                   41271651 => "ABEL GONZALEZ 44" 
                  }


    cantxsuc = Documento.count(:group => '"CdgSIISucur"', :conditions => ["created_at >= ?", Date.today.at_beginning_of_month])
    @d = Hash[cantxsuc.map { |k, v| [sucursales[k] , v] }]

    mntxsuc = Documento.sum('"MntNeto"', :group => '"CdgSIISucur"',:conditions => ["created_at >= ?", Date.today.at_beginning_of_month] )
    @f = Hash[mntxsuc.map { |k, v| [sucursales[k] , v] }]

    @p = Documento.sum('"MntNeto"', :group => '"RUTEmisor"',:conditions => ["created_at >= ?", Date.today.at_beginning_of_month])

  end
end
