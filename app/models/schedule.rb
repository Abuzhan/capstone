class Schedule < ActiveRecord::Base
	
	belongs_to :carwash

	#VALID_DAY_REGEX = /(1|2|3|4|5|6|7)/i
	
	#validates :day, presence: true, format: { with: VALID_DAY_REGEX }, length: { is: 1 }
	#validates :opening_minute, presence: true
	#validates :closing_minute, presence: true
	#validates :opening_hour, presence: true
	#validates :closing_hour, presence: true
	validates :monday, presence: true
	validates :tuesday, presence: true
	validates :wednesday, presence: true
	validates :thursday, presence: true
	validates :friday, presence: true
	validates :saturday, presence: true
	validates :sunday, presence: true
	validates :carwash_id, presence: true
	
end
