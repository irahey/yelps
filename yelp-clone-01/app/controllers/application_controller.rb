class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def hello
    render text: "¡Hola, mundo!"
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url, notice: "Please log in."
    end
  end

  
  private
 
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
   
  helper_method :current_user
end


