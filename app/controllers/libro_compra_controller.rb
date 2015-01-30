class LibroCompraController < ApplicationController
  def index
    @empresas = Empresa.all

    rut = ""
 
    mes = "0001/01"
 
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    
    @empresas = Empresa.all

    
    @documentos = Doccompra.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE"') 
    @totFact = Doccompra.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).first
    @totCred = Doccompra.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).first

    @otrosImps = Doccompra.select('"TipoDTE",imptoretencompras.TipoImp as tipoimp, imptoretencompras.TasaImp as tasaimp, sum(imptoretencompras.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE",imptoretencompras.TipoImp,imptoretencompras.TasaImp')
    @otrosImpsCred = Doccompra.select('"TipoDTE",imptoretencompras.TipoImp as tipoimp, imptoretencompras.TasaImp as tasaimp, sum(imptoretencompras.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE",imptoretencompras.TipoImp,imptoretencompras.TasaImp')
    
  end

  def find
    @empresas = Empresa.all

    rut = params[:empresa]
    mes = params[:Mes].gsub('-','/')
    if params[:Mes] == ""
        mes = "0001/01"
    end

    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    
    @empresas = Empresa.all
    @documentos = Doccompra.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE"') 
    @totFact = Doccompra.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).first
    @totCred = Doccompra.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(imptoretencompras.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).first

    @otrosImps = Doccompra.select('"TipoDTE",imptoretencompras.TipoImp as tipoimp, imptoretencompras.TasaImp as tasaimp, sum(imptoretencompras.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE",imptoretencompras.TipoImp,imptoretencompras.TasaImp')
    @otrosImpsCred = Doccompra.select('"TipoDTE",imptoretencompras.TipoImp as tipoimp, imptoretencompras.TasaImp as tasaimp, sum(imptoretencompras.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:imptoretencompras).group('"TipoDTE",imptoretencompras.TipoImp,imptoretencompras.TasaImp')
    
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end
end
