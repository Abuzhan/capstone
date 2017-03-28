class Api::V1::FavoritesController < Api::V1::BaseController

    respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def index
		@user = User.find(params[:id])
		authorize @user
		#user = User.find(authentication_token: token)
		#@favorites = user.favorite_carwashes
		#render :json => {
		#	:favorites => @favorites.as_json(only: [:id, :name])}
		
		#favorites = Api::V1::FavoriteSerializer.new(@user)
		#response = JSON[favorites.sort_by{ |e| e['city_id'].to_i }]
		#render :json => {
		#	:carwash => response
		#}
		render(
			json: Api::V1::FavoriteSerializer.new(@user).to_json,
			status: 200
		)
	end
end