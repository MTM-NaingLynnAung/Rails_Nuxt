class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id].present?
  end
  
end
