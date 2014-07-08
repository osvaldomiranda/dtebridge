class Api::V1::IatController < Api::V2::ApiController
  
  def login
    @iat = Iat.find(params[:id])
    if @iat
      render "api/v1/iat/login"
    else
      render json: 'Ivalid Iat', status: :unauthorized   
    end  
  end

  def ping
    @iat = Iat.find(params[:id])

    if @iat
      @iat.lastping = Time.now
      @iat.save
      render "api/v1/iat/ping"
    else
      render json: 'Ivalid Iat', status: :unauthorized   
    end
  end
end  