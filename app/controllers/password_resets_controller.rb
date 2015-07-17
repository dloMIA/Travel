class PasswordResetsController < ApplicationController
  def new
  end

	def create
		@user = User.find_by(email: params[:password_reset][:email].downcase)
	# User find by accesses model based on params passed in form..
	#..which generated create
		if @user
			@user.create_reset_digest
			@user.send_password_reset_email
			flash[:info] = "email sent with password reset instructions"
			redirect_to root_url
		else
			flash.now[:danger] = "Email address not found"
			render 'new'
		end
	end

  def edit
  end
  
  
end
