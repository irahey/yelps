class SessionsController < ApplicationController
  def new
  end


  def create
      #user = User.find_by(username: params[:session][:username])
      user = User.where(:username => params[:session][:username]).first
      if user.nil? 
        redirect_to root_url, notice: "Wrong Username or Password."
      else
        user.authenticate(params[:session][:password_digest])
        #login_path user
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
