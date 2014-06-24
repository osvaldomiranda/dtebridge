class DebitnotedetailsController < ApplicationController
  before_action :set_debitnotedetail, only: [:show, :edit, :update, :destroy]

  # GET /debitnotedetails
  # GET /debitnotedetails.json
  def index
    @debitnotedetails = Debitnotedetail.all
  end

  # GET /debitnotedetails/1
  # GET /debitnotedetails/1.json
  def show
  end

  # GET /debitnotedetails/new
  def new
    @debitnotedetail = Debitnotedetail.new
  end

  # GET /debitnotedetails/1/edit
  def edit
  end

  # POST /debitnotedetails
  # POST /debitnotedetails.json
  def create
    @debitnotedetail = Debitnotedetail.new(debitnotedetail_params)

    respond_to do |format|
      if @debitnotedetail.save
        format.html { redirect_to @debitnotedetail, notice: 'Debitnotedetail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @debitnotedetail }
      else
        format.html { render action: 'new' }
        format.json { render json: @debitnotedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debitnotedetails/1
  # PATCH/PUT /debitnotedetails/1.json
  def update
    respond_to do |format|
      if @debitnotedetail.update(debitnotedetail_params)
        format.html { redirect_to @debitnotedetail, notice: 'Debitnotedetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @debitnotedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debitnotedetails/1
  # DELETE /debitnotedetails/1.json
  def destroy
    @debitnotedetail.destroy
    respond_to do |format|
      format.html { redirect_to debitnotedetails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debitnotedetail
      @debitnotedetail = Debitnotedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debitnotedetail_params
      params.require(:debitnotedetail).permit(:NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnd, :a, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :debitnote_id)
    end
end
