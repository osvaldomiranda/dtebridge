class Api::V1::IatController < Api::V1::ApiController
  
  def login
    @iat = Iat.find(params[:id])
    @log = Iat_log.new

    if @iat
      @log.iat = @iat
      @log.description = "Login"
      @log.save

      render "api/v1/iat/login"
    else
      render json: 'Ivalid Iat', status: :unauthorized   
    end  
  end

  def ping
    @iat = Iat.find(params[:id])

    if @iat
      @iat.ultimo_ping = Time.now
      @iat.save

      # @log = Iat_log.new
      # @log.iat = @iat
      # @log.description = "ping"
      # @log.save

      render "/api/v1/iat/ping"
    else
      render json: 'Ivalid Iat', status: :unauthorized   
    end
  end

  def iat_doc
    @iat = Iat.find(params[:id])

    @doc = params[:docxml]
    @file = params[:filename]


    File.open(file, "w+") do |f|
      f.write(@doc)
    end

    

    if @iat
      @iat.ultimo_ping = Time.now
      @iat.save

      render "/api/v1/iat/ping"
    else
      render json: 'Ivalid Doc', status: :unauthorized   
    end

  end

end  