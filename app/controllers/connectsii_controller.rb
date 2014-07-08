class ConnectsiiController < ApplicationController
  require 'signed_xml'

  def get_token
   
    @seed= getseed

    tosign_xml="<gettoken><item><Semilla>#{@seed}</Semilla></item><Signature xmlns=\"http://www.w3.org/2000/09/xmldsig#\"><SignedInfo><CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"/><SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"/><Reference URI=""><Transforms><Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"/> </Transforms><DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"/> <DigestValue/> </Reference></SignedInfo><SignatureValue/><KeyInfo><KeyValue/><X509Data ><X509SubjectName/><X509IssuerSerial/><X509Certificate/></X509Data></KeyInfo></Signature></gettoken>"
 
    # Signing
    doc = SignedXml::Document(tosign_xml)
    private_key = OpenSSL::PKey::RSA.new(File.new 'privateKey.pem')
    certificate = OpenSSL::X509::Certificate.new(File.read 'publicCert.pem')

    sleep 13
    puts 'admsoft'
    

    doc.sign(private_key, certificate)

    #File.open('signed_doc.xml', 'w') { |file| file.puts doc.to_xml }

    @token= gettoken(doc.to_xml)

    render 'connectsii/index'
  end

  def getseed
   # client = Savon.client(wsdl:"https://maullin.sii.cl/DTEWS/CrSeed.jws?WSDL")

    #produccion
    client = Savon.client(wsdl:"https://palena.sii.cl/DTEWS/CrSeed.jws?WSDL") 
    @seed_xml = client.call( :get_seed , message: {})
    @seed= @seed_xml.to_s[@seed_xml.to_s.index('SEMILLA')+11..@seed_xml.to_s.index('SEMILLA')+22]

  end

  def gettoken(seed_xml)
    #tokenws = Savon.client(wsdl: "https://maullin.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")
    tokenws = Savon.client(wsdl: "https://palena.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")

    @token = tokenws.call( :get_token , message: {string: seed_xml}) 
  end
end