class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(phone_number: params[:session][:phone_number])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid phone number and password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
