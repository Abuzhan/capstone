class Carwash < ActiveRecord::Base
	#before_save { self.email = email.downcase }
	#before_save { self.car_number = car_number.upcase }
	#before_create :generate_authentication_token
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	#validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	#CITIES = ['Astana', 'Almaty']

	belongs_to :city
	#belongs_to :user
	
	has_many :boxes
	has_many :schedules
	has_many :prices
	has_many :workers
	has_many :offprices
	has_many :combos
	has_many :favorites, foreign_key: "carwash_id", dependent: :destroy
	has_many :favoring_users, through: :favorites, source: :user
	
	before_create :create_remember_token
	has_secure_password
	VALID_PHONE_REGEX = /7(0|1|2|4|5|6|7)(0|1|2|3|4|5|6|7|8)\d{7}/i

	validates :city_id, presence: true
	validates :name, presence: true, length: { maximum: 50 }#, uniqueness: true
	validates :password, length: { minimum: 6 }
	validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}, length: { is: 10}, uniqueness: true
	validates :contacts, length: { maximum: 150 }
	validates :address, presence: true, length: { maximum: 100 }

	#rails_admin do 
	#	configure :favorites do
	#		visible(false)
	#	end

		#configure :carwashes do
		#	visible(true)
		#send
	#end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end