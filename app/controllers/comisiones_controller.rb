class ComisionesController < ApplicationController
  before_action :set_comisione, only: [:show, :edit, :update, :destroy]

  # GET /comisiones
  # GET /comisiones.json
  def index
    @comisiones = Comisione.all
  end

  # GET /comisiones/1
  # GET /comisiones/1.json
  def show
  end

  # GET /comisiones/new
  def new
    @comisione = Comisione.new
  end

  # GET /comisiones/1/edit
  def edit
  end

  # POST /comisiones
  # POST /comisiones.json
  def create
    @comisione = Comisione.new(comisione_params)

    respond_to do |format|
      if @comisione.save
        format.html { redirect_to @comisione, notice: 'Comisione was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comisione }
      else
        format.html { render action: 'new' }
        format.json { render json: @comisione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comisiones/1
  # PATCH/PUT /comisiones/1.json
  def update
    respond_to do |format|
      if @comisione.update(comisione_params)
        format.html { redirect_to @comisione, notice: 'Comisione was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comisione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comisiones/1
  # DELETE /comisiones/1.json
  def destroy
    @comisione.destroy
    respond_to do |format|
      format.html { redirect_to comisiones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comisione
      @comisione = Comisione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comisione_params
      params.require(:comisione).permit(:NroLinCom, :integer, :TipoMovim, :string, :Glosa, :string, :ValComNeto, :integer, :ValComExe, :integer, :ValComIVA, :integer, :documento_id)
    end
end
