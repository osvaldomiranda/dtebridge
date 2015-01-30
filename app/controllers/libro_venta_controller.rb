class LibroVentaController < ApplicationController
  def index
    @empresas = Empresa.all

    rut = ""
 
    mes = "0001/01"
 
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    
    @empresas = Empresa.all
    @documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).group('"TipoDTE"')
    @totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
    @totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')

    @otrosImps = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
    @otrosImpsCred = Documento.select('"TipoDTE",impuesto_retens."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp,impuesto_retens"."TasaImp"')
    
    @docmanuals = Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', rut ).group('"tipodoc"')
   
    @totFmanual  = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut)
    @totCredManual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp,  count(*) as count').where('"tipodoc"=60 and "rutemisor"=? ', rut )
   
    @otrosImpsMan = Docmanual.select('"tipodoc",otrosimpmanuals.TipoImp as tipoimp, otrosimpmanuals.TasaImp as tasaimp, sum(otrosimpmanuals.MontoImp) as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "RUTEmisor"=? ', rut).joins(:otrosimpmanuals).group('"tipodoc",otrosimpmanuals.TipoImp,otrosimpmanuals.TasaImp')
    @otrosImpsCredMan = Docmanual.select('"tipodoc",otrosimpmanuals.TipoImp as tipoimp, otrosimpmanuals.TasaImp as tasaimp, sum(otrosimpmanuals.MontoImp) as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>30 and "RUTEmisor"=? ', rut ).joins(:otrosimpmanuals).group('"tipodoc",otrosimpmanuals.TipoImp,otrosimpmanuals.TasaImp')

    @totFact = @totFact.first
    @totCred = @totCred.first

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
    @documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).group('"TipoDTE"')
    totF = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
    @totFact = totF.first
    totC = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
    @totCred = totC.first

Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30' ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')



    @otrosImps = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
    @otrosImpsCred = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp,impuesto_retens"."TasaImp"')
    
    @docmanuals = Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', rut ).group('"tipodoc"')
    totFman = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut)
    @totFmanual = totFman.first
    totCManual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp,  count(*) as count').where('"tipodoc"=60 and "rutemisor"=? ', rut )
    @totCredManual = totCManual.first

    @otrosImpsMan = Docmanual.select('"tipodoc",otrosimpmanuals.TipoImp as tipoimp, otrosimpmanuals.TasaImp as tasaimp, sum(otrosimpmanuals.MontoImp) as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "RUTEmisor"=? ', rut).joins(:otrosimpmanuals).group('"tipodoc",otrosimpmanuals.TipoImp,otrosimpmanuals.TasaImp')
    @otrosImpsCredMan = Docmanual.select('"tipodoc",otrosimpmanuals.TipoImp as tipoimp, otrosimpmanuals.TasaImp as tasaimp, sum(otrosimpmanuals.MontoImp) as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>30 and "RUTEmisor"=? ', rut ).joins(:otrosimpmanuals).group('"tipodoc",otrosimpmanuals.TipoImp,otrosimpmanuals.TasaImp')
   
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end


end
