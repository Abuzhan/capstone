class CwSessionsController < ApplicationController

	def new
	end

	def create
		carwash = Carwash.find_by(phone_number: params[:cw_session][:phone_number])
		if carwash && carwash.authenticate(params[:cw_session][:password])
			sign_in carwash
			redirect_back_or carwash
		else
			flash.now[:error] = 'Invalid combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to_root_url
	end

end
