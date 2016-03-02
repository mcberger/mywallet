require 'rails_helper'

RSpec.describe Card, :type => :model do
	
	describe "is invalid without a " do
		it "numerical cardnumber" do
			card = build(:card)
			expect(card).to be_valid
		end

		it "numerical expiration year after 2015" do
			card = build(:card)
			expect(card).to be_valid
		end

		it "numerical expiration month between 0 and 13" do
			card = build(:card)
			expect(card).to be_valid
		end
	end
end