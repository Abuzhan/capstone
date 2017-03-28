class Favorite < ActiveRecord::Base

	belongs_to :user
	belongs_to :carwash

	validates :user_id, presence: true
	validates :carwash_id, presence: true
	
end
