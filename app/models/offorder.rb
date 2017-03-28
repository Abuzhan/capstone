class Offorder < ActiveRecord::Base
	#belongs_to :user
	belongs_to :box
	belongs_to :worker
	belongs_to :combo

	has_many :offorderservices

	VALID_CARNUMBER_REGEX = /(\A[a-z]((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}\z)|(\A((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}((1[0-6])|(0[1-9]))\z)/i

	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :combo_id, presence: true
	validates :car_number, presence: true, length: { minimum: 7, maximum: 8}, format: {with: VALID_CARNUMBER_REGEX}
	#validates :user_id, presence: true
	validates :box_id, presence: true
	validates :worker_id, presence: true
	validates :discount, length: {maximum: 6}
	validates :details, length: {maximum: 150}
	validates :price, presence: true, length: { maximum: 6}
end
