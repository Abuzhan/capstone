class Api::V1::SessionsController < Api::V1::BaseController
	include ActiveHashRelation
	
	def index
		@cities = City.all
		@car_types = CarType.all

		#cities = apply_filters(cities, params)
		#car_types = apply_filters(car_types, params)

		render :json => {:cities => @cities.as_json(:only => [:id, :name]),#root: true each_serializer: Api::V1::CitySerializer,
						 :car_types => @car_types.as_json(:only => [:id, :name])#,
						}


	end


	def create
		user = User.find_by(phone_number: create_params[:phone_number])
		@cities = City.all
		@car_types = CarType.all
		if user && user.authenticate(create_params[:password])
			self.current_user = user
			
			#current_city = user.city
			#response = Api::V1::SessionSerializer.new(user, root: false).to_json
			#response.attributes.merge(Api::V1::CitySerializer.new(user.city, root: false).to_json)
			#render json: response


			render status: 201, :json => {:cities => @cities.as_json(:only => [:id, :name]),#root: true each_serializer: Api::V1::CitySerializer,
						 :car_types => @car_types.as_json(:only => [:id, :name]),
						 :user => Api::V1::SessionSerializer.new(user, root: false).as_json
						}

			#render(
			#	:json => Api::V1::SessionSerializer.new(user, root: false).to_json, 
			#	#json: Api::V1::CitySerializer.new(user.city, root: false).to_json,
			#	status: 201
			#	)
		else
			return api_error(status: 401)
		end
	end

	private
	
	def create_params
		params.require(:user).permit(:phone_number, :password)
	end
	end
