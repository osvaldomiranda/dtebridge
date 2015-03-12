class Libro < ActiveRecord::Base
  has_many :detlibro, dependent: :destroy

  def empresa
      Empresa.find_by_rut(self.rut).rznsocial
  end

  def xml(id)

    #Caratula   
    libro = Libro.find(id)

    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<LibroCompraVenta xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte LibroCV_v10.xsd\" version=\"1.0\" xmlns=\"http://www.sii.cl/SiiDte\">"
    tosign_xml+="<EnvioLibro ID=\"ID#{libro.idenvio}\">"
    tosign_xml+="<Caratula>"
    tosign_xml+="<RutEmisorLibro>#{libro.rut}</RutEmisorLibro>"
    tosign_xml+="<RutEnvia>5682509-6</RutEnvia>"
    tosign_xml+="<PeriodoTributario>#{libro.idenvio}</PeriodoTributario>"
    tosign_xml+="<FchResol>2014-09-10</FchResol>"
    tosign_xml+="<NroResol>80</NroResol>"
    tosign_xml+="<TipoOperacion>VENTA</TipoOperacion>"
    tosign_xml+="<TipoLibro>ESPECIAL</TipoLibro>"
    tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>"
    tosign_xml+="<FolioNotificacion>1</FolioNotificacion>"
    tosign_xml+="</Caratula>"

    #Resumen

    tipos = Tipodte.all


    tosign_xml+="<ResumenPeriodo>"

    #Documentos electronicos
    tipos.each do | t |

      cantidad = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
      mntexe = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
      mntneto = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto)
      iva = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto) 
      mnttotal = libro.detlibro.where(tipodte: t.tipo).sum(:mntneto) 

      if cantidad > 0 
        tosign_xml+="<TotalesPeriodo>"
        tosign_xml+="<TpoDoc>#{t.tipo}</TpoDoc>"
        tosign_xml+="<TotDoc>#{cantidad}</TotDoc>"
        tosign_xml+="<TotMntExe>#{mntexe}</TotMntExe>"
        tosign_xml+="<TotMntNeto>#{mntneto}</TotMntNeto>"
        tosign_xml+="<TotMntIVA>#{iva}</TotMntIVA>"
        tosign_xml+="<TotMntTotal>#{mnttotal}</TotMntTotal>"
        tosign_xml+="</TotalesPeriodo>"
      end
    end
    #Documentos Manuales

    tiposmanuales = Tipodte.where(manual: "S")

    tosign_xml+="</ResumenPeriodo>"

    tiposmanuales.each do |t|
      #Detalle
      detlibro = libro.detlibro.where(tipodte: t.tipo)

      detlibro.eacch do |det| 

        doc = Docmanual.where(folio: det.folio).where(rutemisor: det.rutemis).first
        tosign_xml+="<Detalle>"
        tosign_xml+="<TpoDoc>#{doc.tipodte}</TpoDoc>"
        tosign_xml+="<NroDoc>#{doc.folio}</NroDoc>"
        tosign_xml+="<TasaImp>19</TasaImp>"
        tosign_xml+="<FchDoc>#{doc.fchemis}</FchDoc>"
        tosign_xml+="<RUTDoc>#{doc.rutemisor}</RUTDoc>"
        tosign_xml+="<RznSoc>#{doc.rznsocrecep}</RznSoc>"
        tosign_xml+="<MntExe>#{doc.mntexe}</MntExe>"
        tosign_xml+="<MntNeto>#{doc.mntneto}</MntNeto>"
        tosign_xml+="<MntIVA>#{doc.iva}</MntIVA>"
        if doc.impto18 > 0
          tosign_xml+="<OtrosImp>"
          tosign_xml+="<CodImp>27</CodImp>"
          tosign_xml+="<TasaImp>18</TasaImp>"
          tosign_xml+="<MntImp>#{doc.impto18}</MntImp>"
          tosign_xml+="</OtrosImp>"
        end
        if doc.impto10 > 0
          tosign_xml+="<OtrosImp>"
          tosign_xml+="<CodImp>27</CodImp>"
          tosign_xml+="<TasaImp>10</TasaImp>"
          tosign_xml+="<MntImp>#{doc.impto10}</MntImp>"
          tosign_xml+="</OtrosImp>"
        end
        if doc.impto25 > 0
          tosign_xml+="<OtrosImp>"
          tosign_xml+="<CodImp>27</CodImp>"
          tosign_xml+="<TasaImp>25</TasaImp>"
          tosign_xml+="<MntImp>#{doc.impto25}</MntImp>"
          tosign_xml+="</OtrosImp>"
        end
        if doc.impto30 > 0
          tosign_xml+="<OtrosImp>"
          tosign_xml+="<CodImp>27</CodImp>"
          tosign_xml+="<TasaImp>30</TasaImp>"
          tosign_xml+="<MntImp>#{doc.impto30}</MntImp>"
          tosign_xml+="</OtrosImp>"
        end
        tosign_xml+="<MntTotal>#{doc.mnttotal}</MntTotal>"
        tosign_xml+="</Detalle>"
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
    tosign_xml+=    "<X509SubjectName/>"
    tosign_xml+=    "<X509IssuerSerial/>"
    tosign_xml+=    "<X509Certificate/>"
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
