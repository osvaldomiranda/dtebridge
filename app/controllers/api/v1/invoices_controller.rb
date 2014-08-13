class Api::V1::InvoicesController < Api::V1::ApiController
  before_action :require_authentication
  
  def create
    @invoice = Invoce.new(params[:invoice])
    @detail = params[:invoicedetail] 

    @invoice.pdf = params[:pdf]
    @invoice.xml = params[:xml]

    if @invoice.save
      #Guarda detalle
      @detail.each do |d|
        @invoicedetail = InvoiceDetail.new(d)
        @invoicedetail.save 
      end  
      render 'api/v1/invoices/create'
      # llamar a connect sii
    else
      render format.json { render json: @invoice.errors, status: :unprocessable_entity }
    end
  end
end   