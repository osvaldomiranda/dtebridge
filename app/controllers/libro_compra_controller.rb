class LibroCompraController < ApplicationController
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

    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  def generalibro
    @msg = "Se ha generado Libro"
    @rut = params[:rut]
    @mes = params[:mes]
    libro = Libro.where(rut: @rut).where(idenvio: @mes).where(tipo: "COMPRA").first

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
    libro.tipo = "COMPRA"
    libro.fecha = mes
    libro.estado = "XML NO Generado"
    libro.idenvio = mes.gsub('/','-')
    libro.enviado = "NO"
    libro.save

    # desde = Date.strptime("#{mes}/01", "%Y/%m/%d")
    # if mes[5..7] == "02"
    #     hasta = Date.strptime("#{mes}/28", "%Y/%m/%d")
    # else
    #     hasta = Date.strptime("#{mes}/31", "%Y/%m/%d")
    # end   

    # llenar detalle libro con doc electronicos
    # dtes = Doccompra.where('estado <> ? AND "TipoDTE" <> 52 and "RUTEmisor"=? and "FchEmis" >= ? AND "FchEmis" <= ?',"Rechazado SII",  rut, desde, hasta )
    # dtes.map { |e|  
    #   detlibro = Detlibro.new
    #   detlibro.tipodte = e.TipoDTE
    #   detlibro.rutemis = e.RUTEmisor
    #   detlibro.folio = e.Folio
    #   detlibro.mnttotal = e.MntTotal
  
    #   detlibro.mntneto = e.MntNeto
    #   detlibro.mntexe = e.MntExe
    #   detlibro.mntiva = e.IVA
      
    #   sum_imptos = 0
    #   e.impuesto_retens.map { |imp|
    #     sum_imptos += imp.MontoImp
    #     case imp.TasaImp
    #     when 18 
    #       detlibro.impto18 = imp.MontoImp
    #     when 10  
    #       detlibro.impto10 = imp.MontoImp
    #     when 25  
    #       detlibro.impto25 = imp.MontoImp
    #     when 30  
    #       detlibro.impto30 = imp.MontoImp  
    #     end
    #   }
    #   detlibro.otrosimpto = sum_imptos
    #   detlibro.libro_id = libro.id 

    #   detlibro.save
    # }

    # llenar detalle libro con doc manuales
    docmanual = Compmanual.where( rutrecep: rut )
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
