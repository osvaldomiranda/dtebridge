class InvoicedetailsController < ApplicationController
  before_action :set_invoicedetail, only: [:show, :edit, :update, :destroy]

  # GET /invoicedetails
  # GET /invoicedetails.json
  def index
    @invoicedetails = Invoicedetail.all
  end

  # GET /invoicedetails/1
  # GET /invoicedetails/1.json
  def show
  end

  # GET /invoicedetails/new
  def new
    @invoicedetail = Invoicedetail.new
  end

  # GET /invoicedetails/1/edit
  def edit
  end

  # POST /invoicedetails
  # POST /invoicedetails.json
  def create
    @invoicedetail = Invoicedetail.new(invoicedetail_params)

    respond_to do |format|
      if @invoicedetail.save
        format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoicedetail }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoicedetails/1
  # PATCH/PUT /invoicedetails/1.json
  def update
    respond_to do |format|
      if @invoicedetail.update(invoicedetail_params)
        format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicedetails/1
  # DELETE /invoicedetails/1.json
  def destroy
    @invoicedetail.destroy
    respond_to do |format|
      format.html { redirect_to invoicedetails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoicedetail
      @invoicedetail = Invoicedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoicedetail_params
      params.require(:invoicedetail).permit(:NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :SubQty, :FchElabor, :FchVencim, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnda, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :invoice_id)
    end
end
