class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id].present?
  end

  def encode(payload)
    JWT.encode(payload, 'testing')
  end

  def decode(token)
    begin
      JWT.decode(token, 'testing', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end
  
end
