require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

	let(:valid_session) {{user_id: 1}}


	describe "GET index" do
		it "assigns all cards as @cards" do
			user = create(:user)
			card = create(:card)
			get :index, {:user_id => 1}
			expect(assigns(:cards)).to eq([card])
		end
	end

	describe "GET show" do
		it "assigns the requested card as @card" do
			card = create(:card)
			user = create(:user)
			get :show, {:user_id => 1, id: 1}, valid_session
			expect(assigns(:card)).to eq(card)
		end
	end

	describe "GET new" do
		it "assigns a new card as @card" do
			get :new, {:user_id => 1}
			expect(assigns(:card)).to be_an_instance_of(Card)
		end
	end

	describe "POST create" do
		it "check that @card is assigned" do
			post :create, {:user_id => 1, card: attributes_for(:card)}
			expect(assigns(:card)).to be_an_instance_of(Card)
		end

		it "check that @card is saved to db" do
			post :create, {:user_id => 1, card: attributes_for(:card)}
			expect(Card.all.count).to eq(1)
		end

		it "check that page is redirected to user's profile" do
			post :create, {:user_id => 1, card: attributes_for(:card)}
			expect(response).to redirect_to user_path
		end

	end

# the tests below will fail without a doubt because rspec does not know what current_user is.

	describe "DELETE destroy" do
		it "destroys the requested card" do
			card = create(:card)
			user = create(:user)
			delete :destroy, {:user_id => 1, id: 1}
			expect(Card.all).to eq([])
		end

		it "redirects to the card owner's profile" do
			card = create(:card)
			user = create(:user)
			delete :destroy, {user_id: 1, id: 1}
			expect(response).to redirect_to users_path 
		end
	end

end