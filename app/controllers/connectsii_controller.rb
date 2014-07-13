class ConnectsiiController < ApplicationController
  require 'signed_xml'

  def get_token
   
    @seed= getseed
    if @seed
      tosign_xml="<gettoken><item><Semilla>#{@seed}</Semilla></item><Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><SignedInfo><CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/><SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/><Reference URI=""><Transforms><Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/> </Transforms><DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/> <DigestValue/> </Reference></SignedInfo><SignatureValue/><KeyInfo><KeyValue/><X509Data ><X509SubjectName/><X509IssuerSerial/><X509Certificate/></X509Data></KeyInfo></Signature></gettoken>"
   
      # Signing
      doc = SignedXml::Document(tosign_xml)
      private_key = OpenSSL::PKey::RSA.new(File.new 'privateKey.pem')
      certificate = OpenSSL::X509::Certificate.new(File.read 'publicCert.pem')

      doc.sign(private_key, certificate)

      #admsoftware
      #File.open('signed_doc.xml', 'w') { |file| file.puts doc.to_xml }

      @token= gettoken(doc.to_xml)

      if @token
        render 'connectsii/index' 
      else
        render 'connectsii/error' 
      end 
    else
      render 'connectsii/error'    
    end

  end

  def getseed
    begin
      # ambiente sii pruebas 
      # client = Savon.client(wsdl:"https://maullin.sii.cl/DTEWS/CrSeed.jws?WSDL")  
      #produccion
      client = Savon.client(wsdl:"https://palena.sii.cl/DTEWS/CrSeed.jws?WSDL") 
      @seed_xml = client.call( :get_seed , message: {})
      @seed= @seed_xml.to_s[@seed_xml.to_s.index('SEMILLA')+11..@seed_xml.to_s.index('SEMILLA')+22]
    rescue
      puts "============="
      puts "Error #{$!}"
      puts "============="
      @seed=nil
    ensure 
    end
  end

  def gettoken(seed_xml)
    begin
      #tokenws = Savon.client(wsdl: "https://maullin.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")
      tokenws = Savon.client(wsdl: "https://palena.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")
      @token = tokenws.call( :get_token , message: {string: seed_xml}) 
    rescue
      puts "============="
      puts "Error #{$!}"
      puts "============="
      @token=nil
    ensure 
    end

  end
end