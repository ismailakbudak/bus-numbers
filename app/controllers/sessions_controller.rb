class SessionsController < ApplicationController
	
	def new
	end

	def create
  	    user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
		  sign_in user
		  redirect_to  root_path #user
		else
		  flash.now[:danger] =  I18n.t("views.session.invalid_data")
		  render 'new'
		end
	end

	def destroy
        sign_out
        redirect_to root_url
	end

end
