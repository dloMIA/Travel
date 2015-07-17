class MicropostsController < ApplicationController	
	before_action :logged_in_user, only: [:create, :update, :destroy]
  	
 

	def create
		@users= User.all
		@trip = Trip.find(params[:trip_id])
		@micropost = @trip.microposts.create(comment_params)
		@micropost.update(poster: current_user.id)
		flash[:success] = "Comment Added."
		redirect_to @trip
  	end
 
  	private
    def comment_params
      params.require(:micropost).permit(:content, :poster)
    end

	def logged_in_user
  		unless logged_in?
  			flash[:danger]= "Please log in."
  			redirect_to login_path
  		end
  	end



end
