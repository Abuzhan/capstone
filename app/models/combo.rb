class Combo < ActiveRecord::Base
	belongs_to :car_type
	belongs_to :carwash

	has_many :offorders

	validates :name, presence: true, length: { maximum: 50 }
	validates :price, presence: true, length: { maximum: 6 }
	validates :carwash_id, presence: true
	#validates :service_id, presence: true
	validates :car_type_id, presence: true
	validates :description, length: { maximum: 150 }
end
