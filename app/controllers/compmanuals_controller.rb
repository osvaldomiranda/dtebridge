class CompmanualsController < ApplicationController
  before_action :set_compmanual, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @compmanuals = Compmanual.where(estado: "PREVIO")
    respond_with(@compmanuals)
  end

  def show
    respond_with(@compmanual)
  end

  def import
    # begin
      @compmanuals = Compmanual.all
      Compmanual.import(params[:file])
      respond_to do |format|
        format.html { render action: 'index', notice: "Documentos Ok"}
      end   
    # rescue
    #   flash[:notice] = "Archivo con formato incorrecto"
    #   respond_to do |format|
    #     format.html { render action: 'index'}
    #   end  
    # end 
  end

  def destroy
    @compmanual.destroy
    respond_with(@compmanual)
  end

  private
    def set_compmanual
      @compmanual = Compmanual.find(params[:id])
    end

    def compmanual_params
      params.require(:compmanual).permit(:tipodoc, :folio, :fchemis, :rutemisor, :rutrecep, :rznsoemisor, :mntneto, :mntexe, :mntiva, :otrosimpto, :mnttotal, :impto18, :impto10, :impto25, :impto30, :estado)
    end
end
