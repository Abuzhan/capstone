class Service < ActiveRecord::Base
	has_many :prices
	#has_many :order_services
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
