class CitiesController < ApplicationController
  	def index
    	@cities = City.paginate(page: params[:page])
  	end
end