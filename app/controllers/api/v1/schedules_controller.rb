class Api::V1::SchedulesController < Api::V1::BaseController

	respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def show
		@carwash = Carwash.find(params[:id])
		id = @carwash.id
		@boxes = @carwash.boxes#.where("carwash_id = id")
		@orders = @boxes.orders.each
		#t = Time.now
		render :json => {
			:carwash => @carwash.as_json(
				only: [:id, :name],
				include: { 
					boxes: { only: [ :id],
						include: { orders: { only: [:id, :start_time, :end_time]}} },
					schedules: { only: [
						:id, 
						:monday, 
						:tuesday, 
						:wednesday, 
						:thursday, 
						:friday, 
						:saturday, 
						:sunday
					]}
				}
			),
			:newboxes => Api::V1::InfoSerializer.new(@carwash, root: false).as_json,
			#:orders => @orders.as_json
		}
	end

end