#encoding utf-8
class ConnectsiiController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'net/https'

  def postsii

    #@token = RestClient.get "localhost:3001/api/v1/pruebas.json"
    #request = RestClient.post "192.168.1.38:3000/api/v1/pruebas.json", { 'rut' => '2-3', 'nombre'=> 'osvaldo' }.to_json, :content_type => :json, :accept => :json
    #@token = get_token 
    @token = "ochqijncqo8em"

    # "https://maullin.sii.cl/cgi_dte/UPL/DTEUpload",
    # "localhost:3001/api/v1/pruebas.json",

    @BOUNDARY = "-----------------9022632e1130lc4--"
 
    uri = URI.parse("https://maullin.sii.cl/cgi_dte/UPL/DTEUpload") 
    http = Net::HTTP.new(uri, 443)
    #http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Post.new(uri.request_uri) 

    request["Accept"]          = "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-powerpoint, application/ms-excel, application/msword, */*"
    request["Referer"]         = "http://www.empresa.cl"
    request["Accept-Language"] = "es-cl"
    request["Content-Type"]    = "multipart/form-data: boundary=#{@BOUNDARY}"
    request["Accept-Encoding"] = "gzip, deflate"
    request["User-Agent"]      = "Mozilla/4.0 (compatible; PROG 1.0; Windows NT 5.0; YComp 5.0.2.4)"
    request["Content-Length"]  = "8653"
    request["Connection"]      = "Keep-Alive"
    request["Cache-Control"]   = "no-cache"
    request["Cookie"]          = "TOKEN=YJyar2VB0HWzg"



    post_body = []

    post_body << "-----------------9022632e1130lc4\r\n"
    post_body << "Content-Disposition: form-data; name=\"rutSender\"\r\n"
    post_body << "Content-Type: text/plain; charset=US-ASCII\r\n"
    post_body << "Content-Transfer-Encoding: 8Bit\r\n"
    post_body << "\r\n"
    post_body << "66000000\r\n"
    post_body << "-----------------9022632e1130lc4\r\n"
    post_body << "Content-Disposition: form-data; name=\"dvSender\"\r\n"
    post_body << "Content-Type: text/plain; charset=US-ASCII\r\n"
    post_body << "Content-Transfer-Encoding: 8Bit\r\n"
    post_body << "\r\n"
    post_body << "0\r\n"
    post_body << "-----------------9022632e1130lc4\r\n"
    post_body << "Content-Disposition: form-data; name=\"rutCompany\"\r\n"
    post_body << "Content-Type: text/plain; charset=US-ASCII\r\n"
    post_body << "Content-Transfer-Encoding: 8Bit\r\n"
    post_body << "\r\n"
    post_body << "77777777\r\n"
    post_body << "-----------------9022632e1130lc4\r\n"
    post_body << "Content-Disposition: form-data; name=\"dvCompany\"\r\n"
    post_body << "Content-Type: text/plain; charset=US-ASCII\r\n"
    post_body << "Content-Transfer-Encoding: 8Bit\r\n"
    post_body << "\r\n"
    post_body << "7\r\n"

    file = "fact1-signed.xml"
        
    post_body << "-----------------9022632e1130lc4\r\n"
    post_body << "Content-Disposition: form-data; name=\"archivo\"; filename=\"d:\ENVFIN_100_sign.xml\"\r\n"
    post_body << "Content-Type: application/octet-stream\r\n"
    post_body << "Content-Transfer-Encoding: binary\r\n"

    post_body << "\r\n"
    post_body << File.read(file)
    post_body << "\r\n"
    post_body << "-----------------9022632e1130lc4--\r\n"
  
    request.body = post_body.join
    
    puts "===================================="
    puts request.body
    puts "===================================="
    puts request
   # http.request(request)


    render 'connectsii/index' 
  end


  def get_token
   
    while !@seed
      @seed= getseed
    end

    if @seed
   
      tosign_xml="<gettoken><item><Semilla>#{@seed}</Semilla></item>"
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
      tosign_xml+="</gettoken>"


      File.open('tosign_xml.xml', 'w') { |file| file.puts tosign_xml}
      sleep 1
     
      system("./comando")
      
      
      doc = File.read 'doc-signed.xml'

      while !@token
        @token= gettoken(doc)
      end
      
   
      if @token
        @token= @token.to_s[@token.to_s.index('TOKEN')+9..@token.to_s.index('TOKEN')+21]
       # render 'connectsii/index' 
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
      client = Savon.client(wsdl:"https://maullin.sii.cl/DTEWS/CrSeed.jws?WSDL") 
      #produccion
      #client = Savon.client(wsdl:"https://palena.sii.cl/DTEWS/CrSeed.jws?WSDL") 
        @seed_xml = client.call( :get_seed , message: {})

        @seed= @seed_xml.to_s[@seed_xml.to_s.index('SEMILLA')+11..@seed_xml.to_s.index('SEMILLA')+22]


    rescue
      puts "=====SEED========"
      puts "Error #{$!}"
      puts "============="
      @seed=nil
    ensure 
    end
  end

  def gettoken(seed_xml)
    begin
      tokenws = Savon.client(wsdl: "https://maullin.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")
      #tokenws = Savon.client(wsdl: "https://palena.sii.cl/DTEWS/GetTokenFromSeed.jws?WSDL")
      @token = tokenws.call( :get_token , message: {string: seed_xml}) 
    rescue
      puts "=====TOKEN========"
      puts "Error #{$!}"
      puts "============="
      @token=nil
    ensure 
    end

  end
end