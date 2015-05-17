class ApplicationController < ActionController::API
  include ActionController::Serialization
  before_action :ensure_json_request

  private

  # Forbids non-json requests
  def ensure_json_request
    return if params[:format] == 'json' || request.headers['Accept'] =~ /json/
    render nothing: true, status: :not_acceptable
  end
end
