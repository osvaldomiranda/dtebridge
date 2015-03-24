class Libro < ActiveRecord::Base
  has_many :detlibro, dependent: :destroy

  def empresa
      Empresa.find_by_rut(self.rut).rznsocial
  end

  def xml

    #Caratula   
    libro = self

    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<LibroCompraVenta xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte LibroCV_v10.xsd\" version=\"1.0\" xmlns=\"http://www.sii.cl/SiiDte\">"
    tosign_xml+="<EnvioLibro ID=\"ID#{libro.idenvio}\">"
    tosign_xml+="<Caratula>"
    tosign_xml+="<RutEmisorLibro>#{libro.rut}</RutEmisorLibro>"
    tosign_xml+="<RutEnvia>5682509-6</RutEnvia>"
    tosign_xml+="<PeriodoTributario>#{libro.idenvio}</PeriodoTributario>"
    tosign_xml+="<FchResol>2014-09-10</FchResol>"
    tosign_xml+="<NroResol>0</NroResol>"
    tosign_xml+="<TipoOperacion>VENTA</TipoOperacion>"
    tosign_xml+="<TipoLibro>ESPECIAL</TipoLibro>"
    tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>"
    # tosign_xml+="<FolioNotificacion>1</FolioNotificacion>" 
    # FolioNotificacion es para hacer una rectificación
    tosign_xml+="</Caratula>"

    #Resumen
    tipos = Tipodte.all

    tosign_xml+="<ResumenPeriodo>\r\n"

    #Documentos electronicos
    tipos.each do | t |

      cantidad = libro.detlibro.where(tipodte: t.tipo).count
      if t.tipo == 35
        cantidad = 40025 
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

        doc = Docmanual.where(folio: det.folio).where(rutemisor: det.rutemis).first
        tosign_xml+="<Detalle>\r\n"
        tosign_xml+="<TpoDoc>#{doc.tipodoc}</TpoDoc>\r\n"
        tosign_xml+="<NroDoc>#{doc.folio}</NroDoc>\r\n"
        if doc.anulado == "S"
          tosign_xml+="<Anulado>A</Anulado>\r\n"
        end

        if doc.anulado == "N"
          tosign_xml+="<TasaImp>19</TasaImp>\r\n"
          tosign_xml+="<FchDoc>#{doc.fchemis}</FchDoc>\r\n"
          tosign_xml+="<RUTDoc>#{doc.rutemisor}</RUTDoc>\r\n"
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
    #Fin EnvioLibro
    tosign_xml+="<TmstFirma>2015-01-20T16:35:14</TmstFirma>"
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

    File.open("libro_ventatosing#{libro.idenvio}.xml", 'w') { |file| file.puts tosign_xml}

    sleep 1
     
    system("./comando libro_ventatosing#{libro.idenvio}.xml libro_venta#{libro.idenvio}.xml")
      
   # lib = File.read "doc-signed#{t}.xml"

    system("rm libro_ventatosing#{libro.idenvio}.xml") 
   
  end

end
