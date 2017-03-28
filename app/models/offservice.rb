class Offservice < ActiveRecord::Base
	has_many :offprices
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
