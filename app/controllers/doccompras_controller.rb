# encoding: ISO-8859-1
class DoccomprasController < ApplicationController
  before_action :set_doccompra, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    searchparams = params["/doccompras"]
    if searchparams.present?
      if searchparams[:search] != ""
        @search = Doccompra.search do
          fulltext searchparams[:search]
          order_by(:created_at, :desc)
          paginate :page => 1, :per_page => 500
        end
       # @doccompras = @search.results
        @doccompras = Doccompra.where(:RUTRecep => Usuarioempresa.where(useremail:current_user.email).map {|u| u.rutempresa}).where(id: @search.results.map(&:id)).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
      else
        @doccompras = Doccompra.where(:RUTRecep => Usuarioempresa.where(useremail:current_user.email).map {|u| u.rutempresa}).where(estado: nil).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
      end  
    else  
      @doccompras = Doccompra.where(:RUTRecep => Usuarioempresa.where(useremail:current_user.email).map {|u| u.rutempresa}).where(estado: nil).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
    end
  end


  def rechazar
    d = Doccompra.find(params[:id])
    d.estado = "RECHAZADO"
    d.save

    # xml rechazo
    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<RespuestaDTE xmlns=\"http://www.sii.cl/SiiDte\" xmlns:ds=\"http://www.w3.org/2000/09/xmldsig\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" version=\"1.0\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte RespuestaEnvioDTE_v10.xsd\">"
    tosign_xml+="  <Resultado ID=\"ResultadoDTE\">"
    tosign_xml+="    <Caratula version=\"1.0\">"
    tosign_xml+="      <RutResponde>#{d.RUTRecep}</RutResponde>"
    tosign_xml+="     <RutRecibe>#{d.RUTEmisor}</RutRecibe>"
    tosign_xml+="      <IdRespuesta>1</IdRespuesta>"
    tosign_xml+="      <NroDetalles>2</NroDetalles>"
    tosign_xml+="      <TmstFirmaResp>2014-11-27T00:00:00</TmstFirmaResp>"
    tosign_xml+="    </Caratula>"
    tosign_xml+="    <ResultadoDTE>"
    tosign_xml+="      <TipoDTE>#{d.TipoDTE}</TipoDTE>"
    tosign_xml+="      <Folio>#{d.Folio}</Folio>"
    tosign_xml+="      <FchEmis>#{d.FchEmis}</FchEmis>"
    tosign_xml+="      <RUTEmisor>#{d.RUTEmisor}</RUTEmisor>"
    tosign_xml+="      <RUTRecep>#{d.RUTRecep}</RUTRecep>"
    tosign_xml+="      <MntTotal>#{d.MntTotal}</MntTotal>"
    tosign_xml+="      <CodEnvio>339734</CodEnvio>"
    tosign_xml+="      <EstadoDTE>3</EstadoDTE>"
    tosign_xml+="      <RecepDTEGlosa>DTE No Recibido - Error</RecepDTEGlosa>"
    tosign_xml+="   </ResultadoDTE>"
    tosign_xml+="  </Resultado>"
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
    tosign_xml+="</RespuestaDTE>"
   

    t = Time.now.strftime("%Y%d%m%H%M%S")

    File.open("inter_tosign_xml#{t}.xml", 'w') { |file| file.puts tosign_xml}
    sleep 1
     
    system("./comando#{d.RUTRecep} inter_tosign_xml#{t}.xml inter_doc-signed#{t}.xml")

    doc = File.read "inter_doc-signed#{t}.xml"

    #enviar doc por mail
    # begin
      NotificationMailer.send_intercambio("jimenezmaury@gmail.com", d.id, d.RUTRecep, "inter_doc-signed#{t}.xml" ).deliver
    # rescue
    # end

    system("rm inter_tosign_xml#{t}.xml") 
    system("rm inter_doc-signed#{t}.xml")

    @doccompras = Doccompra.where(estado: nil).where(:RUTRecep => Usuarioempresa.where(useremail:current_user.email).map {|u| u.rutempresa}).paginate(:page => params[:page], :per_page => 15 )
    respond_to do |format|
        format.html { render action: 'index'}
    end    
  end

  def aprobar
    d = Doccompra.find(params[:id])
    d.estado = "APROBADO"
    d.save

    # xml Aceptado
    tosign_xml="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"
    tosign_xml+="<RespuestaDTE xmlns=\"http://www.sii.cl/SiiDte\" xmlns:ds=\"http://www.w3.org/2000/09/xmldsig\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" version=\"1.0\" xsi:schemaLocation=\"http://www.sii.cl/SiiDte RespuestaEnvioDTE_v10.xsd\">"
    tosign_xml+="  <Resultado ID=\"ResultadoDTE\">"
    tosign_xml+="    <Caratula version=\"1.0\">"
    tosign_xml+="      <RutResponde>#{d.RUTRecep}</RutResponde>"
    tosign_xml+="     <RutRecibe>#{d.RUTEmisor}</RutRecibe>"
    tosign_xml+="      <IdRespuesta>1</IdRespuesta>"
    tosign_xml+="      <TmstFirmaResp>2014-11-27T00:00:00</TmstFirmaResp>"
    tosign_xml+="    </Caratula>"
    tosign_xml+="    <ResultadoDTE>"
    tosign_xml+="      <TipoDTE>#{d.TipoDTE}</TipoDTE>"
    tosign_xml+="      <Folio>#{d.Folio}</Folio>"
    tosign_xml+="      <FchEmis>#{d.FchEmis}</FchEmis>"
    tosign_xml+="      <RUTEmisor>#{d.RUTEmisor}</RUTEmisor>"
    tosign_xml+="      <RUTRecep>#{d.RUTRecep}</RUTRecep>"
    tosign_xml+="      <MntTotal>#{d.MntTotal}</MntTotal>"
    tosign_xml+="      <CodEnvio>339734</CodEnvio>"
    tosign_xml+="      <EstadoDTE>0</EstadoDTE>"
    tosign_xml+="      <RecepDTEGlosa>DTE Aceptado OK</RecepDTEGlosa>"
    tosign_xml+="   </ResultadoDTE>"
    tosign_xml+="  </Resultado>"
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
    tosign_xml+="</RespuestaDTE>"


    t = Time.now.strftime("%Y%d%m%H%M%S")

    File.open("inter_tosign_xml#{t}.xml", 'w') { |file| file.puts tosign_xml}
    sleep 1
     
    system("./comando#{d.RUTRecep} inter_tosign_xml#{t}.xml inter_doc-signed#{t}.xml")

    #enviar doc por mail
    # begin
      NotificationMailer.send_intercambio("jimenezmaury@gmail.com", d.id, d.RUTRecep, "inter_doc-signed#{t}.xml" ).deliver
    # rescue
    # end  
    system("rm inter_tosign_xml#{t}.xml") 
    system("rm inter_doc-signed#{t}.xml")

    @doccompras = Doccompra.where(estado: nil).where(:RUTRecep => Usuarioempresa.where(useremail:current_user.email).map {|u| u.rutempresa}).paginate(:page => params[:page], :per_page => 15 )
    respond_to do |format|
        format.html { render action: 'index'}
    end  
  end  

  def sendxml
    doccompra = Doccompra.find(params[:id])
    send_data doccompra.xmlrecibido.force_encoding('iso-8859-1') , :filename => "xml#{doccompra.Folio}.xml"
  end  

  private
    def set_doccompra
      @doccompra = Doccompra.find(params[:id])
    end

    def doccompra_params
      params.require(:doccompra).permit(:TipoDTE, :Folio, :FchEmis, :IndNoRebaja, :TipoDespacho, :IndTraslado, :TpoImpresion, :IndServicio, :MntBruto, :FmaPago, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :CdgTraslado, :FolioAut, :FchAut, :Sucursal, :CdgSIISucur, :CodAdicSucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :IdAdicEmisor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :IdAdicRecep, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :Patente, :RUTTrans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :CodModVenta, :CodClauVenta, :TotClauVenta, :CodViaTransp, :NombreTransp, :RUTCiaTransp, :NomCiaTransp, :IdAdicTransp, :Booking, :Operador, :CodPtoEmbarque, :IdAdicPtoEmb, :CodPtoDesemb, :IdAdicPtoDesemb, :Tara, :CodUnidMedTara, :PesoBruto, :CodUnidPesoBruto, :PesoNeto, :CodUnidPesoNeto, :TotItems, :TotBultos, :TpoMoneda, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :IVANoRet, :CredEC, :GrntDep, :ValComNeto, :ValComExe, :ValComIVA, :MntTotal, :MontoNF, :xmlrecibido, :estado)
    end
end
