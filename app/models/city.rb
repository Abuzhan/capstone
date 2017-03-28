class City < ActiveRecord::Base
	has_many :users
	has_many :carwashes
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
