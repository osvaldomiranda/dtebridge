# encoding: ISO-8859-1
class DoccomprasRechController < ApplicationController
  respond_to :html
  def index
    @doccompras = Doccompra.where(estado: "RECHAZADO")
  end
 
  def aprobar
    d = Doccompra.find(params[:id])
    d.estado = "APROBADO"
    d.save

    @doccompras = Doccompra.where(estado: "RECHAZADO")
    respond_to do |format|
        format.html { render action: 'index'}
    end  
  end  
end
