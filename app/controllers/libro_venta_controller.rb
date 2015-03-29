class LibroVentaController < ApplicationController
  def index
    @empresas = Empresa.all
  end

  def find
    @empresas = Empresa.all

    @rut = params[:empresa]
    mes = params[:Mes].gsub('-','/')
    @fecha = mes
    if params[:Mes] == ""
        mes = "0001/01"
        @fecha = ""
    end

    emp = Empresa.where(rut: @rut).first
    @empresa = emp.rznsocial
   
    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")

    if mes[5..7] == "02"
        hasta = Date.strptime("#{mes}/28", "%Y/%m/%d")
    else
        hasta = Date.strptime("#{mes}/31", "%Y/%m/%d")
    end    

    
    @empresas = Empresa.all
    @documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, count(*) as count').where('estado <> ? AND "TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  @rut, desde, hasta ).group('"TipoDTE"')
    totFact = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, count(*) as count').where('estado <> ? AND "TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  @rut, desde, hasta )
    
    totCred = Documento.select('sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal, count(*) as count').where('estado <> ? AND "TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  @rut, desde, hasta )
 
    totFact.map {|e| @totFact = e}
    totCred.map {|e| @totCred = e}


    @otrosImps = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('estado <> ? AND  "TipoDTE" <> 52 and "TipoDTE"<>61 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  @rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')
    @otrosImpsCred = Documento.select('"TipoDTE","impuesto_retens"."TipoImp" as tipoimp, "impuesto_retens"."TasaImp" as tasaimp, sum("impuesto_retens"."MontoImp") as montoimp').where('estado <> ? AND  "TipoDTE"=61 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?',"Rechazado SII",  @rut, desde, hasta ).joins(:impuesto_retens).group('"TipoDTE","impuesto_retens"."TipoImp","impuesto_retens"."TasaImp"')


    @docmanuals = Docmanual.select('"tipodoc", sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,  sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "rutemisor"=? ', @rut ).group('"tipodoc"')
    totFman = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp, count(*) as count').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', @rut)
    totCManual = Docmanual.select('sum("mntneto") as mntneto,sum("mntexe") as mntexe, sum("mntiva") as iva, sum("mnttotal") as mnttotal,sum(impto10+impto18+impto25+impto30) as otrosimp,  count(*) as count').where('"tipodoc"=60 and "rutemisor"=? ', @rut )

    totFman.map {|e| @totFmanual = e}
    totCManual.map {|e| @totCredManual  = e}

    @otrosImpsMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>60 and "rutemisor"=? ', @rut).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')
    @otrosImpsCredMan = Docmanual.select('"tipodoc","otrosimpmanuals"."TipoImp" as tipoimp, "otrosimpmanuals"."TasaImp" as tasaimp, sum("otrosimpmanuals"."MontoImp") as montoimp').where('"tipodoc" <> 52 and "tipodoc"<>30 and "rutemisor"=? ', @rut ).joins(:otrosimpmanuals).group('"tipodoc","otrosimpmanuals"."TipoImp","otrosimpmanuals"."TasaImp"')
   
    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  def generalibro
    # buscar libro, si existe, hacer destroy (el detalle debe estar dependent destroy)
    @msg = "Se ha generado Libro"
    @rut = params[:rut]
    @mes = params[:mes]
    libro = Libro.where(rut: @rut).where(idenvio: @mes).where(tipo: "VENTA").first

    if !libro.nil?
        if libro.enviado = "NO"
            libro.destroy
        else
            @msg = "Libro ya se ha enviado a SII" 
        end
    else
        if !create(@rut, @mes)
            @msg = "Libro NO generado" 
        end    
    end
    respond_to do |format|
      format.html { render 'show' }  
    end    
  end


  def create (rut, mes)

    if (rut.nil? || mes.nil?)
        return false
    end    

    # registrar libro con sus datos
    libro = Libro.new
    libro.rut = rut
    libro.tipo = "VENTA"
    libro.fecha = mes
    libro.estado = "XML NO Generado"
    libro.idenvio = mes.gsub('/','-')
    libro.enviado = "NO"
    libro.save

    desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    if mes[5..7] == "02"
        hasta = Date.strptime("#{mes}/28", "%Y/%m/%d")
    else
        hasta = Date.strptime("#{mes}/31", "%Y/%m/%d")
    end   

    # llenar detalle libro con doc electronicos
    dtes = Documento.where('estado <> ? AND "TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  rut, desde, hasta )
    dtes.map { |e|  
      detlibro = Detlibro.new
      detlibro.tipodte = e.TipoDTE
      detlibro.rutemis = e.RUTEmisor
      detlibro.folio = e.Folio
      detlibro.mnttotal = e.MntTotal
  
      detlibro.mntneto = e.MntNeto
      detlibro.mntexe = e.MntExe
      detlibro.mntiva = e.IVA
      
      sum_imptos = 0
      e.impuesto_retens.map { |imp|
        sum_imptos += imp.MontoImp
        case imp.TasaImp
        when 18 
          detlibro.impto18 = imp.MontoImp
        when 10  
          detlibro.impto10 = imp.MontoImp
        when 25  
          detlibro.impto25 = imp.MontoImp
        when 30  
          detlibro.impto30 = imp.MontoImp  
        end
      }
      detlibro.otrosimpto = sum_imptos
      detlibro.libro_id = libro.id 

      detlibro.save
    }

    # llenar detalle libro con doc manuales
    docmanual = Docmanual.where('"rutemisor"=? ', rut )
    docmanual.map { |e|  
      detlibro = Detlibro.new
      detlibro.tipodte = e.tipodoc
      detlibro.rutemis = e.rutemisor
      detlibro.rutrecep = e.rutrecep
      detlibro.folio = e.folio
      detlibro.mnttotal = e.mnttotal
      detlibro.mntneto = e.mntneto
      detlibro.mntexe = e.mntexe
      detlibro.mntiva = e.mntiva
      detlibro.otrosimpto = e.otrosimpto
      detlibro.impto18 = e.impto18
      detlibro.impto10 = e.impto10
      detlibro.impto25 = e.impto25
      detlibro.impto30 = e.impto30

      detlibro.libro_id = libro.id 

      if detlibro.save
        e.estado = "EN LIBRO"
        e.save
      end
    }   

    return true 

  end



end
