class Offprice < ActiveRecord::Base
	belongs_to :car_type
	belongs_to :offservice
	belongs_to :carwash

	has_many :offorderservices

	validates :price, presence: true, length: { maximum: 6 }
	validates :carwash_id, presence: true
	validates :offservice_id, presence: true
	validates :car_type_id, presence: true
	validates :description, length: { maximum: 150 }
end
