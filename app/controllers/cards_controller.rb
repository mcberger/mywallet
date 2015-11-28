class CardsController < ApplicationController

	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
		@user = User.find_by_id(params[:user_id])
	end

	def show
		@card = Card.find(params[:id])
	end

	def remove_card
		card = Card.find(params[:id])
		current_user.cards.delete(card)
		redirect_to user_cards
		# get the user
		# delete card from user's cards
		# redirect
	end

	def add_card
		@card = Card.find(params[:id])
		current_user.cards << @card
		redirect_to user_cards
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@card = Card.new(card_params)
		if @card.save
			@user.cards << @card
			sharee = User.where(email: @card.share_with).first
			sharee.cards << @card
			flash[:notice] = "Your card was added successfully."
			# respond_to do |format|
			# 	format.js do 
			#  	render text: "alert('Your card is saved!')"
			# 		render 'show'
			# 	end
			# end
			redirect_to user_path @user
		else
			flash.now[:alert] = "There was a problem adding your card."
			render "new"
		end
	end

	def destroy
		@card = Card.find(params[:id])
		if @card.users.include?(current_user)
			@card.destroy
			flash[:notice] = "Your card was deleted successfully."
			redirect_to user_path current_user
		else
			flash[:alert] = "There was a problem deleting that card."
			redirect_to user_path current_user
   		end
	end

	private
	def card_params
		params.require(:card).permit(:cardnumber, :expmonth, :expyear, :balance, :share_with)
	end


end