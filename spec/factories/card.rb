FactoryGirl.define do
	factory :card do
		cardnumber "4444444444444444"
		cardtype "visa"
		expmonth 12
		expyear 2019
		balance 400.50
	end
end