class DetlibroController < ApplicationController
  def index
    libro = Libro.find(params[:id])
    @detalles =  libro.detlibro.order(tipodte: :asc , folio: :asc )

    # @otrosimp = libro.detlibro.where(tipodte: t.tipo).sum(:otrosimp)
    # @mntexe = libro.detlibro.where(tipodte: t.tipo).sum(:mntexe)
    # @mntneto = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
    # @iva = libro.detlibro.where(tipodte: t.tipo).sum(:mntiva).to_i 
    # @mnttotal = libro.detlibro.where(tipodte: t.tipo).sum(:mnttotal) 
  end
end
