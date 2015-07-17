class FiltersController < ApplicationController
	def new
	end
	
	def index
		if params[:search]
    	  	flash.now[:success] = params[:search]
			@tags=Tag.find_by_name(params[:search])
			@trips = @tags.trips
	   	else
    	  	@trips=Trip.all	
    	end
  	end

end
