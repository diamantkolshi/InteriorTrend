class ApiController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActionController::RoutingError, with: :record_not_found
  respond_to :json
  before_action :set_default_response_format

  protected

  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
  end

  private

  def set_default_response_format
    request.format = :json
  end

end