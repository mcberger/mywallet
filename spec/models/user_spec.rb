require 'rails_helper'

RSpec.describe User, :type => :model do
	
	describe "is invalid without a " do
		it "first name" do
			user = build(:user)
			user.fname = nil
			expect(user).to be_invalid
		end

		it "last name" do
			user = build(:user)
			user.lname = nil
			expect(user).to be_invalid
		end

		it "unique email" do
			user = build(:user)
			user2 = User.new(:email=> "test@test.com")
			expect(user2).to be_invalid
		end

		it "password between 4 and 20 characters" do
			user = build(:user)
			expect(user).to be_valid
		end

		it "numerical phone number" do
			user = build(:user)
			expect(user).to be_valid
		end
	end

end