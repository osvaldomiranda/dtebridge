class Libro < ActiveRecord::Base
  has_many :detlibro, dependent: :destroy


  def xml(mes, rut)

    #Caratula   
    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<LibroCompraVenta xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte LibroCV_v10.xsd\" version=\"1.0\" xmlns=\"http://www.sii.cl/SiiDte\">"
    tosign_xml+="<EnvioLibro ID=\"ID#{mes}\">"
    tosign_xml+="<Caratula>"
    tosign_xml+="<RutEmisorLibro>#{rut}</RutEmisorLibro>"
    tosign_xml+="<RutEnvia>5682509-6</RutEnvia>"
    tosign_xml+="<PeriodoTributario>#{mes}</PeriodoTributario>"
    tosign_xml+="<FchResol>2014-09-10</FchResol>"
    tosign_xml+="<NroResol>80</NroResol>"
    tosign_xml+="<TipoOperacion>VENTA</TipoOperacion>"
    tosign_xml+="<TipoLibro>ESPECIAL</TipoLibro>"
    tosign_xml+="<TipoEnvio>TOTAL</TipoEnvio>"
    tosign_xml+="<FolioNotificacion>1</FolioNotificacion>"
    tosign_xml+="</Caratula>"

    #Resumen

    documentos =  Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, 
        sum("IVA") as iva, sum("MntTotal") as mnttotal, sum("impuesto_retens"."MontoImp") as otrosimp, 
        count(*) as count').joins('LEFT OUTER JOIN "impuesto_retens" ON 
        "impuesto_retens"."documento_id" = "documentos"."id"')
        .where('"TipoDTE" = 33 and "RUTEmisor"=? and "FchEmis" > ? AND "FchEmis" < ?', 
        rut, desde, hasta ).group('"TipoDTE"')


    tosign_xml+="<ResumenPeriodo>"

    #Documentos electronicos
    documentos.each do | doc|
      tosign_xml+="<TotalesPeriodo>"
      tosign_xml+="<TpoDoc>#{doc.TipoDTE}</TpoDoc>"
      tosign_xml+="<TotDoc>#{doc.count}</TotDoc>"
      tosign_xml+="<TotMntExe>#{doc.mntexe}</TotMntExe>"
      tosign_xml+="<TotMntNeto>#{doc.mntneto}</TotMntNeto>"
      tosign_xml+="<TotMntIVA>#{doc.iva}</TotMntIVA>"
      tosign_xml+="<TotMntTotal>#{doc.mnttotal}</TotMntTotal>"
      tosign_xml+="</TotalesPeriodo>"
    end
    #Documentos Manuales

    tosign_xml+="</ResumenPeriodo>"

    #Detalle
    tosign_xml+="<Detalle>"
    tosign_xml+="<TpoDoc>30</TpoDoc>"
    tosign_xml+="<NroDoc>1000</NroDoc>"
    tosign_xml+="<TasaImp>19</TasaImp>"
    tosign_xml+="<FchDoc>2013-05-10</FchDoc>"
    tosign_xml+="<RUTDoc>77398570-7</RUTDoc>"
    tosign_xml+="<RznSoc>COMERCIAL LUBBA LTDA.</RznSoc>"
    tosign_xml+="<MntExe>0</MntExe>"
    tosign_xml+="<MntNeto>5000</MntNeto>"
    tosign_xml+="<MntIVA>950</MntIVA>"
    tosign_xml+="<OtrosImp>"
    tosign_xml+="<CodImp>27</CodImp>"
    tosign_xml+="<TasaImp>15</TasaImp>"
    tosign_xml+="<MntImp>750</MntImp>"
    tosign_xml+="</OtrosImp>"
    tosign_xml+="<MntTotal>6700</MntTotal>"
    tosign_xml+="</Detalle>"

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

  end

end
