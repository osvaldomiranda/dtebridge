class Api::V1::SeparchivoController < Api::V1::ApiController
  def separchivo
   
    documentos = Documento.where( RUTEmisor: '77888630-8')

    documentos.each do |documento|
      documento.destroy  
    end
  
    render json: "Ok"
  end
end