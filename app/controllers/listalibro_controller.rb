class ListalibroController < ApplicationController
  def index
    @libro = Libro.all
  end

  def genxml
    lib = Libro.find(params[:id])
    lib.xml

    lib.estado = "XML Generado"
    lib.save
    
    @libro = Libro.all
    respond_to do |format|
      format.html { render action: 'index' }
    end 
  end

  def sendxml
    libro = Libro.find(params[:id])
    send_file "#{Rails.root}/libro_compra#{libro.idenvio}.xml"
  end  
end
