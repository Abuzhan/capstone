class Worker < ActiveRecord::Base

	belongs_to :carwash

	has_many :orders
	has_many :offorders

	validates :name, presence: true, length: { maximum: 50 }
	validates :fixed_salary, presence: true
	validates :percentage, presence: true
	validates :carwash_id, presence: true
	
end
