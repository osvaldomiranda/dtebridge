class DetallesController < ApplicationController
  before_action :set_detalle, only: [:show, :edit, :update, :destroy]

  # GET /detalles
  # GET /detalles.json
  def index
    @detalles = Detalle.all
  end

  # GET /detalles/1
  # GET /detalles/1.json
  def show
  end

  # GET /detalles/new
  def new
    @detalle = Detalle.new
  end

  # GET /detalles/1/edit
  def edit
  end

  # POST /detalles
  # POST /detalles.json
  def create
    @detalle = Detalle.new(detalle_params)

    respond_to do |format|
      if @detalle.save
        format.html { redirect_to @detalle, notice: 'Detalle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @detalle }
      else
        format.html { render action: 'new' }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalles/1
  # PATCH/PUT /detalles/1.json
  def update
    respond_to do |format|
      if @detalle.update(detalle_params)
        format.html { redirect_to @detalle, notice: 'Detalle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles/1
  # DELETE /detalles/1.json
  def destroy
    @detalle.destroy
    respond_to do |format|
      format.html { redirect_to detalles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle
      @detalle = Detalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_params
      params.require(:detalle).permit(:NroLinDet, :integer, :TpoCodigo, :string, :VlrCodigo, :string, :TpoDocLiq, :string, :IndExe, :string, :IndAgente, :string, :MntBaseFaena, :integer, :MntMargComer, :integer, :PrcConsFinal, :integer, :NmbItem, :integer, :DscItem, :string, :QtyRef, :integer, :UnmdRef, :string, :PrcRef, :float, :QtyItem, :float, :FchElabor, :string, :FchVencim, :string, :UnmdItem, :string, :PrcItem, :DescuentoPct, :DescuentoMonto, :integer, :CodImpAdic, :string, :MontoItem, :integer, :documento_id)
    end
end
