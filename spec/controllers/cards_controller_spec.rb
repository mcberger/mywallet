require 'rails_helper'

RSpec.describe CardsController, :type => :controller do


	describe "GET index" do
		it "assigns all cards as @cards" do
			card = create(:card)
			user = create(:user)
			get :index, {user_id: 1}
			expect(assigns(:cards)).to eq([card])
		end
	end


end