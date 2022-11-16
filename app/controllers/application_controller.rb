class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  ####
  protect_from_forgery with: :exception

  def check_login
    @current_user ||= session[:account_id] && Account.find(session[:account_id])
  end
end
