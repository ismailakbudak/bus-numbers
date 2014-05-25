class UsersController < ApplicationController

    before_action :signed_in_user, only: [ :edit, :update, :edit_password, :update_password]
    before_action :correct_user,   only: [ :edit, :update]
  
    def index  
        redirect_to root_path  
    end
    
    def show
      @user = User.find(params[:id])
    end

    def new
        @user = User.new  
    end

    def create
      @user = User.new( user_params )    
      if @user.save
         sign_in @user
         flash[:success] = t("application.welcome") # flash message	
         redirect_to @user #user has been saved succesfully
      else 
         render 'new'
      end
    end

    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] =  t("views.user.flash_messages.user_updated")
        redirect_to @user
      else
        render 'edit'
      end
    end

    def edit_password
      @user = current_user
    end

    def update_password
      @user = User.find(current_user.id)
      if password_params[:password].blank? || password_params[:current_password].blank?
           flash[:danger] =  t("views.user.flash_messages.required_pass") 
           redirect_to password_path
      else
          if @user.authenticate(password_params[:current_password]) 
               @new_param = password_params.except(:current_password);
               if @user.update_attributes( @new_param )
                 flash[:success] =  t("views.user.flash_messages.pass_updated") 
                 redirect_to @user
               else
                 render "edit_password"
               end
          else
              flash[:danger] =  t("views.user.flash_messages.pass_wrong")
              render "edit_password"
          end  

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

        def password_params
          params.require(:user).permit( :current_password, :password, :password_confirmation)
        end

        def signed_in_user
          unless signed_in?
            flash[:info] = t('application.signin_please') 
            redirect_to signin_url
          end 
          #redirect_to signin_url, notice: t('application.signin_please') unless signed_in?
        end

        def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless current_user?(@user)
        end

end
