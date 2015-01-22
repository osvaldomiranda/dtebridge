class DocmanualsController < ApplicationController
  before_action :set_docmanual, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @docmanuals = Docmanual.all
    respond_with(@docmanuals)
  end

  def show
    respond_with(@docmanual)
  end

  def new
    @docmanual = Docmanual.new
    respond_with(@docmanual)
  end

  def edit
  end

  def create
    @docmanual = Docmanual.new(docmanual_params)
    @docmanual.save
    respond_with(@docmanual)
  end

  def update
    @docmanual.update(docmanual_params)
    respond_with(@docmanual)
  end

  def destroy
    @docmanual.destroy
    respond_with(@docmanual)
  end

  private
    def set_docmanual
      @docmanual = Docmanual.find(params[:id])
    end

    def docmanual_params
      params.require(:docmanual).permit(:tipodoc, :folio, :fchemis, :rutemisor, :rutrecep, :rznsocrecep, :mntneto, :mntexe, :mntiva, :otrosimpto, :mnttotal, :impto18, :impto10, :impto25, :impto30, :estado)
    end
end
