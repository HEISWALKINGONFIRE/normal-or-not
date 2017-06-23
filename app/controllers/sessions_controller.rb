class SessionsController < ApplicationController
  def new
  end
  def create
  	puts params[:email]
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
  		redirect_to root_url
      flash[:success] = "Welcome back!"
  	else
  		redirect_to login_url
      flash[:danger] = "Incorrect Email or Password, please try again."
  	end

  end
  def destroy
  	session[:user_id] = nil
    # flash[:info] = "Logout successful, till next time."
  	redirect_to '/'
  end
end
