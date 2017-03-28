class Price < ActiveRecord::Base
	
	belongs_to :car_type
	belongs_to :service
	belongs_to :carwash

	has_many :orders

	validates :price, presence: true, length: { maximum: 6 }
	validates :carwash_id, presence: true
	validates :service_id, presence: true
	validates :car_type_id, presence: true
	validates :description, length: { maximum: 150 }


end
