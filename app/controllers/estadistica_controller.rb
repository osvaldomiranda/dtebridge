class EstadisticaController < ApplicationController

  def index
    cantxsuc = Documento.count(:group => '"CdgSIISucur"', :conditions => ["created_at >= ?", Date.today.at_beginning_of_month])
    @d = Hash[cantxsuc.map { |k, v| [Sucursal.find_by_cdgsiisucur(k.to_s).present? ? Sucursal.find_by_cdgsiisucur(k.to_s).nombre : "" , v] }]

    mntxsuc = Documento.sum('"MntNeto"', :group => '"CdgSIISucur"',:conditions => ["created_at >= ?", Date.today.at_beginning_of_month] )
    @f = Hash[mntxsuc.map { |k, v| [Sucursal.find_by_cdgsiisucur(k.to_s).present? ? Sucursal.find_by_cdgsiisucur(k.to_s).nombre : "", v] }]

    @p = Documento.sum('"MntNeto"', :group => '"RUTEmisor"',:conditions => ["created_at >= ?", Date.today.at_beginning_of_month])
  end
end
