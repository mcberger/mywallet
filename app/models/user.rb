class User < ActiveRecord::Base
	has_many :cards, through: :user_shared_cards
	has_many :user_shared_cards

	validates_presence_of :fname
	validates_presence_of :lname

	validates :email, uniqueness: true
	validates :password, length: { in: 4..20 }
	validates :phone, numericality: true 

	has_attached_file :avatar, 
	:styles => { :medium => "200x200", :thumb => "100x100" },
	:default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :avatar,
	:content_type => /\Aimage\/.*\Z/

end
