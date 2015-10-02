class ReportController < ApplicationController
 
  def venta
    @empresas = Empresa.all

    @documentos = Documento.all
    respond_to do |format|
      format.html
      format.csv { send_data @documentos.to_csv }
      format.xls 
    end
  end

  def find
    @rut = params[:empresa]

    mes = params[:Mes].gsub('-','/')
    @fecha = mes
    if params[:Mes] == ""
        mes = "0001/01"
        @fecha = ""
    end
    
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/#{desde.end_of_month.day}", "%Y/%m/%d") 

    @empresas = Empresa.all

    @documentos = Documento.where('"RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',  @rut, desde, hasta )

    respond_to do |format|
      format.html
      format.xls 
    end
  end

  def compra
    @empresas = Empresa.all

    @documentos = Doccompra.all
    respond_to do |format|
      format.html
      format.csv { send_data @documentos.to_csv }
      format.xls 
    end
  end

  def findCompra
    @rut = params[:empresa]

    mes = params[:Mes].gsub('-','/')
    @fecha = mes
    if params[:Mes] == ""
        mes = "0001/01"
        @fecha = ""
    end
    
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/#{desde.end_of_month.day}", "%Y/%m/%d") 

    @empresas = Empresa.all

    @documentos = Doccompra.where('"RUTRecep"=? and "FchEmis" >= ? AND "FchEmis" <= ?',  @rut, desde, hasta )

    respond_to do |format|
      format.html
      format.xls 
    end
  end
end
