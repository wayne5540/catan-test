class ApplicationController < ActionController::API
  include ActionController::Serialization

  private

  def error!(code, msg, status)
    render json: {
      code: code,
      msg: msg
    }, status: status
  end
end
