class ImptoRetensController < ApplicationController
  before_action :set_impto_reten, only: [:show, :edit, :update, :destroy]

  # GET /impto_retens
  # GET /impto_retens.json
  def index
    @impto_retens = ImptoReten.all
  end

  # GET /impto_retens/1
  # GET /impto_retens/1.json
  def show
  end

  # GET /impto_retens/new
  def new
    @impto_reten = ImptoReten.new
  end

  # GET /impto_retens/1/edit
  def edit
  end

  # POST /impto_retens
  # POST /impto_retens.json
  def create
    @impto_reten = ImptoReten.new(impto_reten_params)

    respond_to do |format|
      if @impto_reten.save
        format.html { redirect_to @impto_reten, notice: 'Impto reten was successfully created.' }
        format.json { render action: 'show', status: :created, location: @impto_reten }
      else
        format.html { render action: 'new' }
        format.json { render json: @impto_reten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impto_retens/1
  # PATCH/PUT /impto_retens/1.json
  def update
    respond_to do |format|
      if @impto_reten.update(impto_reten_params)
        format.html { redirect_to @impto_reten, notice: 'Impto reten was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @impto_reten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impto_retens/1
  # DELETE /impto_retens/1.json
  def destroy
    @impto_reten.destroy
    respond_to do |format|
      format.html { redirect_to impto_retens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impto_reten
      @impto_reten = ImptoReten.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impto_reten_params
      params.require(:impto_reten).permit(:TipoImp, :string, :TasaImp, :float, :MontoImp, :integer, :documento_id)
    end
end
