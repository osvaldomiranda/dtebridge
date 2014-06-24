class GuidedetailsController < ApplicationController
  before_action :set_guidedetail, only: [:show, :edit, :update, :destroy]

  # GET /guidedetails
  # GET /guidedetails.json
  def index
    @guidedetails = Guidedetail.all
  end

  # GET /guidedetails/1
  # GET /guidedetails/1.json
  def show
  end

  # GET /guidedetails/new
  def new
    @guidedetail = Guidedetail.new
  end

  # GET /guidedetails/1/edit
  def edit
  end

  # POST /guidedetails
  # POST /guidedetails.json
  def create
    @guidedetail = Guidedetail.new(guidedetail_params)

    respond_to do |format|
      if @guidedetail.save
        format.html { redirect_to @guidedetail, notice: 'Guidedetail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guidedetail }
      else
        format.html { render action: 'new' }
        format.json { render json: @guidedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guidedetails/1
  # PATCH/PUT /guidedetails/1.json
  def update
    respond_to do |format|
      if @guidedetail.update(guidedetail_params)
        format.html { redirect_to @guidedetail, notice: 'Guidedetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guidedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guidedetails/1
  # DELETE /guidedetails/1.json
  def destroy
    @guidedetail.destroy
    respond_to do |format|
      format.html { redirect_to guidedetails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guidedetail
      @guidedetail = Guidedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guidedetail_params
      params.require(:guidedetail).permit(:NroLinDet, :TpoCodigo, :VlrCodigo, :IndExe, :IndAgente, :MntBaseFaena, :MntMargComer, :PrcConsFinal, :NmbItem, :DscItem, :QtyRef, :UnmdRef, :PrcRef, :QtyItem, :SubQty, :SubCod, :FchElabor, :FchVencim, :UnmdItem, :PrcItem, :PrcOtrMon, :Moneda, :FctConv, :DctoOtrMnda, :RecargoOtrMnda, :MontoItemOtrMnda, :DescuentoPct, :DescuentoMonto, :TipoDscto, :ValorDscto, :RecargoPct, :RecargoMonto, :TipoRecargo, :ValorRecargo, :CodImpAdic, :MontoItem, :guide_id)
    end
end
