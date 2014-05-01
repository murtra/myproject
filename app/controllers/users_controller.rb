class UsersController < ApplicationController
	
before_filter :authenticate_user! 

    def show
	     @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def update_password
    	@user = User.find(current_user.id)
    	if @user.update_with_password(user_params)
    		sign_in @user, :bypass => true
    		redirect_to @user
    	else
    		render "edit"
    	end
    end

    private

    def user_params
    	params.require(:user).permit(:password, :password_confirmation, :current_password)
    end

end
