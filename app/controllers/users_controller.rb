class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		# if @user.username == ""
		# 	render "new"
		# 	flash[:warning] = "please add a username!"
		# elsif @user.email == ""
		# 	render "new"
		# 	flash[:warning] = "please add an email address!"
		# elsif @user.password == ""
		# 	render "new"
		# 	flash[:warning] = "please add a password!"
		# elsif @user.save != false
		# 	render "new"
		# 	flash[:warning] = "!!"
		if @user.save == false
		redirect_to new_user_path
		flash[:warning] = "invalid username or email, please try again."
		else
			@user.save
			redirect_to login_url
			flash[:success] = "Now login!"
		end
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
