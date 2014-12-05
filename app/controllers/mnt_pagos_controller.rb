class MntPagosController < ApplicationController
  before_action :set_mnt_pago, only: [:show, :edit, :update, :destroy]

  # GET /mnt_pagos
  # GET /mnt_pagos.json
  def index
    @mnt_pagos = MntPago.all
  end

  # GET /mnt_pagos/1
  # GET /mnt_pagos/1.json
  def show
  end

  # GET /mnt_pagos/new
  def new
    @mnt_pago = MntPago.new
  end

  # GET /mnt_pagos/1/edit
  def edit
  end

  # POST /mnt_pagos
  # POST /mnt_pagos.json
  def create
    @mnt_pago = MntPago.new(mnt_pago_params)

    respond_to do |format|
      if @mnt_pago.save
        format.html { redirect_to @mnt_pago, notice: 'Mnt pago was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mnt_pago }
      else
        format.html { render action: 'new' }
        format.json { render json: @mnt_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mnt_pagos/1
  # PATCH/PUT /mnt_pagos/1.json
  def update
    respond_to do |format|
      if @mnt_pago.update(mnt_pago_params)
        format.html { redirect_to @mnt_pago, notice: 'Mnt pago was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mnt_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mnt_pagos/1
  # DELETE /mnt_pagos/1.json
  def destroy
    @mnt_pago.destroy
    respond_to do |format|
      format.html { redirect_to mnt_pagos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mnt_pago
      @mnt_pago = MntPago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mnt_pago_params
      params.require(:mnt_pago).permit(:FchPago, :string, :MntPago, :integer, :documento_id)
    end
end
