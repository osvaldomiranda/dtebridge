class DscRcgGlobalsController < ApplicationController
  before_action :set_dsc_rcg_global, only: [:show, :edit, :update, :destroy]

  # GET /dsc_rcg_globals
  # GET /dsc_rcg_globals.json
  def index
    @dsc_rcg_globals = DscRcgGlobal.all
  end

  # GET /dsc_rcg_globals/1
  # GET /dsc_rcg_globals/1.json
  def show
  end

  # GET /dsc_rcg_globals/new
  def new
    @dsc_rcg_global = DscRcgGlobal.new
  end

  # GET /dsc_rcg_globals/1/edit
  def edit
  end

  # POST /dsc_rcg_globals
  # POST /dsc_rcg_globals.json
  def create
    @dsc_rcg_global = DscRcgGlobal.new(dsc_rcg_global_params)

    respond_to do |format|
      if @dsc_rcg_global.save
        format.html { redirect_to @dsc_rcg_global, notice: 'Dsc rcg global was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dsc_rcg_global }
      else
        format.html { render action: 'new' }
        format.json { render json: @dsc_rcg_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dsc_rcg_globals/1
  # PATCH/PUT /dsc_rcg_globals/1.json
  def update
    respond_to do |format|
      if @dsc_rcg_global.update(dsc_rcg_global_params)
        format.html { redirect_to @dsc_rcg_global, notice: 'Dsc rcg global was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dsc_rcg_global.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dsc_rcg_globals/1
  # DELETE /dsc_rcg_globals/1.json
  def destroy
    @dsc_rcg_global.destroy
    respond_to do |format|
      format.html { redirect_to dsc_rcg_globals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dsc_rcg_global
      @dsc_rcg_global = DscRcgGlobal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dsc_rcg_global_params
      params.require(:dsc_rcg_global).permit(:NroLinDR, :integer, :TpoMov, :string, :GlosaDR, :string, :TpoValor, :string, :ValorDR, :integer, :IndExeDR, :integer, :documento_id)
    end
end
