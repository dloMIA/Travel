class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  	before_action :correct_user,   only: [:edit, :update]
	
		
	def new
		@user = User.new
	end
	
	def show
		@user = User.find(params[:id])
		@trips = Trip.all
	end
	
	def create
  		@user = User.new(user_params)
  		if @user.save
  			log_in @user
 	   		flash[:success] = "Welcome to the Sample App!"
 	   		redirect_to @user
  		else
    		render 'new'
  		end
	end
	
	
	def index
		@users = User.all
		if params[:search]
    	  	flash.now[:success] = "Filtered List"
    	   	@users = User.where('name LIKE ?', "%#{params[:search]}%")
    	else
    	  	@users = User.all
    	end
    end
	
	def add_trip
		user = User.find(params[:id])
		trip = Trip.find(params[:user_id])
		user.trips << trip
		redirect_to user_path(user)
	end
	
	def remove_trip
		user = User.find(params[:id])
		trip = Trip.find(params[:trip_id])
		user.trips.delete(trip)
		redirect_to user_path(user)
	end
	
	private
  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
  	
  	def logged_in_user
  		unless logged_in?
  			flash[:danger]= "Please log in."
  			redirect_to login_path
  		end
  	end
end
