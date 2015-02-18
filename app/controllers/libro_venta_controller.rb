class LibroVentaController < ApplicationController
  def index
    @empresas = Empresa.all

    rut = ""
    mes = "0001/01"
 
    @empresa = ""
    @fecha = ""
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    

#Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30' ).group('"TipoDTE"')
#Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30' ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
#Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30' ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')

#Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30').joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
#Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', '77888630-8', '2015-01-01', '2015-01-30').joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')


#Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', '77398570-7' ).group('"tipodoc"')
#Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')


    @empresas = Empresa.all
    @documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).group('"TipoDTE"')
    totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
    totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')

    totFact.map {|e| @totFact = e}
    totCred.map {|e| @totCred = e}

    @otrosImps = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
    @otrosImpsCred = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')

    @docmanuals = Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', rut ).group('"tipodoc"')
   
    totFmanual  = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut)
    totCredManual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp,  count(*) as count').where('"tipodoc"=60 and "rutemisor"=? ', rut )

    totFmanual.map {|e| @totFmanual = e}
    totCredManual.map {|e| @totCredManual = e}   

    @otrosImpsMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')
    @otrosImpsCredMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc"=60 and "rutemisor"=? ', rut ).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')

  end

  def find
    @empresas = Empresa.all

    rut = params[:empresa]
    mes = params[:Mes].gsub('-','/')
    @fecha = mes
    if params[:Mes] == ""
        mes = "0001/01"
        @fecha = ""
    end

    emp = Empresa.where(rut: rut).first
    @empresa = emp.rznsocial
   
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")

    if mes[5..7] == "02"
        hasta = Date.strptime("#{mes}/28", "%Y/%m/%d")
    else
        hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    end    

    
    @empresas = Empresa.all
    @documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"').where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).group('"TipoDTE"')
    totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
    totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, count(*) as count').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins('LEFT OUTER JOIN "impuesto_retens" ON "impuesto_retens"."documento_id" = "documentos"."id"')
 
    totFact.map {|e| @totFact = e}
    totCred.map {|e| @totCred = e}

    @otrosImps = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
    @otrosImpsCred = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('"TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')

    @docmanuals = Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', rut ).group('"tipodoc"')
    totFman = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut)
    totCManual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp,  count(*) as count').where('"tipodoc"=60 and "rutemisor"=? ', rut )

    totFman.map {|e| @totFmanual = e}
    totCManual.map {|e| @totCredManual  = e}

    @otrosImpsMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', rut).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')
    @otrosImpsCredMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>30 and "rutemisor"=? ', rut ).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')
   
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  def generalibro
    # buscar libro, si existe, hacer destroy (el detalle debe estar dependent destroy)
    rut = params[:empresa]
    mes = params[:Mes]
    libro = Libro.where(rut: rut).where(idenvio: mes).where(tipo: "VENTA")
    if !libro.nil?
        if libro.enviado = "NO"
            libro.destroy
            create(rut, mes)
        end
    end
        

  end

  def create (rut, mes)
    # registrar libro con sus datos
    libro = Libro.new
    libro.rut = rut
    libro.tipo = "VENTA"
    libro.fecha = mes
    libro.idenvio = mes.gsub('/','')
    libro.enviado = "NO"
    libro.save

    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    if mes[5..7] == "02"
        hasta = Date.strptime("#{mes}/28", "%Y/%m/%d")
    else
        hasta = Date.strptime("#{mes}/30", "%Y/%m/%d")
    end   

    # llenar detalle libro con doc electronicos
    dtes = Documento.where('"TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', rut, desde, hasta )
    dtes.map { |e|  
        detlibro = Detlibro.new
        detlibro.tipo = e.TipoDTE
        detlibro.rut = e.RUTEmisor
        detlibro.folio = e.folio
        detlibro.mnttotal = e.MntTotal
        detlibro.id_libro = libro.id 
        detlibro.save
    }

    # llenar detalle libro con doc manuales
    docmanual = Docmanual.where('"tipodoc" <> 52 and "rutemisor"=? ', rut )
    docmanual.map { |e|  
        detlibro = Detlibro.new
        detlibro.tipo = e.TipoDTE
        detlibro.rut = e.RUTEmisor
        detlibro.folio = e.folio
        detlibro.mnttotal = e.MntTotal
        detlibro.id_libro = libro.id 
        detlibro.save
    }    

    # crear xml formado
    # guardar url de xml en registro del libro
    libro.xml(mes,rut)

  end



end
