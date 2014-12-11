# encoding: ISO-8859-1
class Api::V1::DocumentoController < Api::V1::ApiController

  def create_doc

    #TO DO: agregar camos nombreXML, NombreEnvio, xml, envioXml, pdf y pdfcedible en tabla documento 
    #para recibir toda la info (Ver si es recomendable el envío por separado)

    #TO DO: llamar a connect sii para realizar el envío a SII

    p = eval(params[:doc])

    @invoice = Documento.new( p[:documento] ) 
    @invoice.envio = params[:xml]
    @invoice.fileEnvio = params[:filename]

    if @invoice.save
      render 'api/v1/invoices/create' 
    else
       render format.json { render json: @invoice.errors, status: :unprocessable_entity }
    end
  end 

end

