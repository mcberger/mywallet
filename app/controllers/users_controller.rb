class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@balance = @user.cards.sum(:balance)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Your account was created successfully."
			redirect_to login_path
		else
			flash.now[:alert] = "There was a problem saving your account."
			#redirect_to new_user_path
			render "new"
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "The user was deleted successfully."
		else
			flash[:alert] = "There was a problem deleting this user."
		end
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password, :phone, :avatar)
	end

end
