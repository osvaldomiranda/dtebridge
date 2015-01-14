class LibroVentaController < ApplicationController
  def index
    @empresas = Empresa.all

    rut = ""
 
    mes = "0001/01"
 
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    
    @empresas = Empresa.all
    @documentos = Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE"') 
    @totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).first
    @totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).first

    @otrosImps = Documento.select('"TipoDTE",impuesto_retens.TipoImp as tipoimp, impuesto_retens.TasaImp as tasaimp, sum(impuesto_retens.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE",impuesto_retens.TipoImp,impuesto_retens.TasaImp')
    @otrosImpsCred = Documento.select('"TipoDTE",impuesto_retens.TipoImp as tipoimp, impuesto_retens.TasaImp as tasaimp, sum(impuesto_retens.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE",impuesto_retens.TipoImp,impuesto_retens.TasaImp')
    
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
    @documentos = Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE"') 
    @totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).first
    @totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum(impuesto_retens.MontoImp) as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).first

    @otrosImps = Documento.select('"TipoDTE",impuesto_retens.TipoImp as tipoimp, impuesto_retens.TasaImp as tasaimp, sum(impuesto_retens.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE",impuesto_retens.TipoImp,impuesto_retens.TasaImp')
    @otrosImpsCred = Documento.select('"TipoDTE",impuesto_retens.TipoImp as tipoimp, impuesto_retens.TasaImp as tasaimp, sum(impuesto_retens.MontoImp) as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE",impuesto_retens.TipoImp,impuesto_retens.TasaImp')
    
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end


end
