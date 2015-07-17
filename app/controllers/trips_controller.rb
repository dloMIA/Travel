class TripsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy, :add_user]
  before_action :admin_user,     only: :destroy

  def index
  		@trips=Trip.all
  	end
  
  	def new
  		@trip=Trip.new
  	end
  
	def create
  		@trip = Trip.new(trip_params)	
  		@trip.lead=current_user.id
  		@trip.dest.split(",").each do |t|
  			@tags = @trip.tags.build(name: t.downcase.strip)
 		end 	
  		if @trip.save
      		flash[:success] = "Bom Voyage"
 			redirect_to @trip
  		else
    		render 'new'
  		end	
	end
	
	def show
		@trip = Trip.find(params[:id])
		@users = User.all
		@microposts = @trip.microposts
	end
	
	
	def edit
		@trip = Trip.find(params[:id])
	end
	
	def update
  		@trip = Trip.find(params[:id])
  		if @trip.update(trip_params)
  			flash[:success] = "Trip Profile updated"
    		redirect_to @trip
  		else
    		render 'edit'
  		end
  
	end
	
	def destroy
		Trip.find(params[:id]).destroy
		flash[:success]="Trip deleted"
		redirect_to trips_path
	end
	

	def add_user
  	 	trip = Trip.find(params[:id])
  	 	user = current_user
  	#OJO:or User.find(params[:user_id]) / wouldnt need @user=Users.all
  	 	trip.users << user
  	 	redirect_to trip_path(trip)
	end
	
	def remove_user
  	 	trip = Trip.find(params[:id])
  	 	user = User.find(params[:user_id])
  	 	trip.users.delete(user)
  	 	redirect_to trip_path(trip)
	end

	def logged_in_user
  		unless logged_in?
  			flash[:danger]= "Please log in."
  			redirect_to login_path
  		end
  	end


	private
  	def trip_params
    	params.require(:trip).permit(:name, :dest, :desc, :month, :image, :lead, :all_tags)
  	end	
  	
  	
  	
  	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
	
	

	
  	

end
