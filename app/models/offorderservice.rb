class Offorderservice < ActiveRecord::Base
	belongs_to :offprices
	belongs_to :offorders

	validates :offorder_id, presence: true
	validates :offprice_id, presence: true
end
