class CreditnotedetailsController < ApplicationController
  before_action :set_creditnotedetail, only: [:show, :edit, :update, :destroy]

  # GET /creditnotedetails
  # GET /creditnotedetails.json
  def index
    @creditnotedetails = Creditnotedetail.all
  end

  # GET /creditnotedetails/1
  # GET /creditnotedetails/1.json
  def show
  end

  # GET /creditnotedetails/new
  def new
    @creditnotedetail = Creditnotedetail.new
  end

  # GET /creditnotedetails/1/edit
  def edit
  end

  # POST /creditnotedetails
  # POST /creditnotedetails.json
  def create
    @creditnotedetail = Creditnotedetail.new(creditnotedetail_params)

    respond_to do |format|
      if @creditnotedetail.save
        format.html { redirect_to @creditnotedetail, notice: 'Creditnotedetail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creditnotedetail }
      else
        format.html { render action: 'new' }
        format.json { render json: @creditnotedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creditnotedetails/1
  # PATCH/PUT /creditnotedetails/1.json
  def update
    respond_to do |format|
      if @creditnotedetail.update(creditnotedetail_params)
        format.html { redirect_to @creditnotedetail, notice: 'Creditnotedetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creditnotedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creditnotedetails/1
  # DELETE /creditnotedetails/1.json
  def destroy
    @creditnotedetail.destroy
    respond_to do |format|
      format.html { redirect_to creditnotedetails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creditnotedetail
      @creditnotedetail = Creditnotedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creditnotedetail_params
      params.require(:creditnotedetail).permit(:NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnd, :a, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :creditnote_id)
    end
end
