module CwSessionsHelper
	
	def sign_in(carwash)
		remember_token = Carwash.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		carwash.update_attribute(:remember_token, Carwash.encrypt(remember_token))
		self.current_carwash = carwash
	end

	def signed_in?
		!current_carwash.nil?
	end

	def current_carwash=(carwash)
		@current_carwash = carwash
	end

	def current_carwash
		remember_token = Carwash.encrypt(cookies[:remember_token])
		@current_carwash ||=Carwash.find_by(remember_token: remember_token)
	end

	def current_carwash?(carwash)
		carwash == current_carwash
	end

	def sign_out
		current_carwash.update_attribute(:remember_token, Carwash.encrypt(Carwash.new_remember_token))
		cookies.delete(:remember_token)
		self.current_carwash = nil
	end

	def redirect_back_or(default)
		redirect_to(cw_session[:return_to] || default)
		cw_session.delete(:return_to)
	end

	def store_location
		cw_session[:return_to] = request.url if request.get?
	end
end
