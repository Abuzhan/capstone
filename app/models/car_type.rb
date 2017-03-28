class CarType < ActiveRecord::Base
	has_many :users
	has_many :prices
	has_many :offprices
	has_many :combos
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
