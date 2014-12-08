class Api::V1::ApiController < ApplicationController
  skip_before_action :require_login
  
 # protect_from_forgery with: :null_session
  # Includes helpers in controller

end