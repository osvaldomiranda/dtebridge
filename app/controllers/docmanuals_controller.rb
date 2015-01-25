class DocmanualsController < ApplicationController
  before_action :set_docmanual, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @docmanuals = Docmanual.all
    respond_with(@docmanuals)
  end

  def destroy
    @docmanual.destroy
    respond_with(@docmanual)
  end

  def import
    Docmanual.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end


  private
    def set_docmanual
      @docmanual = Docmanual.find(params[:id])
    end

    def docmanual_params
      params.require(:docmanual).permit(:tipodoc, :folio, :fchemis, :rutemisor, :rutrecep, :rznsocrecep, :mntneto, :mntexe, :mntiva, :otrosimpto, :mnttotal, :impto18, :impto10, :impto25, :impto30, :estado)
    end
end
