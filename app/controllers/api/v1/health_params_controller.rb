class Api::V1::HealthParamsController < Api::V1::BaseController

	respond_to :json

	def create
		health_param = HealthParam.create(create_params)
		#for health_param in params[:health_param] do 
		#	new_health_param = HealthParam.new(create_params)
		#	new_health_param.save
		#end

		render :json => {
					:health_param => @health_param.as_json
		}	
	end

	private

	def create_params
		params.require(:health_param).permit(:temperature, :pulse).delete_if{ |k,v| v.nil?}
	end

end