class Libro < ActiveRecord::Base
  has_many :detlibro, dependent: :destroy

  # searchable do
  #   text :empresa, :tipo, :fecha
  # end

  def empresa
      Empresa.find_by_rut(self.rut).rznsocial
  end

  def xml

    if self.tipo == "VENTA"
      libroventa  
    elsif self.tipo == "COMPRA"
      librocompra
    end      

  end

  def libroventa

    libro = self
    empresa = Empresa.find_by_rut(libro.rut)
    numResolucion = empresa.numerores
    fchResolucion = empresa.fechares
    rutEnvia = empresa.rutenvia

    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<LibroCompraVenta xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte LibroCV_v10.xsd\" version=\"1.0\" xmlns=\"http://www.sii.cl/SiiDte\">"
    tosign_xml+="<EnvioLibro ID=\"IDV#{libro.idenvio}\">"
    tosign_xml+="<Caratula>"
    tosign_xml+="<RutEmisorLibro>#{libro.rut}</RutEmisorLibro>"

    tosign_xml+="<RutEnvia>#{rutEnvia}</RutEnvia>"
    tosign_xml+="<PeriodoTributario>#{libro.idenvio}</PeriodoTributario>"
    
    tosign_xml+="<FchResol>#{fchResolucion}</FchResol>"
    tosign_xml+="<NroResol>#{numResolucion}</NroResol>"

     tosign_xml+="<TipoOperacion>VENTA</TipoOperacion>"
    # Para certificacion
     # tosign_xml+="<TipoLibro>ESPECIAL</TipoLibro>"

    tosign_xml+="<TipoLibro>MENSUAL</TipoLibro>"
    tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>"

    # Solo para certificación 
     # tosign_xml+="<FolioNotificacion>1</FolioNotificacion>" 
    tosign_xml+="</Caratula>"

    #Resumen
    tipos = Tipodte.all

    tosign_xml+="<ResumenPeriodo>\r\n"

    #Documentos electronicos
    tipos.each do | t |

      cantidad = libro.detlibro.where(tipodte: t.tipo).count
      if t.tipo == 35
        cantidad = libro.detlibro.where(tipodte: t.tipo).sum(:cantidad)
      end

      mntexe = libro.detlibro.where(tipodte: t.tipo).sum(:mntexe)
      mntneto = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
      iva = libro.detlibro.where(tipodte: t.tipo).sum(:mntiva).to_i 
      mnttotal = libro.detlibro.where(tipodte: t.tipo).sum(:mnttotal) 

      impto18 = libro.detlibro.where(tipodte: t.tipo).sum(:impto18).to_i
      impto10 = libro.detlibro.where(tipodte: t.tipo).sum(:impto10).to_i
      impto25 = libro.detlibro.where(tipodte: t.tipo).sum(:impto25).to_i
      impto30 = libro.detlibro.where(tipodte: t.tipo).sum(:impto30).to_i

      if cantidad > 0 
        tosign_xml+="<TotalesPeriodo>\r\n"
        tosign_xml+="<TpoDoc>#{t.tipo}</TpoDoc>\r\n"
        tosign_xml+="<TotDoc>#{cantidad}</TotDoc>"
        tosign_xml+="<TotMntExe>#{mntexe}</TotMntExe>\r\n"
        tosign_xml+="<TotMntNeto>#{mntneto}</TotMntNeto>\r\n"
        tosign_xml+="<TotMntIVA>#{iva}</TotMntIVA>"

        if impto18 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>271</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto18}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto10 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>27</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto10}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto25 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>25</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto25}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto30 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>24</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto24}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end

        tosign_xml+="<TotMntTotal>#{mnttotal}</TotMntTotal>\r\n"

        tosign_xml+="</TotalesPeriodo>\r\n"
      end
    end
    #Documentos Manuales

    tosign_xml+="</ResumenPeriodo>\r\n"

    tiposmanuales = Tipodte.where(manual: "S")

    tiposmanuales.each do |t|
      #Detalle
      detlibro = libro.detlibro.where(tipodte: t.tipo)

      detlibro.each do |det| 

        doc = Docmanual.where(folio: det.folio).where(rutemisor: det.rutemis).last

        if doc.tipodoc != 35 &&  doc.tipodoc != 38
          tosign_xml+="<Detalle>\r\n"
          tosign_xml+="<TpoDoc>#{doc.tipodoc}</TpoDoc>\r\n"
          tosign_xml+="<NroDoc>#{doc.folio}</NroDoc>\r\n"
          if doc.anulado == "S"
            tosign_xml+="<Anulado>A</Anulado>\r\n"
          end

          if doc.anulado == "N"
            
            tosign_xml+="<TasaImp>19</TasaImp>\r\n"
            
            tosign_xml+="<FchDoc>#{doc.fchemis}</FchDoc>\r\n"
            tosign_xml+="<RUTDoc>#{doc.rutrecep}</RUTDoc>\r\n"
            tosign_xml+="<RznSoc>#{doc.rznsocrecep}</RznSoc>\r\n"

            if doc.mntexe > 0
              tosign_xml+="<MntExe>#{doc.mntexe}</MntExe>\r\n"
            end  
            
            tosign_xml+="<MntNeto>#{doc.mntneto}</MntNeto>\r\n"
            tosign_xml+="<MntIVA>#{doc.mntiva.to_i}</MntIVA>\r\n"
            if doc.impto18 > 0
              tosign_xml+="<OtrosImp>\r\n"
              tosign_xml+="<CodImp>271</CodImp>\r\n"
              tosign_xml+="<TasaImp>18</TasaImp>\r\n"
              tosign_xml+="<MntImp>#{doc.impto18.to_i}</MntImp>\r\n"
              tosign_xml+="</OtrosImp>\r\n"
            end
            if doc.impto10 > 0
              tosign_xml+="<OtrosImp>\r\n"
              tosign_xml+="<CodImp>27</CodImp>\r\n"
              tosign_xml+="<TasaImp>10</TasaImp>\r\n"
              tosign_xml+="<MntImp>#{doc.impto10.to_i}</MntImp>\r\n"
              tosign_xml+="</OtrosImp>\r\n"
            end
            if doc.impto25 > 0
              tosign_xml+="<OtrosImp>\r\n"
              tosign_xml+="<CodImp>25</CodImp>\r\n"
              tosign_xml+="<TasaImp>20.5</TasaImp>\r\n"
              tosign_xml+="<MntImp>#{doc.impto25.to_i}</MntImp>\r\n"
              tosign_xml+="</OtrosImp>\r\n"
            end
            if doc.impto30 > 0
              tosign_xml+="<OtrosImp>\r\n"
              tosign_xml+="<CodImp>24</CodImp>\r\n"
              tosign_xml+="<TasaImp>31.5</TasaImp>\r\n"
              tosign_xml+="<MntImp>#{doc.impto30.to_i}</MntImp>\r\n"
              tosign_xml+="</OtrosImp>\r\n"
            end
            tosign_xml+="<MntTotal>#{doc.mnttotal}</MntTotal>\r\n"
          end
          tosign_xml+="</Detalle>\r\n"
        end
      end
    end
    #Fin EnvioLibro
    fchfirma = Date.strptime("#{Date.today.year}/#{Date.today.month}/#{Date.today.day}", "%Y/%m/%d")
    tosign_xml+="<TmstFirma>#{fchfirma}T15:26:15</TmstFirma>"
    tosign_xml+="</EnvioLibro>"

    #Firma
    tosign_xml+="<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">"
    tosign_xml+=  "<SignedInfo>"
    tosign_xml+=   "<CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>"
    tosign_xml+=    "<SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>"
    tosign_xml+=     "<Reference URI=\"\">"
    tosign_xml+=      "<Transforms>"
    tosign_xml+=         "<Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/>"
    tosign_xml+=      "</Transforms>"
    tosign_xml+=      "<DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>"
    tosign_xml+=      "<DigestValue/>"
    tosign_xml+=     "</Reference>"
    tosign_xml+=  "</SignedInfo>"
    tosign_xml+=  "<SignatureValue/>"
    tosign_xml+=  "<KeyInfo>"
    tosign_xml+=   "<KeyValue/>"
    tosign_xml+=   "<X509Data>"
    tosign_xml+=   "</X509Data>"
    tosign_xml+=  "</KeyInfo>"
    tosign_xml+= "</Signature>"

    #Fin Libro  
    tosign_xml+= "</LibroCompraVenta>"

    
    File.open("libro_ventatosing#{libro.rut}#{libro.idenvio}.xml", 'w') { |file| file.puts tosign_xml}

    sleep 1
     
    system("./comando#{libro.rut} libro_ventatosing#{libro.rut}#{libro.idenvio}.xml libro_venta#{libro.rut}#{libro.idenvio}.xml") 

   # lib = File.read "doc-signed#{t}.xml"

    system("rm libro_ventatosing#{libro.rut}#{libro.idenvio}.xml") 
  end

  def librocompra

    libro=self

    empresa = Empresa.find_by_rut(libro.rut)
    numResolucion = empresa.numerores
    fchResolucion = empresa.fechares
    rutEnvia = empresa.rutenvia

    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<LibroCompraVenta xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte LibroCV_v10.xsd\" version=\"1.0\" xmlns=\"http://www.sii.cl/SiiDte\">"
    tosign_xml+="<EnvioLibro ID=\"IDC#{libro.idenvio}\">\r\n"
    tosign_xml+="<Caratula>\r\n"
    tosign_xml+="<RutEmisorLibro>#{libro.rut}</RutEmisorLibro>\r\n"

    if Rails.env.production?
      tosign_xml+="<RutEnvia>#{rutEnvia}</RutEnvia>\r\n"
      tosign_xml+="<PeriodoTributario>#{libro.idenvio}</PeriodoTributario>\r\n"
      tosign_xml+="<FchResol>#{fchResolucion}</FchResol>\r\n"
      tosign_xml+="<NroResol>#{numResolucion}</NroResol>\r\n"
      tosign_xml+="<TipoOperacion>COMPRA</TipoOperacion>\r\n"
      tosign_xml+="<TipoLibro>MENSUAL</TipoLibro>\r\n"
      tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>\r\n"
    else 
      tosign_xml+="<RutEnvia>5682509-6</RutEnvia>\r\n"
      tosign_xml+="<PeriodoTributario>#{libro.idenvio}</PeriodoTributario>\r\n"
      tosign_xml+="<FchResol>2014-09-10</FchResol>"
      tosign_xml+="<NroResol>0</NroResol>"
      tosign_xml+="<TipoOperacion>COMPRA</TipoOperacion>\r\n"
      tosign_xml+="<TipoLibro>ESPECIAL</TipoLibro>\r\n"
      tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>\r\n"
      tosign_xml+="<FolioNotificacion>2</FolioNotificacion>\r\n"
    end

    tosign_xml+="</Caratula>"

    tosign_xml+="<ResumenPeriodo>\r\n"

    tipos = Tipodte.all
    tipos.each do | t |
      cantidad = libro.detlibro.where(tipodte: t.tipo).count
      mntexe = libro.detlibro.where(tipodte: t.tipo).sum(:mntexe)
      mntneto = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
      iva = libro.detlibro.where(tipodte: t.tipo).sum(:mntiva).to_i 
      mnttotal = libro.detlibro.where(tipodte: t.tipo).sum(:mnttotal) 

      impto18 = libro.detlibro.where(tipodte: t.tipo).sum(:impto18).to_i
      impto10 = libro.detlibro.where(tipodte: t.tipo).sum(:impto10).to_i
      impto25 = libro.detlibro.where(tipodte: t.tipo).sum(:impto25).to_i
      impto30 = libro.detlibro.where(tipodte: t.tipo).sum(:impto30).to_i

      ivanorec = libro.detlibro.where(tipodte:t.tipo).sum(:ivanorec).to_i
      countivanorec = libro.detlibro.where(tipodte:t.tipo).where("codivanorec > ?", 0).count


      if cantidad > 0
        tosign_xml+="<TotalesPeriodo>\r\n"
        tosign_xml+="<TpoDoc>#{t.tipo}</TpoDoc>\r\n"
        tosign_xml+="<TotDoc>#{cantidad}</TotDoc>\r\n"
        tosign_xml+="<TotMntExe>#{mntexe}</TotMntExe>\r\n"
        tosign_xml+="<TotMntNeto>#{mntneto}</TotMntNeto>\r\n"
        tosign_xml+="<TotMntIVA>#{iva}</TotMntIVA>\r\n"
        
        if ivanorec > 0
          civanorec = libro.detlibro.where(tipodte:t.tipo).where("codivanorec > ?", 0).last
          codivanorec = civanorec.codivanorec
          tosign_xml+=" <TotIVANoRec>\r\n"
          tosign_xml+=" <CodIVANoRec>#{codivanorec}</CodIVANoRec>\r\n"
          tosign_xml+=" <TotOpIVANoRec>#{countivanorec}</TotOpIVANoRec>\r\n"
          tosign_xml+=" <TotMntIVANoRec>#{ivanorec}</TotMntIVANoRec>\r\n"
          tosign_xml+=" </TotIVANoRec>\r\n"
        end



   #     tosign_xml+="<TotOpIVAUsoComun>1</TotOpIVAUsoComun>\r\n"
   #     tosign_xml+="<TotIVAUsoComun>1</TotIVAUsoComun>\r\n"
   #     tosign_xml+="<FctProp>0.999</FctProp>\r\n"
   #     tosign_xml+="<TotCredIVAUsoComun>1</TotCredIVAUsoComun>\r\n"

        if impto18 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>271</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto18}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto10 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>27</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto10}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto25 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>25</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto25}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end
        if impto30 > 0
          tosign_xml+="<TotOtrosImp>\r\n"
          tosign_xml+="<CodImp>24</CodImp>\r\n"
          tosign_xml+="<TotMntImp>#{impto30}</TotMntImp>\r\n"
          tosign_xml+="</TotOtrosImp>\r\n"
        end

        tosign_xml+="<TotMntTotal>#{mnttotal}</TotMntTotal>\r\n"
        tosign_xml+="</TotalesPeriodo>\r\n"
      end
    end

    # <TotalesPeriodo>
    # <TpoDoc>33</TpoDoc>
    # <TotDoc>2</TotDoc>
    # <TotMntExe>10616</TotMntExe>
    # <TotMntNeto>23544</TotMntNeto>
    # <TotMntIVA>2171</TotMntIVA>
    # <TotIVANoRec>
    # <CodIVANoRec>4</CodIVANoRec>
    # <TotOpIVANoRec>1</TotOpIVANoRec>
    # <TotMntIVANoRec>2302</TotMntIVANoRec>
    # </TotIVANoRec>
    # <TotMntTotal>38633</TotMntTotal>
    # </TotalesPeriodo>

    # <TotalesPeriodo>
    # <TpoDoc>60</TpoDoc>
    # <TotDoc>2</TotDoc>
    # <TotMntExe>0</TotMntExe>
    # <TotMntNeto>11937</TotMntNeto>
    # <TotMntIVA>2268</TotMntIVA>
    # <TotMntTotal>14205</TotMntTotal>
    # </TotalesPeriodo>

    # <TotalesPeriodo>
    # <TpoDoc>46</TpoDoc>
    # <TotDoc>1</TotDoc>
    # <TotMntExe>0</TotMntExe>
    # <TotMntNeto>10622</TotMntNeto>
    # <TotMntIVA>2018</TotMntIVA>

    # <TotOtrosImp>
    # <CodImp>15</CodImp>
    # <TotMntImp>2018</TotMntImp>
    # </TotOtrosImp>
    
    # <TotMntTotal>10622</TotMntTotal>
    # </TotalesPeriodo>

    tosign_xml+="</ResumenPeriodo>"

    #TO DO: Corrigir para usar modelo Doccompra
    tiposmanuales = Tipodte.all

    tiposmanuales.each do |t|
      #Detalle
      detlibro = libro.detlibro.where(tipodte: t.tipo)

      detlibro.each do |det| 

        doc = Compmanual.where(folio: det.folio).where(rutrecep: det.rutrecep).where(rutemisor: det.rutemis).last

        tosign_xml+="<Detalle>\r\n"
        tosign_xml+="<TpoDoc>#{det.tipodte}</TpoDoc>\r\n"
        tosign_xml+="<NroDoc>#{det.folio}</NroDoc>\r\n"
        tosign_xml+="<TpoImp>1</TpoImp>\r\n"
        tosign_xml+="<TasaImp>19</TasaImp>\r\n"
        tosign_xml+="<FchDoc>#{doc.fchemis}</FchDoc>\r\n"
        tosign_xml+="<RUTDoc>#{doc.rutemisor}</RUTDoc>\r\n"
        tosign_xml+="<RznSoc>#{doc.rznsocemisor}</RznSoc>\r\n"
        tosign_xml+="<MntExe>#{det.mntexe}</MntExe>\r\n"
        tosign_xml+="<MntNeto>#{det.mntneto}</MntNeto>\r\n"
        tosign_xml+="<MntIVA>#{det.mntiva.to_i}</MntIVA>"


        if doc.impto18 > 0
          tosign_xml+="<OtrosImp>\r\n"
          tosign_xml+="<CodImp>271</CodImp>\r\n"
          tosign_xml+="<TasaImp>18</TasaImp>\r\n"
          tosign_xml+="<MntImp>#{doc.impto18.to_i}</MntImp>\r\n"
          tosign_xml+="</OtrosImp>\r\n"
        end
        if doc.impto10 > 0
          tosign_xml+="<OtrosImp>\r\n"
          tosign_xml+="<CodImp>27</CodImp>\r\n"
          tosign_xml+="<TasaImp>10</TasaImp>\r\n"
          tosign_xml+="<MntImp>#{doc.impto10.to_i}</MntImp>\r\n"
          tosign_xml+="</OtrosImp>\r\n"
        end
        if doc.impto25 > 0
          tosign_xml+="<OtrosImp>\r\n"
          tosign_xml+="<CodImp>25</CodImp>\r\n"
          tosign_xml+="<TasaImp>20.5</TasaImp>\r\n"
          tosign_xml+="<MntImp>#{doc.impto25.to_i}</MntImp>\r\n"
          tosign_xml+="</OtrosImp>\r\n"
        end
        if doc.impto30 > 0
          tosign_xml+="<OtrosImp>\r\n"
          tosign_xml+="<CodImp>24</CodImp>\r\n"
          tosign_xml+="<TasaImp>31.5</TasaImp>\r\n"
          tosign_xml+="<MntImp>#{doc.impto30.to_i}</MntImp>\r\n"
          tosign_xml+="</OtrosImp>\r\n"
        end

        if det.ivanorec > 0
          tosign_xml+="<IVANoRec>\r\n"
          tosign_xml+="<CodIVANoRec>#{det.codivanorec}</CodIVANoRec>\r\n"
          tosign_xml+="<MntIVANoRec>#{det.ivanorec}</MntIVANoRec>\r\n"
          tosign_xml+="</IVANoRec>\r\n"
        end

        tosign_xml+="<MntTotal>#{det.mnttotal}</MntTotal>\r\n"
        tosign_xml+="</Detalle>\r\n"
      end  

    # <Detalle>
    # <TpoDoc>33</TpoDoc>
    # <NroDoc>32</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>10616</MntExe>
    # <MntNeto>11428</MntNeto>
    # <MntIVA>2171</MntIVA>
    # <MntTotal>24215</MntTotal>
    # </Detalle>

    # <Detalle>
    # <TpoDoc>30</TpoDoc>
    # <NroDoc>781</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>0</MntExe>
    # <MntNeto>30167</MntNeto>
    # <IVAUsoComun>5732</IVAUsoComun>
    # <MntTotal>35899</MntTotal>
    # </Detalle>

    # <Detalle>
    # <TpoDoc>60</TpoDoc>
    # <NroDoc>451</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>0</MntExe>
    # <MntNeto>2926</MntNeto>
    # <MntIVA>556</MntIVA>
    # <MntTotal>3482</MntTotal>
    # </Detalle>

    # <Detalle>
    # <TpoDoc>33</TpoDoc>
    # <NroDoc>67</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>0</MntExe>
    # <MntNeto>12116</MntNeto>
    # <IVANoRec>
    # <CodIVANoRec>4</CodIVANoRec>
    # <MntIVANoRec>2302</MntIVANoRec>
    # </IVANoRec>
    # <MntTotal>14418</MntTotal>
    # </Detalle>

    # <Detalle>
    # <TpoDoc>46</TpoDoc>
    # <NroDoc>9</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>0</MntExe>
    # <MntNeto>10622</MntNeto>
    # <MntIVA>2018</MntIVA>
    # <OtrosImp>
    # <CodImp>15</CodImp>
    # <TasaImp>19</TasaImp>
    # <MntImp>2018</MntImp>
    # </OtrosImp>
    # <MntTotal>10622</MntTotal>
    # </Detalle>

    # <Detalle>
    # <TpoDoc>60</TpoDoc>
    # <NroDoc>211</NroDoc>
    # <TpoImp>1</TpoImp>
    # <TasaImp>19</TasaImp>
    # <FchDoc>2014-06-05</FchDoc>
    # <RUTDoc>07139792-0</RUTDoc>
    # <RznSoc>PEDRO LEON CALDERON</RznSoc>
    # <MntExe>0</MntExe>
    # <MntNeto>9011</MntNeto>
    # <MntIVA>1712</MntIVA>
    # <MntTotal>10723</MntTotal>
    # </Detalle>
    end

    fchfirma = Date.strptime("#{Date.today.year}/#{Date.today.month}/#{Date.today.day}", "%Y/%m/%d")
    tosign_xml+="<TmstFirma>#{fchfirma}T15:26:15</TmstFirma>"

    tosign_xml+="</EnvioLibro>\r\n"

    #Firma
    tosign_xml+="<Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\">"
    tosign_xml+=  "<SignedInfo>"
    tosign_xml+=   "<CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/>"
    tosign_xml+=    "<SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/>"
    tosign_xml+=     "<Reference URI=\"\">"
    tosign_xml+=      "<Transforms>"
    tosign_xml+=         "<Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/>"
    tosign_xml+=      "</Transforms>"
    tosign_xml+=      "<DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/>"
    tosign_xml+=      "<DigestValue/>"
    tosign_xml+=     "</Reference>"
    tosign_xml+=  "</SignedInfo>"
    tosign_xml+=  "<SignatureValue/>"
    tosign_xml+=  "<KeyInfo>"
    tosign_xml+=   "<KeyValue/>"
    tosign_xml+=   "<X509Data>"
    tosign_xml+=   "</X509Data>"
    tosign_xml+=  "</KeyInfo>"
    tosign_xml+= "</Signature>"

    #Fin Libro  
    tosign_xml+= "</LibroCompraVenta>"

    File.open("libro_compratosing#{libro.rut}#{libro.idenvio}.xml", 'w') { |file| file.puts tosign_xml}

    sleep 1

    system("./comando#{libro.rut} libro_compratosing#{libro.rut}#{libro.idenvio}.xml libro_compra#{libro.rut}#{libro.idenvio}.xml") 


    system("rm libro_compratosing#{libro.rut}#{libro.idenvio}.xml") 
  end  

end
