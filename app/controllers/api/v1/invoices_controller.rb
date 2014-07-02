class Api::V1::InvoicesController < Api::V2::ApiController
  before_action :require_authentication
  
  def create

    render 'api/v1/invoices/create'
  end
end  