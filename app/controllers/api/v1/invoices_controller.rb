class Api::V1::InvoicesController < Api::V1::ApiController
  before_action :require_authentication
  
  def create
    @invoice = Documento.new(params[:invoice])


    if @invoice.save
      render 'api/v1/invoices/create'
      # llamar a connect sii
    else
      render format.json { render json: @invoice.errors, status: :unprocessable_entity }
    end
  end
end   