class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(email: params[:session][:email]).first
		if @user && @user.password == params[:session][:password]
			session[:user_id] = @user.id
			redirect_to user_path @user 
		else
			puts "WE WENT TO ELSE"
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		@current_user = nil
		redirect_to login_path
	end

end
