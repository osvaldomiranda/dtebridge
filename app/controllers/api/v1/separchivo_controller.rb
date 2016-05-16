class Api::V1::SeparchivoController < Api::V1::ApiController
  def separchivo
   
    empresas = Documento.uniq.pluck(:RUTEmisor)

    empresas.each do |rut|
      system("mkdir #{rut}")

      documentos = Documento.where("RUTEmisor= ?", rut)

        documentos.each do |documento|
        system("mv #{documento.pdfs.url}  /#{documento.RUTEmisor}/#{documento.pdfs_identifier}") 
      end
    end



    render json: "Ok"
  end
end