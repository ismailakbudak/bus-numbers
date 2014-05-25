class UsersController < ApplicationController
  
    def new
        @user = User.new  
    end

    def create
      @user = User.new( user_params )    
      if @user.save
         sign_in @user
         flash[:success] = t("application.welcome") # flash message	
         redirect_to root_path #@user #user has been saved succesfully
      else
        render 'new'
      end
    end

    private
        def user_params
          params.require(:user).permit( :username,
          	                            :name, 
          	                            :surname, 
          	                            :email, 
          	                            :birth_date,
          	                            :country,
          	                            :city,
          	                            :district,
          	                            :password,  
          	                            :password_confirmation)
        end

end
