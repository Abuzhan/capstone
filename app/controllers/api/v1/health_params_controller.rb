class Api::V1::HealthParamsController < Api::V1::BaseController

	respond_to :json


	def create
		#health_param = HealthParam.create(create_params)
		#for health_param in params[:health_param] do 
		#	new_health_param = HealthParam.new(create_params)
		#	new_health_param.save
		#end

		#render :json => {
		#			:health_param => health_param.as_json
		#}

		#status = "OKAY"

		#create_params[:health_param].each do |attributes|
		#	param = HealthParam.new
		#	param.temperature = attributes.temperature
		#	param.pulse = attributes.pulse
		#	@params << param
		#end
		#@params.each do |param|
		#	param.save
		#end
		#render json: status.as_json

		#health_params = []
		save_succeeded = true
		#params[:health_param].each do |record|
		#	hp = HealthParam.new(healthparam_params(record))
		#	save_succeeded = false unless hp.save
		#	@health_params << hp
		#end

		#if save_succeeded
		#	render :json =>{
		#		:save_succeeded => save_succeeded.as_json
		#	}
		#	#format.json{ render :json => @health_param.to_json ,status: 200 }
		#else
		#	format.json { render json: @health_param.errors, status: 404 }
		#end
		number = 1
		for i in 1..10

			health_param = HealthParam.new(create_params(number))
			health_param.save
			number +=1
		end
		render :json =>{
				:save_succeeded => save_succeeded.as_json
			}



	end

	def healthparam_params(record)
		record.require(:health_param).permit(:temperature, :pulse)
	end

	private

	def create_params(number)
		string = "health_param" + number.to_s
		params.require(string).permit(:temperature, :pulse, :time)#.delete_if{ |k,v| v.nil?}
	end

end