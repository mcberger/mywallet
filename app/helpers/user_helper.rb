module UserHelper

	def user_link user
		link_text = if user == current_user
						'you'
					else
						"#{user.fname} #{user.lname}"
					end
		link_to link_text, user_path(user)
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end

	def link_shared_info
		@cards = Card.all
		@cards.each do |card|
			User.where(email: card.share_with)
		end
	end

end