class DocmanualsController < ApplicationController
  before_action :set_docmanual, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @docmanuals = Docmanual.where(estado: "PREVIO")
    totFmanual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"estado" = ? AND "tipodoc" <> 52 and "tipodoc"<>60', "PREVIO")
    totFmanual.map { |e| @totFmanual = e }
    
    respond_with(@docmanuals)
  end

  def destroy
    @docmanual.destroy
    respond_with(@docmanual)
  end

  def import
    begin
      @docmanuals = Docmanual.where(estado: "PREVIO")
      Docmanual.import(params[:file])

      totFmanual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60')
      totFmanual.map { |e| @totFmanual = e }

      respond_to do |format|
        format.html { render action: 'index'}
      end  
    rescue
      flash[:notice] = "Archivo con formato incorrecto"
      respond_to do |format|
        format.html { render action: 'index' }
      end  
    end
  end


  private
    def set_docmanual
      @docmanual = Docmanual.find(params[:id])
    end

    def docmanual_params
      params.require(:docmanual).permit(:tipodoc, :folio, :fchemis, :rutemisor, :rutrecep, :rznsocrecep, :mntneto, :mntexe, :mntiva, :otrosimpto, :mnttotal, :impto18, :impto10, :impto25, :impto30, :estado, :anulado)
    end
end
