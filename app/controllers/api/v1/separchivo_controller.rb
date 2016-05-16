class Api::V1::SeparchivoController < Api::V1::ApiController
  def separchivo
    documentos = Documento.all
    empresas = Documento.uniq.pluck(:RUTEmisor)

    empresas.each do |rut|
      system("mkdir #{rut}")
    end

    documentos.each do |documento|
      system("mv #{documento.pdfs.url}  /#{documento.RUTEmisor}#{documento.pdfs_url}") 
    end

    render json: "Ok"
  end
end