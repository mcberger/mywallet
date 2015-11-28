class Card < ActiveRecord::Base
	has_many :users, through: :user_shared_cards
	has_many :user_shared_cards

	before_save :set_cardtype

	validates :cardnumber, numericality: true, length: {in: 12..20}
	validates :expyear, numericality: {:greater_than_or_equal_to => 2015}
	validates :expmonth, numericality: {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 12}


	def set_cardtype
		@number = cardnumber
		length = @number.size
		self.cardtype =	if length == 15 && @number =~ /^(34|37)/
							"AMEX"
						elsif length == 16 && @number =~ /^6011/
							"Discover"
						elsif length == 16 && @number =~ /^5[1 - 5]/
							"Mastercard"
						elsif (length == 13 || length == 16) && @number =~ /^4/
							"Visa"
						else
							"Unknown"
						end
	end


end
