class CarwashesController < ApplicationController
  before_action :signed_in_carwash, only: [:index, :edit, :update, :destroy]
  before_action :correct_carwash,   only: [:edit, :update]
  before_action :admin_carwash,     only: :destroy

  def index
    @carwashes = Carwash.paginate(page: params[:page])
  end

  def new
  	@carwash = Carwash.new
  end

  def show
  	@carwash = Carwash.find(params[:id])
  end

  def create
  	@carwash = Carwash.new(carwash_params)
  	if @carwash.save
  		sign_in @carwash
  		flash[:success] = "Welcome to our Application!"
  		redirect_to @carwash
  	else
  		render 'new'
  	end
  end

  def destroy
    Carwash.find(params[:id]).destroy
    flash[:success] = "Carwash was deleted."
    redirect_to carwashes_url
  end

  def edit

  end

  def update
    if @carwash.update_attributes(carwash_params)
      flash[:success] = "Profile updated"
      redirect_to @carwash
    else
      render 'edit'
    end
  end

  private

  	def carwash_params
  		params.require(:carwash).permit(:name, :phone_number, :address, :city_id, :contacts, :password, :password_confirmation)
  	end
#Before filters

    def signed_in_carwash
      unless signed_in?
        store_location
        redirect_to carwashin_url, notice: "Please sign in."
      end
    end

    def correct_carwash
      @carwash = Carwash.find(params[:id])
      redirect_to(root_url) unless current_carwash?(@carwash)
    end

    def admin_carwash
      redirect_to(root_url) unless current_carwash.admin?
    end
end

